import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:greenvilllage/global/constants/constants.dart';
import 'package:hive/hive.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Network {
  static final dio = Dio(
    BaseOptions(
      baseUrl: base_url,
      receiveDataWhenStatusError: true,
    ),
  );

  static Future<void> initializeInterceptors() async {
    // dio.interceptors.add(alice.getDioInterceptor());

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
      ),
    );

    
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (request, handler) async {
        Box tokenBox = Get.find<Box>(tag: TOKEN);

        // var token = await GetStorage().read('login_token');
        var token = tokenBox.get(TOKEN) ?? '';

        if (token != '') {
          request.headers['Authorization'] = 'Bearer $token';
        }
        var headers = {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        };

        request.headers.addAll(headers);

        return handler.next(request); //continue
      },
      onResponse: (response, handler) {
        return handler.next(response); // continue
      },
      onError: (error, handler) {
        return handler.next(error); //continue
      },
    ));
  } // end of initializeInterceptor
}
