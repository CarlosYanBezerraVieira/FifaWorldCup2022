import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fwc_album_app/app/core/exceptions/repository_exception.dart';
import 'package:fwc_album_app/app/core/rest/custom_dio.dart';
import 'package:fwc_album_app/app/models/group_stickers.dart';

import './stickers_repository.dart';

class StickersRepositoryImpl implements StickersRepository {
  final CustomDio dio;
  StickersRepositoryImpl({
    required this.dio,
  });
  @override
  Future<List<GroupStickers>> getMyAlbum() async {
    try {
      final result = await dio.get('/api/countries');
      return (result.data as List)
          .map<GroupStickers>((g) => GroupStickers.fromMap(g))
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar album do usuário', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar album do usuário');
    }
  }
}
