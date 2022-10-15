class SpotifySong {
  String? _href;
  List<Items>? _items;
  int? _limit;
  String? _next;
  int? _offset;
  String? _previous;
  int? _total;

  SpotifySong(
      {String? href,
        List<Items>? items,
        int? limit,
        String? next,
        int? offset,
        String? previous,
        int? total}) {
    if (href != null) {
      _href = href;
    }
    if (items != null) {
      _items = items;
    }
    if (limit != null) {
      _limit = limit;
    }
    if (next != null) {
      _next = next;
    }
    if (offset != null) {
      _offset = offset;
    }
    if (previous != null) {
      _previous = previous;
    }
    if (total != null) {
      _total = total;
    }
  }

  String? get href => _href;
  set href(String? href) => _href = href;
  List<Items>? get items => _items;
  set items(List<Items>? items) => _items = items;
  int? get limit => _limit;
  set limit(int? limit) => _limit = limit;
  String? get next => _next;
  set next(String? next) => _next = next;
  int? get offset => _offset;
  set offset(int? offset) => _offset = offset;
  String? get previous => _previous;
  set previous(String? previous) => _previous = previous;
  int? get total => _total;
  set total(int? total) => _total = total;

  SpotifySong.fromJson(Map<String, dynamic> json) {
    _href = json['href'];
    if (json['items'] != null) {
      _items = <Items>[];
      json['items'].forEach((v) {
        _items!.add(Items.fromJson(v));
      });
    }
    _limit = json['limit'];
    _next = json['next'];
    _offset = json['offset'];
    _previous = json['previous'];
    _total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = _href;
    if (_items != null) {
      data['items'] = _items!.map((v) => v.toJson()).toList();
    }
    data['limit'] = _limit;
    data['next'] = _next;
    data['offset'] = _offset;
    data['previous'] = _previous;
    data['total'] = _total;
    return data;
  }
}

class Items {
  String? _addedAt;
  AddedBy? _addedBy;
  bool? _isLocal;
  Null? _primaryColor;
  Track? _track;
  VideoThumbnail? _videoThumbnail;

  Items(
      {String? addedAt,
        AddedBy? addedBy,
        bool? isLocal,
        Null? primaryColor,
        Track? track,
        VideoThumbnail? videoThumbnail}) {
    if (addedAt != null) {
      _addedAt = addedAt;
    }
    if (addedBy != null) {
      _addedBy = addedBy;
    }
    if (isLocal != null) {
      _isLocal = isLocal;
    }
    if (primaryColor != null) {
      _primaryColor = primaryColor;
    }
    if (track != null) {
      _track = track;
    }
    if (videoThumbnail != null) {
      _videoThumbnail = videoThumbnail;
    }
  }

  String? get addedAt => _addedAt;
  set addedAt(String? addedAt) => _addedAt = addedAt;
  AddedBy? get addedBy => _addedBy;
  set addedBy(AddedBy? addedBy) => _addedBy = addedBy;
  bool? get isLocal => _isLocal;
  set isLocal(bool? isLocal) => _isLocal = isLocal;
  Null? get primaryColor => _primaryColor;
  set primaryColor(Null? primaryColor) => _primaryColor = primaryColor;
  Track? get track => _track;
  set track(Track? track) => _track = track;
  VideoThumbnail? get videoThumbnail => _videoThumbnail;
  set videoThumbnail(VideoThumbnail? videoThumbnail) =>
      _videoThumbnail = videoThumbnail;

  Items.fromJson(Map<String, dynamic> json) {
    _addedAt = json['added_at'];
    _addedBy = json['added_by'] != null
        ? AddedBy.fromJson(json['added_by'])
        : null;
    _isLocal = json['is_local'];
    _primaryColor = json['primary_color'];
    _track = json['track'] != null ? Track.fromJson(json['track']) : null;
    _videoThumbnail = json['video_thumbnail'] != null
        ? VideoThumbnail.fromJson(json['video_thumbnail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['added_at'] = _addedAt;
    if (_addedBy != null) {
      data['added_by'] = _addedBy!.toJson();
    }
    data['is_local'] = _isLocal;
    data['primary_color'] = _primaryColor;
    if (_track != null) {
      data['track'] = _track!.toJson();
    }
    if (_videoThumbnail != null) {
      data['video_thumbnail'] = _videoThumbnail!.toJson();
    }
    return data;
  }
}

class AddedBy {
  ExternalUrls? _externalUrls;
  String? _href;
  String? _id;
  String? _type;
  String? _uri;

  AddedBy(
      {ExternalUrls? externalUrls,
        String? href,
        String? id,
        String? type,
        String? uri}) {
    if (externalUrls != null) {
      _externalUrls = externalUrls;
    }
    if (href != null) {
      _href = href;
    }
    if (id != null) {
      _id = id;
    }
    if (type != null) {
      _type = type;
    }
    if (uri != null) {
      _uri = uri;
    }
  }

  ExternalUrls? get externalUrls => _externalUrls;
  set externalUrls(ExternalUrls? externalUrls) => _externalUrls = externalUrls;
  String? get href => _href;
  set href(String? href) => _href = href;
  String? get id => _id;
  set id(String? id) => _id = id;
  String? get type => _type;
  set type(String? type) => _type = type;
  String? get uri => _uri;
  set uri(String? uri) => _uri = uri;

  AddedBy.fromJson(Map<String, dynamic> json) {
    _externalUrls = json['external_urls'] != null
        ? ExternalUrls.fromJson(json['external_urls'])
        : null;
    _href = json['href'];
    _id = json['id'];
    _type = json['type'];
    _uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_externalUrls != null) {
      data['external_urls'] = _externalUrls!.toJson();
    }
    data['href'] = _href;
    data['id'] = _id;
    data['type'] = _type;
    data['uri'] = _uri;
    return data;
  }
}

class ExternalUrls {
  String? _spotify;

