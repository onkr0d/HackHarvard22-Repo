import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  // This has to be nullable because iOS simulators suck and don't have a camera
  final CameraDescription? cameraDescription;

  const CameraPage({super.key, required this.cameraDescription});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> with TickerProviderStateMixin {
  late CameraController? _controller = null;
  late AnimationController animationController;

  @override
  void initState() {
    if (widget.cameraDescription != null) {
      _controller =
          CameraController(widget.cameraDescription!, ResolutionPreset.max);
    }

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    animationController.repeat(reverse: true);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> toReturn = _controller == null
        ? <Widget>[
            CircularProgressIndicator(
              value: animationController.value,
              semanticsLabel: 'Circular progress indicator',
            ),
            const Text('Camera loading')
          ]
        : <Widget>[CameraPreview(_controller!)];
    return Align(
      alignment: Alignment.center,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: toReturn),
    );
  }
}
