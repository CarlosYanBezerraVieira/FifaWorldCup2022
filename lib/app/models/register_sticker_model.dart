import 'dart:convert';

class RegisterStickerModel {
  final String stickerCode;
  final String name;
  final int stickerNumber;
  RegisterStickerModel({
    required this.stickerCode,
    required this.name,
    required this.stickerNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'sticker_code': stickerCode,
      'name': name,
      'sticker_number': stickerNumber,
    };
  }

  factory RegisterStickerModel.fromMap(Map<String, dynamic> map) {
    return RegisterStickerModel(
      stickerCode: map['sticker_code'] ?? '',
      name: map['name'] ?? '',
      stickerNumber: map['sticker_number']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterStickerModel.fromJson(String source) =>
      RegisterStickerModel.fromMap(json.decode(source));
}
