import 'dart:convert';

import 'user_sticker_model.dart';

class GroupStickers {
  final int id;
  final String countryCode;
  final String countryName;
  final int stickerStart;
  final int stickersEnd;
  final List<UserStickerModel> stickers;
  final String flag;
  GroupStickers({
    required this.stickers,
    required this.id,
    required this.countryCode,
    required this.countryName,
    required this.stickerStart,
    required this.stickersEnd,
    required this.flag,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'country_code': countryCode,
      'country_name': countryName,
      'stickers_start': stickerStart,
      'stickers_end': stickersEnd,
      'stickers': stickers.map((x) => x.toMap()).toList(),
      'flag': flag,
    };
  }

  factory GroupStickers.fromMap(Map<String, dynamic> map) {
    return GroupStickers(
      id: map['id']?.toInt() ?? 0,
      countryCode: map['country_code'] ?? "",
      countryName: map['country_name'] ?? '',
      stickerStart: map['stickers_start']?.toInt() ?? 0,
      stickersEnd: map['stickers_end']?.toInt() ?? 0,
      stickers: List<UserStickerModel>.from(
          map['stickers']?.map((x) => UserStickerModel.fromMap(x)) ?? const []),
      flag: map['flag'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GroupStickers.fromJson(String source) =>
      GroupStickers.fromMap(json.decode(source));
}
