import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:greenvilllage/core/network_service.dart';
import 'package:greenvilllage/models/failure.dart';
import 'package:greenvilllage/models/login_request.dart';
import 'package:greenvilllage/models/register_request.dart';

class AuthRepository {
  Future<Either<Failure, Response>> register(
      RegisterRequest registerRequest) async {
    try {
      var response = await Network.dio.post('register', data: {
        'name': registerRequest.name,
        'phone': registerRequest.phone,
        'address': registerRequest.address,
        'password': registerRequest.password,
        'email': '${registerRequest.phone}@gmail.com',
      });
      return Right(response);
    } on DioException catch (e) {
      return Left(Failure(
          statusCode: e.response!.statusCode,
          message: e.message ?? '',
          errors: e.response!.data['errors'] ?? {}));
    }
  }

  Future<Either<Failure, Response>> login(LoginRequest loginRequest) async {
    try {
      Map data = {
        'email': '${loginRequest.phone}@gmail.com',
        'password': loginRequest.password
      };

      var response = await Network.dio.post('login', data: data);
      return Right(response);
    } on DioException catch (e) {
      return Left(Failure(
          statusCode: e.response!.statusCode,
          message: e.response!.data['message'],
          errors: e.response!.data['errors'] ?? {}));
    }
  }

  Future<Either<Failure, Response>> updateToken(String token) async {
    try {
      Map data = {'token': token};
      var response = await Network.dio.post('update-token', data: data);

      return Right(response);
    } on DioException catch (e) {
      
      return Left(Failure(
          statusCode: e.response!.statusCode,
          message: e.response!.data['message'],
          errors: e.response!.data['errors'] ?? {}));
    }
  }

  Future<Either<Failure, Response>> deleteAccount() async {
    try {
      var response = await Network.dio.post('delete-account');

      return Right(response);
    } on DioException catch (e) {
      return Left(Failure(
          statusCode: e.response!.statusCode,
          message: e.response!.data['message'],
          errors: e.response!.data['errors'] ?? {}));
    }
  }
}

final authRepository = AuthRepository();
