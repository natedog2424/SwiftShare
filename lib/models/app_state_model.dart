import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'alias-generator.dart';
import 'package:file_saver/file_saver.dart';

enum SendTabState {
  idle,
  requestingSession,
  awatingFiles,
  uploadingFiles,
  complete,
  expired,
  error,
}

enum ReceiveTabState {
  idle,
  fetchingSession,
  sessionConnected,
  error,
}

enum FileTransferState {
  idle,
  uploading,
  complete,
  error,
}

enum MessageType {
  warning,
  error,
  info,
  success,
}

class FileUpload {
  final String name;
  final int size;
  int progress = 0;
  FileTransferState state = FileTransferState.uploading;

  FileUpload({
    required this.name,
    required this.size,
  });
}

class FileDownload {
  final String name;
  final int size;
  final String url;

  FileDownload({
    required this.name,
    required this.size,
    required this.url,
  });
}

class SendFileSession {
  final String id;
  final DateTime created;
  final DateTime expires;
  List<FileUpload> files = [];

  SendFileSession({
    required this.id,
    required this.created,
    required this.expires,
  });

  static SendFileSession none = SendFileSession(
    id: '',
    created: DateTime.now(),
    expires: DateTime.now(),
  );
}

class ReceiveFileSession {
  final String id;
  final DateTime expires;
  List<FileDownload> files = [];

  ReceiveFileSession({
    required this.id,
    required this.expires,
  });

  static ReceiveFileSession none = ReceiveFileSession(
    id: '',
    expires: DateTime.now(),
  );
}

class AppStateModel with ChangeNotifier {
  AppStateModel({
    required this.currentTab,
  });

  static const maxFileSize = 1024 * 1024 * 100; // 100 MB

  int currentTab;

  SendTabState sendTabState = SendTabState.idle;
  ReceiveTabState receiveTabState = ReceiveTabState.idle;

  SendFileSession sendFileSession = SendFileSession.none;
  ReceiveFileSession receiveFileSession = ReceiveFileSession.none;

  void setSendTabState(SendTabState newState) {
    sendTabState = newState;
    notifyListeners();
  }

  void setReceiveTabState(ReceiveTabState newState) {
    receiveTabState = newState;
    notifyListeners();
  }

  void setCurrentTab(int newTab) {
    currentTab = newTab;
    notifyListeners();
  }

