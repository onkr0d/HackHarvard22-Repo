import 'package:flutter/material.dart';

/// A loading screen to use while waiting for data to load.
/// It'll gray out the screen and show a loading indicator.
class LoadingScreen extends StatefulWidget {
  final Image image;

  const LoadingScreen({super.key, required this.image});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ColorFiltered(
          colorFilter: const ColorFilter.mode(
            Colors.grey,
            BlendMode.saturation,
          ),
          child: widget.image,
        ),
        const Center(
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}
