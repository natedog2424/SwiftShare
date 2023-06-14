import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'countdown.dart';
import 'models/app_state_model.dart';

class ReceiveTab extends StatelessWidget {
  const ReceiveTab({super.key});

  Widget tabContents(context, AppStateModel model) {
    switch (model.receiveTabState) {
      case ReceiveTabState.idle:
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Receive',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                ElevatedButton(
                  onPressed: () {
                    //present dialog box asking for session code
                    TextEditingController receiveSessionCodeController =
                        TextEditingController();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Join Session'),
                          content: TextField(
                            controller: receiveSessionCodeController,
                            decoration: const InputDecoration(
                              hintText: 'Enter Session Code',
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                model.joinSession(
                                    receiveSessionCodeController.text, context);
                                Navigator.of(context).pop();
                              },
                              child: const Text('Join Session'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text('Join Session'),
                ),
              ],
            ),
          ),
        );
      case ReceiveTabState.fetchingSession:
        return const CircularProgressIndicator();
      case ReceiveTabState.sessionConnected:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              model.receiveFileSession.id,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            if (model.receiveFileSession.id != '')
              CountdownTimer(model.receiveFileSession.expires,
                  message: "Expires in: "),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: model.receiveFileSession.files
                    .map((file) => ListTile(
                        title: Text(file.name),
                        subtitle: Text(file.url),
                        trailing: IconButton(
                          icon: const Icon(Icons.download_rounded),
                          onPressed: () {
                            model.downloadFile(file);
                          },
                        )))
                    .toList(),
              ),
            ),
            FloatingActionButton.extended(
              label: const Text('Refresh'),
              onPressed: model.fetchSessionFiles,
              icon: const Icon(Icons.refresh_rounded),
            ),
          ],
        );
      default:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Error',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: () {
                model.setReceiveTabState(ReceiveTabState.idle);
              },
              child: const Text('Reset'),
            ),
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    AppStateModel model = Provider.of<AppStateModel>(context);

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: tabContents(context, model),
    );
  }
}
