import 'package:fwc_album_app/app/models/group_stickers.dart';
import 'package:fwc_album_app/app/models/sticker_model.dart';

import '../../models/register_sticker_model.dart';

abstract interface class StickersRepository {
  Future<List<GroupStickers>> getMyAlbum();
  Future<StickerModel?>findStickerByCode({required String stickerCode, required String stickerNumber });
  Future<StickerModel>create({required RegisterStickerModel registerStickerModel });
}