  ExternalUrls({String? spotify}) {
    if (spotify != null) {
      _spotify = spotify;
    }
  }

  String? get spotify => _spotify;
  set spotify(String? spotify) => _spotify = spotify;

  ExternalUrls.fromJson(Map<String, dynamic> json) {
    _spotify = json['spotify'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['spotify'] = _spotify;
    return data;
  }
}

class Track {
  Album? _album;
  List<Artists>? _artists;
  int? _discNumber;
  int? _durationMs;
  bool? _episode;
  bool? _explicit;
  ExternalIds? _externalIds;
  ExternalUrls? _externalUrls;
  String? _href;
  String? _id;
  bool? _isLocal;
  bool? _isPlayable;
  String? _name;
  int? _popularity;
  String? _previewUrl;
  bool? _track;
  int? _trackNumber;
  String? _type;
  String? _uri;

  Track(
      {Album? album,
        List<Artists>? artists,
        int? discNumber,
        int? durationMs,
        bool? episode,
        bool? explicit,
        ExternalIds? externalIds,
        ExternalUrls? externalUrls,
        String? href,
        String? id,
        bool? isLocal,
        bool? isPlayable,
        String? name,
        int? popularity,
        String? previewUrl,
        bool? track,
        int? trackNumber,
        String? type,
        String? uri}) {
    if (album != null) {
      _album = album;
    }
    if (artists != null) {
      _artists = artists;
    }
    if (discNumber != null) {
      _discNumber = discNumber;
    }
    if (durationMs != null) {
      _durationMs = durationMs;
    }
    if (episode != null) {
      _episode = episode;
    }
    if (explicit != null) {
      _explicit = explicit;
    }
    if (externalIds != null) {
      _externalIds = externalIds;
    }
    if (externalUrls != null) {
      _externalUrls = externalUrls;
    }
    if (href != null) {
      _href = href;
    }
    if (id != null) {
      _id = id;
    }
    if (isLocal != null) {
      _isLocal = isLocal;
    }
    if (isPlayable != null) {
      _isPlayable = isPlayable;
    }
    if (name != null) {
      _name = name;
    }
    if (popularity != null) {
      _popularity = popularity;
    }
    if (previewUrl != null) {
      _previewUrl = previewUrl;
    }
    if (track != null) {
      _track = track;
    }
    if (trackNumber != null) {
      _trackNumber = trackNumber;
    }
    if (type != null) {
      _type = type;
    }
    if (uri != null) {
      _uri = uri;
    }
  }

  Album? get album => _album;
  set album(Album? album) => _album = album;
  List<Artists>? get artists => _artists;
  set artists(List<Artists>? artists) => _artists = artists;
  int? get discNumber => _discNumber;
  set discNumber(int? discNumber) => _discNumber = discNumber;
  int? get durationMs => _durationMs;
  set durationMs(int? durationMs) => _durationMs = durationMs;
  bool? get episode => _episode;
  set episode(bool? episode) => _episode = episode;
  bool? get explicit => _explicit;
  set explicit(bool? explicit) => _explicit = explicit;
  ExternalIds? get externalIds => _externalIds;
  set externalIds(ExternalIds? externalIds) => _externalIds = externalIds;
  ExternalUrls? get externalUrls => _externalUrls;
  set externalUrls(ExternalUrls? externalUrls) => _externalUrls = externalUrls;
  String? get href => _href;
  set href(String? href) => _href = href;
  String? get id => _id;
  set id(String? id) => _id = id;
  bool? get isLocal => _isLocal;
  set isLocal(bool? isLocal) => _isLocal = isLocal;
  bool? get isPlayable => _isPlayable;
  set isPlayable(bool? isPlayable) => _isPlayable = isPlayable;
  String? get name => _name;
  set name(String? name) => _name = name;
  int? get popularity => _popularity;
  set popularity(int? popularity) => _popularity = popularity;
  String? get previewUrl => _previewUrl;
  set previewUrl(String? previewUrl) => _previewUrl = previewUrl;
  bool? get track => _track;
  set track(bool? track) => _track = track;
  int? get trackNumber => _trackNumber;
  set trackNumber(int? trackNumber) => _trackNumber = trackNumber;
  String? get type => _type;
  set type(String? type) => _type = type;
  String? get uri => _uri;
  set uri(String? uri) => _uri = uri;

