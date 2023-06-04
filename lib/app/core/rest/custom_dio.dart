
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:fwc_album_app/app/core/config/env/env.dart';

class CustomDio extends DioForNative {
  CustomDio(): super(BaseOptions(
    baseUrl: Env.i['backend_base_url']?? '',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout:  const Duration(minutes: 1))){
    interceptors.add(LogInterceptor(responseBody: true, requestBody: true,));
  }

  CustomDio auth(){
    return this;
  }

    CustomDio unAuth(){
    return this;
  }
}