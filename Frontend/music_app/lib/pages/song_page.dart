import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SongPage extends StatefulWidget {
  final List<String> songNames;
  final List<Image> songImages;
  final List<int> songLengths;

  const SongPage(
      {super.key,
      required this.songNames,
      required this.songImages,
      required this.songLengths});

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      columnWidths: const <int, TableColumnWidth>{
        0: IntrinsicColumnWidth(),
        1: FlexColumnWidth(),
        2: FixedColumnWidth(64),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: const <TableRow>[
        TableRow(
          children: <Widget>[
            Text('song image'),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.top,
              child: Text('song name'),
            ),
            Text('runtime'),
          ],
        ),
      ],
    );
  }
}
