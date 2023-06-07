import 'dart:convert';

import 'user_sticker_model.dart';

class GroupStickers {
  final int id;
  final int countryCode;
  final String countryName;
  final String stickerStart;
  final String stickersEnd;
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
      countryCode: map['country_code']?.toInt() ?? 0,
      countryName: map['country_name'] ?? '',
      stickerStart: map['stickers_start'] ?? '',
      stickersEnd: map['stickers_end'] ?? '',
      stickers: List<UserStickerModel>.from(map['stickers']?.map((x) => UserStickerModel.fromMap(x)) ?? const []),
      flag: map['flag'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GroupStickers.fromJson(String source) => GroupStickers.fromMap(json.decode(source));
}


