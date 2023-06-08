import 'package:fwc_album_app/app/models/group_stickers.dart';

abstract interface class StickersRepository {
  Future<List<GroupStickers>> getMyAlbum();
}