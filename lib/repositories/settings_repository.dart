import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:greenvilllage/core/network_service.dart';
import 'package:greenvilllage/models/failure.dart';

class SettingsRepository {
  Future<Either<Failure, Response>> getServices() async {
    try {
      var response = await Network.dio.get('settings');
      return Right(response);
    } on DioException catch (e) {
      return Left(Failure(
          statusCode: e.response?.statusCode ?? 0, message: e.message ?? ''));
    }
  }
}

final settingsRepository = SettingsRepository();
