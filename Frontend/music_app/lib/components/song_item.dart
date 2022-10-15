import 'package:flutter/cupertino.dart';

class SongItem extends StatefulWidget {
  final String songName;
  final Image songImage;
  final String songAuthor;

  const SongItem(
      {super.key,
      required this.songName,
      required this.songImage,
      required this.songAuthor});

  @override
  State<SongItem> createState() => _SongItemState();
}

class _SongItemState extends State<SongItem> {
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
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            widget.songImage,
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.top,
              child: Text(widget.songName),
            ),
            Text(widget.songAuthor),
          ],
        ),
      ],
    );
  }
}