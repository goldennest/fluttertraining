import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class MusicModel extends Equatable {
  final String? wrapperType;
  final String? kind;
  final int? collectionId;
  final int? trackId;
  final String? artistName;
  final String? collectionName;
  final String? trackName;
  final String? collectionCensoredName;
  final String? trackCensoredName;
  final int? collectionArtistId;
  final String? collectionArtistViewUrl;
  final String? collectionViewUrl;
  final String? trackViewUrl;
  final String? previewUrl;
  final String? artworkUrl30;
  final String? artworkUrl60;
  final String? artworkUrl100;
  final double? collectionPrice;
  final double? trackPrice;
  final double? collectionHdPrice;
  final double? trackHdPrice;
  final DateTime? releaseDate;
  final String? collectionExplicitness;
  final String? trackExplicitness;
  final int? trackCount;
  final int? trackNumber;
  final int? trackTimeMillis;
  final String? country;
  final String? currency;
  final String? primaryGenreName;
  final String? contentAdvisoryRating;
  final String? shortDescription;
  final String? longDescription;
  final bool? hasITunesExtras;

  String? get trackDurationInMinutestr {
    if (trackDurationInSecond == null) return null;
    int sec = trackDurationInSecond!;
    num minute = (sec / 60);
    var hour=0;
    if (minute.toInt()> 60)
       num hour=minute/60;
    int balance = (sec % 60);
    return "${hour.toInt()}:${minute.toInt()}" + (balance == 0 ? "" : ":$balance");
  }

  int? get trackDurationInSecond {
    return trackTimeMillis == null ? null : (trackTimeMillis! / 1000).toInt();
  }

  String? get releaseDateStr => releaseDate == null
      ? null
      : DateFormat("dd-MMM-yyyy").format(releaseDate!);

  const MusicModel({
    this.wrapperType,
    this.kind,
    this.collectionId,
    this.trackId,
    this.artistName,
    this.collectionName,
    this.trackName,
    this.collectionCensoredName,
    this.trackCensoredName,
    this.collectionArtistId,
    this.collectionArtistViewUrl,
    this.collectionViewUrl,
    this.trackViewUrl,
    this.previewUrl,
    this.artworkUrl30,
    this.artworkUrl60,
    this.artworkUrl100,
    this.collectionPrice,
    this.trackPrice,
    this.collectionHdPrice,
    this.trackHdPrice,
    this.releaseDate,
    this.collectionExplicitness,
    this.trackExplicitness,
    this.trackCount,
    this.trackNumber,
    this.trackTimeMillis,
    this.country,
    this.currency,
    this.primaryGenreName,
    this.contentAdvisoryRating,
    this.shortDescription,
    this.longDescription,
    this.hasITunesExtras,
  });

  factory MusicModel.fromMap(Map<String, dynamic> data) => MusicModel(
        wrapperType: data['wrapperType'] as String?,
        kind: data['kind'] as String?,
        collectionId: data['collectionId'] as int?,
        trackId: data['trackId'] as int?,
        artistName: data['artistName'] as String?,
        collectionName: data['collectionName'] as String?,
        trackName: data['trackName'] as String?,
        collectionCensoredName: data['collectionCensoredName'] as String?,
        trackCensoredName: data['trackCensoredName'] as String?,
        collectionArtistId: data['collectionArtistId'] as int?,
        collectionArtistViewUrl: data['collectionArtistViewUrl'] as String?,
        collectionViewUrl: data['collectionViewUrl'] as String?,
        trackViewUrl: data['trackViewUrl'] as String?,
        previewUrl: data['previewUrl'] as String?,
        artworkUrl30: data['artworkUrl30'] as String?,
        artworkUrl60: data['artworkUrl60'] as String?,
        artworkUrl100: data['artworkUrl100'] as String?,
        collectionPrice: (data['collectionPrice'] as num?)?.toDouble(),
        trackPrice: (data['trackPrice'] as num?)?.toDouble(),
        collectionHdPrice: (data['collectionHdPrice'] as num?)?.toDouble(),
        trackHdPrice: (data['trackHdPrice'] as num?)?.toDouble(),
        releaseDate: data['releaseDate'] == null
            ? null
            : DateFormat("yyyy-mm-ddTHH:MM:SSZ").parse(data['releaseDate']),
        collectionExplicitness: data['collectionExplicitness'] as String?,
        trackExplicitness: data['trackExplicitness'] as String?,
        trackCount: data['trackCount'] as int?,
        trackNumber: data['trackNumber'] as int?,
        trackTimeMillis: data['trackTimeMillis'] as int?,
        country: data['country'] as String?,
        currency: data['currency'] as String?,
        primaryGenreName: data['primaryGenreName'] as String?,
        contentAdvisoryRating: data['contentAdvisoryRating'] as String?,
        shortDescription: data['shortDescription'] as String?,
        longDescription: data['longDescription'] as String?,
        hasITunesExtras: data['hasITunesExtras'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'wrapperType': wrapperType,
        'kind': kind,
        'collectionId': collectionId,
        'trackId': trackId,
        'artistName': artistName,
        'collectionName': collectionName,
        'trackName': trackName,
        'collectionCensoredName': collectionCensoredName,
        'trackCensoredName': trackCensoredName,
        'collectionArtistId': collectionArtistId,
        'collectionArtistViewUrl': collectionArtistViewUrl,
        'collectionViewUrl': collectionViewUrl,
        'trackViewUrl': trackViewUrl,
        'previewUrl': previewUrl,
        'artworkUrl30': artworkUrl30,
        'artworkUrl60': artworkUrl60,
        'artworkUrl100': artworkUrl100,
        'collectionPrice': collectionPrice,
        'trackPrice': trackPrice,
        'collectionHdPrice': collectionHdPrice,
        'trackHdPrice': trackHdPrice,
        'releaseDate': releaseDate,
        'collectionExplicitness': collectionExplicitness,
        'trackExplicitness': trackExplicitness,
        'trackCount': trackCount,
        'trackNumber': trackNumber,
        'trackTimeMillis': trackTimeMillis,
        'country': country,
        'currency': currency,
        'primaryGenreName': primaryGenreName,
        'contentAdvisoryRating': contentAdvisoryRating,
        'shortDescription': shortDescription,
        'longDescription': longDescription,
        'hasITunesExtras': hasITunesExtras,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MusicModel].
  factory MusicModel.fromJson(String data) {
    return MusicModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MusicModel] to a JSON string.
  String toJson() => json.encode(toMap());

  MusicModel copyWith({
    String? wrapperType,
    String? kind,
    int? collectionId,
    int? trackId,
    String? artistName,
    String? collectionName,
    String? trackName,
    String? collectionCensoredName,
    String? trackCensoredName,
    int? collectionArtistId,
    String? collectionArtistViewUrl,
    String? collectionViewUrl,
    String? trackViewUrl,
    String? previewUrl,
    String? artworkUrl30,
    String? artworkUrl60,
    String? artworkUrl100,
    double? collectionPrice,
    double? trackPrice,
    double? collectionHdPrice,
    double? trackHdPrice,
    DateTime? releaseDate,
    String? collectionExplicitness,
    String? trackExplicitness,
    int? trackCount,
    int? trackNumber,
    int? trackTimeMillis,
    String? country,
    String? currency,
    String? primaryGenreName,
    String? contentAdvisoryRating,
    String? shortDescription,
    String? longDescription,
    bool? hasITunesExtras,
  }) {
    return MusicModel(
      wrapperType: wrapperType ?? this.wrapperType,
      kind: kind ?? this.kind,
      collectionId: collectionId ?? this.collectionId,
      trackId: trackId ?? this.trackId,
      artistName: artistName ?? this.artistName,
      collectionName: collectionName ?? this.collectionName,
      trackName: trackName ?? this.trackName,
      collectionCensoredName:
          collectionCensoredName ?? this.collectionCensoredName,
      trackCensoredName: trackCensoredName ?? this.trackCensoredName,
      collectionArtistId: collectionArtistId ?? this.collectionArtistId,
      collectionArtistViewUrl:
          collectionArtistViewUrl ?? this.collectionArtistViewUrl,
      collectionViewUrl: collectionViewUrl ?? this.collectionViewUrl,
      trackViewUrl: trackViewUrl ?? this.trackViewUrl,
      previewUrl: previewUrl ?? this.previewUrl,
      artworkUrl30: artworkUrl30 ?? this.artworkUrl30,
      artworkUrl60: artworkUrl60 ?? this.artworkUrl60,
      artworkUrl100: artworkUrl100 ?? this.artworkUrl100,
      collectionPrice: collectionPrice ?? this.collectionPrice,
      trackPrice: trackPrice ?? this.trackPrice,
      collectionHdPrice: collectionHdPrice ?? this.collectionHdPrice,
      trackHdPrice: trackHdPrice ?? this.trackHdPrice,
      releaseDate: releaseDate ?? this.releaseDate,
      collectionExplicitness:
          collectionExplicitness ?? this.collectionExplicitness,
      trackExplicitness: trackExplicitness ?? this.trackExplicitness,
      trackCount: trackCount ?? this.trackCount,
      trackNumber: trackNumber ?? this.trackNumber,
      trackTimeMillis: trackTimeMillis ?? this.trackTimeMillis,
      country: country ?? this.country,
      currency: currency ?? this.currency,
      primaryGenreName: primaryGenreName ?? this.primaryGenreName,
      contentAdvisoryRating:
          contentAdvisoryRating ?? this.contentAdvisoryRating,
      shortDescription: shortDescription ?? this.shortDescription,
      longDescription: longDescription ?? this.longDescription,
      hasITunesExtras: hasITunesExtras ?? this.hasITunesExtras,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      wrapperType,
      kind,
      collectionId,
      trackId,
      artistName,
      collectionName,
      trackName,
      collectionCensoredName,
      trackCensoredName,
      collectionArtistId,
      collectionArtistViewUrl,
      collectionViewUrl,
      trackViewUrl,
      previewUrl,
      artworkUrl30,
      artworkUrl60,
      artworkUrl100,
      collectionPrice,
      trackPrice,
      collectionHdPrice,
      trackHdPrice,
      releaseDate,
      collectionExplicitness,
      trackExplicitness,
      trackCount,
      trackNumber,
      trackTimeMillis,
      country,
      currency,
      primaryGenreName,
      contentAdvisoryRating,
      shortDescription,
      longDescription,
      hasITunesExtras,
    ];
  }
}
