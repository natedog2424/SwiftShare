import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swift_share/receive_tab.dart';
import 'package:swift_share/send_tab.dart';
import 'firebase_options.dart';
import 'tabbed_page.dart';
import 'package:provider/provider.dart';
import 'models/app_state_model.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //FirebaseStorage.instance.useStorageEmulator("localhost", 9199);
  //FirebaseFirestore.instance.useFirestoreEmulator("localhost", 8080);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppStateModel>(
          create: (_) => AppStateModel(currentTab: 0),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: false,
        ),
        home: MyHomePage(
          [
            TabbedPage(
              title: 'Send',
              icon: Icons.cloud_upload_rounded,
              builder: (context) => const SendTab(),
            ),
            TabbedPage(
              title: 'Receive',
              icon: Icons.download_rounded,
              builder: (context) => const ReceiveTab(),
            ),
          ],
          title: 'Swift Share',
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage(this.tabs, {super.key, required this.title});

  final String title;
  final List<TabbedPage> tabs;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Consumer<AppStateModel>(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            // TRY THIS: Try changing the color here to a specific color (to
            // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
            // change color while the other colors stay the same.
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text(widget.title),
          ),
          body: widget.tabs[model.currentTab].builder(context),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              for (final tab in widget.tabs)
                BottomNavigationBarItem(
                  icon: Icon(tab.icon),
                  label: tab.title,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
            ],
            currentIndex: model.currentTab,
            onTap: (value) => Provider.of<AppStateModel>(context, listen: false)
                .setCurrentTab(value),
          ),
        );
      },
    );
  }
}