  Track.fromJson(Map<String, dynamic> json) {
    _album = json['album'] != null ? Album.fromJson(json['album']) : null;
    if (json['artists'] != null) {
      _artists = <Artists>[];
      json['artists'].forEach((v) {
        _artists!.add(Artists.fromJson(v));
      });
    }
    _discNumber = json['disc_number'];
    _durationMs = json['duration_ms'];
    _episode = json['episode'];
    _explicit = json['explicit'];
    _externalIds = json['external_ids'] != null
        ? ExternalIds.fromJson(json['external_ids'])
        : null;
    _externalUrls = json['external_urls'] != null
        ? ExternalUrls.fromJson(json['external_urls'])
        : null;
    _href = json['href'];
    _id = json['id'];
    _isLocal = json['is_local'];
    _isPlayable = json['is_playable'];
    _name = json['name'];
    _popularity = json['popularity'];
    _previewUrl = json['preview_url'];
    _track = json['track'];
    _trackNumber = json['track_number'];
    _type = json['type'];
    _uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_album != null) {
      data['album'] = _album!.toJson();
    }
    if (_artists != null) {
      data['artists'] = _artists!.map((v) => v.toJson()).toList();
    }
    data['disc_number'] = _discNumber;
    data['duration_ms'] = _durationMs;
    data['episode'] = _episode;
    data['explicit'] = _explicit;
    if (_externalIds != null) {
      data['external_ids'] = _externalIds!.toJson();
    }
    if (_externalUrls != null) {
      data['external_urls'] = _externalUrls!.toJson();
    }
    data['href'] = _href;
    data['id'] = _id;
    data['is_local'] = _isLocal;
    data['is_playable'] = _isPlayable;
    data['name'] = _name;
    data['popularity'] = _popularity;
    data['preview_url'] = _previewUrl;
    data['track'] = _track;
    data['track_number'] = _trackNumber;
    data['type'] = _type;
    data['uri'] = _uri;
    return data;
  }
}

class Album {
  String? _albumType;
  List<Artists>? _artists;
  ExternalUrls? _externalUrls;
  String? _href;
  String? _id;
  List<Images>? _images;
  String? _name;
  String? _releaseDate;
  String? _releaseDatePrecision;
  int? _totalTracks;
  String? _type;
  String? _uri;

  Album(
      {String? albumType,
        List<Artists>? artists,
        ExternalUrls? externalUrls,
        String? href,
        String? id,
        List<Images>? images,
        String? name,
        String? releaseDate,
        String? releaseDatePrecision,
        int? totalTracks,
        String? type,
        String? uri}) {
    if (albumType != null) {
      _albumType = albumType;
    }
    if (artists != null) {
      _artists = artists;
    }
    if (externalUrls != null) {
      _externalUrls = externalUrls;
    }
    if (href != null) {
      _href = href;
    }
    if (id != null) {
      _id = id;
    }
    if (images != null) {
      _images = images;
    }
    if (name != null) {
      _name = name;
    }
    if (releaseDate != null) {
      _releaseDate = releaseDate;
    }
    if (releaseDatePrecision != null) {
      _releaseDatePrecision = releaseDatePrecision;
    }
    if (totalTracks != null) {
      _totalTracks = totalTracks;
    }
    if (type != null) {
      _type = type;
    }
    if (uri != null) {
      _uri = uri;
    }
  }

  String? get albumType => _albumType;
  set albumType(String? albumType) => _albumType = albumType;
  List<Artists>? get artists => _artists;
  set artists(List<Artists>? artists) => _artists = artists;
  ExternalUrls? get externalUrls => _externalUrls;
  set externalUrls(ExternalUrls? externalUrls) => _externalUrls = externalUrls;
  String? get href => _href;
  set href(String? href) => _href = href;
  String? get id => _id;
  set id(String? id) => _id = id;
  List<Images>? get images => _images;
  set images(List<Images>? images) => _images = images;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get releaseDate => _releaseDate;
  set releaseDate(String? releaseDate) => _releaseDate = releaseDate;
  String? get releaseDatePrecision => _releaseDatePrecision;
  set releaseDatePrecision(String? releaseDatePrecision) =>
      _releaseDatePrecision = releaseDatePrecision;
  int? get totalTracks => _totalTracks;
  set totalTracks(int? totalTracks) => _totalTracks = totalTracks;
  String? get type => _type;
  set type(String? type) => _type = type;
  String? get uri => _uri;
  set uri(String? uri) => _uri = uri;