  void showSnackbarMessage(
      MessageType type, String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: type == MessageType.error
          ? Colors.red
          : type == MessageType.warning
              ? Colors.orange
              : type == MessageType.success
                  ? Colors.green
                  : Colors.blue,
    ));
  }

  Future<SendFileSession> requestSession() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference sessions = firestore.collection('sessions');

    /* Here is code for deleting any expired sessions
    doing this client side for now, but should be done server side.
    running cloud functions requires billing account and I do not
    want to get charged for this project.
    */

    final DateTime now = DateTime.now();

    sessions.where('expires', isLessThan: now).get().then((value) {
      for (var doc in value.docs) {
        //delete storage folder associated to session
        FirebaseStorage.instance.ref(doc.id).listAll().then((result) {
          for (var ref in result.items) {
            ref.delete();
          }
        });
        //delete session document
        doc.reference.delete();
      }
    });

    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    SendFileSession session = SendFileSession.none;

    String alias;

    int attempts = 10;
    do {
      alias = AliasGenerator.generate();
      attempts--;

      if (attempts == 0) {
        setSendTabState(SendTabState.error);
        return session;
      }
    } while ((await sessions.doc(alias).get()).exists);

    final DateTime expires = now.add(const Duration(minutes: 10));

    await sessions.doc(alias).set({
      'created': now,
      'expires': expires,
    }).then((value) {
      setSendTabState(SendTabState.awatingFiles);
      session = SendFileSession(
        id: alias,
        created: now,
        expires: expires,
      );
    }).catchError((error) {
      print('Failed to create session: $error');
      setSendTabState(SendTabState.error);
    });

    setSendTabState(SendTabState.requestingSession);

    return session;
  }

  void downloadFile(FileDownload file) async {
    final storageRef = FirebaseStorage.instance.ref();
    final fileRef = storageRef.child(file.url);

    try {
      final Uint8List? data = await fileRef.getData(maxFileSize);
      await FileSaver.instance.saveFile(name: file.name, bytes: data!);
    } on FirebaseException catch (e) {
      setReceiveTabState(ReceiveTabState.error);
    }
  }

  void fetchSessionFiles() {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child(receiveFileSession.id);

    receiveFileSession.files.clear();

    ref.listAll().then((result) {
      for (var ref in result.items) {
        ref.getMetadata().then((metadata) {
          receiveFileSession.files.add(FileDownload(
            name: metadata.name ?? '',
            size: metadata.size ?? 0,
            url: metadata.fullPath,
          ));
          notifyListeners();
        });
      }
    }).catchError((error) {
      print('Failed to fetch session files: $error');
      setReceiveTabState(ReceiveTabState.error);
    });
  }

  void joinSession(String name, BuildContext context) {
    setReceiveTabState(ReceiveTabState.fetchingSession);
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference sessions = firestore.collection('sessions');
    sessions.doc(name).get().then((DocumentSnapshot doc) {
      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        setReceiveTabState(ReceiveTabState.sessionConnected);
        receiveFileSession = ReceiveFileSession(
          id: name,
          expires: data['expires'].toDate(),
        );
        fetchSessionFiles();
      } else {
        setReceiveTabState(ReceiveTabState.idle);
        showSnackbarMessage(
            MessageType.warning,
            "Session '$name' does not exist, check spelling and try again",
            context);
      }
    }).catchError((error) {
      showSnackbarMessage(
          MessageType.error, 'Failed to join session: $error', context);
      setReceiveTabState(ReceiveTabState.idle);
    });
  }

  /*void addFileToSession(FileUpload file) {
    sendFileSession.files.add(file);

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference sessions = firestore.collection('sessions');

    sessions.doc(sendFileSession.id).collection("files").add({
      'name': file.name,
      'size': file.size,
    }).then((value) {
      print('File added to session: ${value.id}');
    }).catchError((error) {
      print('Failed to add file to session: $error');
    });
  }*/

  void uploadFiles(BuildContext context) async {
    //check if a session exists and is valid, if not create one
    if (sendFileSession.id == '' ||
        sendFileSession.expires.isBefore(DateTime.now())) {
      sendFileSession = await requestSession();

      //if the session is still invalid, return
      if (sendFileSession.id == '' ||
          sendFileSession.expires.isBefore(DateTime.now())) {
        if (context.mounted) {
          showSnackbarMessage(MessageType.error,
              "System failure. Please contact administrator", context);
        }
        return;
      }
    }

    //open file picker
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    Map<String, Uint8List> files = {};
    if (result != null) {
      for (var file in result.files) {
        if (file.size > maxFileSize) {
          if (context.mounted) {
            showSnackbarMessage(
                MessageType.error, "File ${file.name} is too large", context);
          }
          continue;
        }
        files[file.name] = file.bytes!;
      }
      ;
    } else {
      return;
    }

    //upload files
    setSendTabState(SendTabState.uploadingFiles);

    final FirebaseStorage storage = FirebaseStorage.instance;
    final storageRef = storage.ref();
    final sessionRef = storageRef.child(sendFileSession.id);

    files.forEach((name, file) async {
      try {
        final fileRef = sessionRef.child(name);
        FileUpload fileUpload = FileUpload(name: name, size: file.length);
        sendFileSession.files.add(fileUpload);
        await fileRef.putData(file).snapshotEvents.listen((taskSnapshot) {
          switch (taskSnapshot.state) {
            case TaskState.running:
              fileUpload.progress = taskSnapshot.bytesTransferred;
              notifyListeners();
              break;
            case TaskState.paused:
              fileUpload.state = FileTransferState.idle;
              notifyListeners();
              break;
            case TaskState.success:
              fileUpload.state = FileTransferState.complete;
              notifyListeners();
              break;
            case TaskState.canceled:
              setSendTabState(SendTabState.error);
              break;
            case TaskState.error:
              setSendTabState(SendTabState.error);
              break;
          }
        });
        //.then((p0) => addFileToSession(FileUpload(name: name, size: p0.totalBytes)));
      } on FirebaseException catch (e) {
        setSendTabState(SendTabState.error);
      }
    });
  }
}
