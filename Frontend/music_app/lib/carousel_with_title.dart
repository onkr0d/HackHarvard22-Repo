import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

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
  // placeholder images
  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 10),
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          widget._title,
          style: const TextStyle(fontSize: 20, fontFamily: 'comic'), // we want custom fonts at one point https://docs.flutter.dev/cookbook/design/fonts
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
