import 'package:flutter/widgets.dart';

class ImageWithLoadingIndicator extends StatefulWidget {
  final Image image;
  final bool isLoading;

  const ImageWithLoadingIndicator(
      {super.key, required this.image, required this.isLoading});

  @override
  State<ImageWithLoadingIndicator> createState() =>
      _ImageWithLoadingIndicatorState();
}

class _ImageWithLoadingIndicatorState extends State<ImageWithLoadingIndicator> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('yolo'));
  }
}
