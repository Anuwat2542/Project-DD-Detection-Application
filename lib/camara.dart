import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
//import 'package:path_provider/path_provider.dart';

List<CameraDescription>? cameras;

class CameraApp extends StatelessWidget {
  const CameraApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DriveDrowsiness',
      theme: ThemeData(
        primarySwatch:  Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'DriveDrowsiness Application'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CameraController? controller;
  @override
  void initState(){
    loadCamera();
    super.initState();
  }
  void loadCamera() async {
    cameras = await availableCameras();
    if(cameras != null){
      controller = CameraController(cameras![1],ResolutionPreset.max);
      controller!.initialize().then((_){
        if(!mounted) return;
        setState((){});
      });
    }else{
      print("No any Camera Found");
    }
  }  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: controller == null?
        const Center(child: Text('Loading Camera...'),):
        CameraPreview(controller!),
      ),
    );
  }
}
