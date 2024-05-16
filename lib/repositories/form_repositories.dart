import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:greenvilllage/core/network_service.dart';
import 'package:greenvilllage/models/failure.dart';
import 'package:greenvilllage/models/form_request.dart';

class FormRepository {
  Future<Either<Failure, Response>> postForm(FormRequest formRequest) async {
    try {
      var response = await Network.dio.post(
        'userform',
        data: {
          'name': formRequest.name,
          'degree': formRequest.certificate,
          'job': formRequest.job,
          'comment': formRequest.comment,
        },
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(Failure(
          statusCode: e.response?.statusCode ?? 0, message: e.message ?? ''));
    }
  }
}

final formRepository = FormRepository();
