import 'package:flutter/material.dart';
import 'package:music_app/components/carousel_with_title.dart';
import 'package:music_app/components/greeting.dart';
import 'package:music_app/pages/camera_page.dart';
import 'package:camera/camera.dart';
import 'package:music_app/pages/song_page.dart';

late List<CameraDescription> _cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _cameras = await availableCameras();
  runApp(const MusicApp());
}

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final List<String> imageList = [
    "https://picsum.photos/960/721",
    "https://picsum.photos/960/722",
    "https://picsum.photos/960/723",
    "https://picsum.photos/960/724",
    "https://picsum.photos/960/725",
    "https://picsum.photos/960/726"
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: const SongPage()
          // Our body will have to switch between Camera and Song pages.
          // CameraPage(
          //   cameraDescription: _cameras.isEmpty ? null : _cameras.first,
          ),
      theme: ThemeData(
        brightness: Brightness.light,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark,
    );
  }
}
