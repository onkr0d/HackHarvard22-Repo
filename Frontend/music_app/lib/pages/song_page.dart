import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/network/network_misc.dart';

import '../components/song_item.dart';

class SongPage extends StatefulWidget {
  late List<SongItem> songs;
  String emotion;

  SongPage({super.key, required this.emotion});

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  List<SongItem> songs = [];

  @override
  void initState() {
    super.initState();
    requestSongs();
  }

  void requestSongs() async {
    for (int i = 0; i < 6; i++) {
      songs.add(await NetworkMisc.findSongByQuery(widget.emotion));
    }

    var city = await NetworkMisc.findCity();
    for (int i = 0; i < 2; i++) {
      songs.add(await NetworkMisc.findSongByQuery(city));
    }
    setState(() {
      widget.songs = songs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Song Recommendations'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: (songs.map((song) => Row(
                  children: <Widget>[
                    Image.network(
                      song.songCoverUrl,
                      width: 128,
                      height: 128,
                      fit: BoxFit.scaleDown,
                    ),
                    Column(
                      children: [
                        Text(song.songArtist),
                        Text(song.songTitle),
                      ],
                    )
                  ],
                ))).toList(),
          ),
        ));
  }
}
