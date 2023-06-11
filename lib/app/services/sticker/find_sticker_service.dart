import 'package:fwc_album_app/app/models/sticker_model.dart';

abstract interface class FindStickerService {
Future<StickerModel>execute(String countryCode, String stickerNumber);
}