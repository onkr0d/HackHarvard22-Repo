import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  // This has to be nullable because iOS simulators suck and don't have a camera
  final List<CameraDescription>? cameraDescription;

  const CameraPage({super.key, required this.cameraDescription});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> with TickerProviderStateMixin {
  late CameraController? _controller = null;
  late AnimationController animationController;

  @override
  void initState() {
    // yeah this is hardcoded. shut up.
    _controller = CameraController(
        widget.cameraDescription!.elementAt(1), ResolutionPreset.max);
    _controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('User denied camera access.');
            break;
          default:
            print('Handle other errors.');
            break;
        }
      }
    });

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
    Widget toReturn = _controller == null
        ? CircularProgressIndicator(
            value: animationController.value,
            semanticsLabel: 'Circular progress indicator',
          )
        : CameraPreview(_controller!);
    return Align(
        alignment: Alignment.center,
        child:
            // Column(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly, children:
            toReturn
        // ),
        );
  }
}
