import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:greenvilllage/core/network_service.dart';

import 'package:greenvilllage/models/failure.dart';

class NewsRepository {
  Future<Either<Failure, Response>> getNews(int page) async {
    try {
      var response = await Network.dio.get('news?page=$page');
      return Right(response);
    } on DioException catch (e) {
      return Left(Failure(
          statusCode: e.response?.statusCode ?? 0, message: e.message ?? ''));
    }
  }

  Future<Either<Failure, Response>> increaseNewsViews(int id) async {
    try {
      var response = await Network.dio.post('increase-views', data: {'id': id});
      return Right(response);
    } on DioException catch (e) {
      return Left(Failure(
          statusCode: e.response!.statusCode, message: e.message ?? ''));
    }
  }
}

final newsRepository = NewsRepository();
