class SongItem {
  late final String songTitle;
  late final String songCoverUrl;
  late final String songArtist;

  SongItem(songTitle,this.songCoverUrl, songArtist) {
    this.songTitle = truncateWithEllipsis(45, songTitle);
    this.songArtist = truncateWithEllipsis(45, songArtist);
  }
}

  String truncateWithEllipsis(int cutoff, String myString) {
    return (myString.length <= cutoff)
        ? myString
        : '${myString.substring(0, cutoff)}...';
}