  Album.fromJson(Map<String, dynamic> json) {
    _albumType = json['album_type'];
    if (json['artists'] != null) {
      _artists = <Artists>[];
      json['artists'].forEach((v) {
        _artists!.add(Artists.fromJson(v));
      });
    }
    _externalUrls = json['external_urls'] != null
        ? ExternalUrls.fromJson(json['external_urls'])
        : null;
    _href = json['href'];
    _id = json['id'];
    if (json['images'] != null) {
      _images = <Images>[];
      json['images'].forEach((v) {
        _images!.add(Images.fromJson(v));
      });
    }
    _name = json['name'];
    _releaseDate = json['release_date'];
    _releaseDatePrecision = json['release_date_precision'];
    _totalTracks = json['total_tracks'];
    _type = json['type'];
    _uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['album_type'] = _albumType;
    if (_artists != null) {
      data['artists'] = _artists!.map((v) => v.toJson()).toList();
    }
    if (_externalUrls != null) {
      data['external_urls'] = _externalUrls!.toJson();
    }
    data['href'] = _href;
    data['id'] = _id;
    if (_images != null) {
      data['images'] = _images!.map((v) => v.toJson()).toList();
    }
    data['name'] = _name;
    data['release_date'] = _releaseDate;
    data['release_date_precision'] = _releaseDatePrecision;
    data['total_tracks'] = _totalTracks;
    data['type'] = _type;
    data['uri'] = _uri;
    return data;
  }
}

class Artists {
  ExternalUrls? _externalUrls;
  String? _href;
  String? _id;
  String? _name;
  String? _type;
  String? _uri;

  Artists(
      {ExternalUrls? externalUrls,
        String? href,
        String? id,
        String? name,
        String? type,
        String? uri}) {
    if (externalUrls != null) {
      _externalUrls = externalUrls;
    }
    if (href != null) {
      _href = href;
    }
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (type != null) {
      _type = type;
    }
    if (uri != null) {
      _uri = uri;
    }
  }

  ExternalUrls? get externalUrls => _externalUrls;
  set externalUrls(ExternalUrls? externalUrls) => _externalUrls = externalUrls;
  String? get href => _href;
  set href(String? href) => _href = href;
  String? get id => _id;
  set id(String? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get type => _type;
  set type(String? type) => _type = type;
  String? get uri => _uri;
  set uri(String? uri) => _uri = uri;

  Artists.fromJson(Map<String, dynamic> json) {
    _externalUrls = json['external_urls'] != null
        ? ExternalUrls.fromJson(json['external_urls'])
        : null;
    _href = json['href'];
    _id = json['id'];
    _name = json['name'];
    _type = json['type'];
    _uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_externalUrls != null) {
      data['external_urls'] = _externalUrls!.toJson();
    }
    data['href'] = _href;
    data['id'] = _id;
    data['name'] = _name;
    data['type'] = _type;
    data['uri'] = _uri;
    return data;
  }
}

class Images {
  int? _height;
  String? _url;
  int? _width;

  Images({int? height, String? url, int? width}) {
    if (height != null) {
      _height = height;
    }
    if (url != null) {
      _url = url;
    }
    if (width != null) {
      _width = width;
    }
  }

  int? get height => _height;
  set height(int? height) => _height = height;
  String? get url => _url;
  set url(String? url) => _url = url;
  int? get width => _width;
  set width(int? width) => _width = width;

  Images.fromJson(Map<String, dynamic> json) {
    _height = json['height'];
    _url = json['url'];
    _width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['height'] = _height;
    data['url'] = _url;
    data['width'] = _width;
    return data;
  }
}

class ExternalIds {
  String? _isrc;

  ExternalIds({String? isrc}) {
    if (isrc != null) {
      _isrc = isrc;
    }
  }

  String? get isrc => _isrc;
  set isrc(String? isrc) => _isrc = isrc;

  ExternalIds.fromJson(Map<String, dynamic> json) {
    _isrc = json['isrc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isrc'] = _isrc;
    return data;
  }
}

class VideoThumbnail {
  Null? _url;

  VideoThumbnail({Null? url}) {
    if (url != null) {
      _url = url;
    }
  }

  Null? get url => _url;
  set url(Null? url) => _url = url;

  VideoThumbnail.fromJson(Map<String, dynamic> json) {
    _url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = _url;
    return data;
  }
}
