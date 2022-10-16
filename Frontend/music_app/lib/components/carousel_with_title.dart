import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

/// This class may or many not be useless 🤠
class CarouselWithTitle extends StatefulWidget {
  final String _title;
  final List<String> _items;

  const CarouselWithTitle({super.key, required items, required title})
      : _items = items,
        _title = title;

  @override
  State<CarouselWithTitle> createState() => _CarouselWithTitleState();
}

class _CarouselWithTitleState extends State<CarouselWithTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 10),
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          widget._title,
          style: const TextStyle(
              fontSize: 20,
              fontFamily:
                  'comic'), // we want custom fonts at one point https://docs.flutter.dev/cookbook/design/fonts
        ),
      ),
      GFCarousel(
        items: widget._items.map(
          (url) {
            return Container(
              margin: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Image.network(url, fit: BoxFit.cover, width: 1000.0),
              ),
            );
          },
        ).toList(),
        onPageChanged: (index) {
          setState(() {
            index;
          });
        },
      ),
    ]);
  }
}
