import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:greenvilllage/core/network_service.dart';
import 'package:greenvilllage/models/failure.dart';

/// Repository for posting form data to the backend
class ChatRepository {
  /// Posts the form to the backend
  ///
  /// Returns a [Right] with the response if successful, or a [Left] with a
  /// [Failure] if an error occurred
  Future<Either<Failure, Response>> sendMessage(String message) async {
    // Try to post form to backend
    try {
      // Send form data to backend
      var response = await Network.dio.post(
        // Endpoint for posting forms
        'send-message',
        // Form data to send to backend
        data: {
          // User's name
          'recipient_id': 1,
          // User's highest degree obtained
          'message': message,
        },
      );

      // Return response if successful
      return Right(response);
    } on DioException catch (e) {
      // Return Failure if an error occurred
      return Left(
        // Create Failure with status code and message
        Failure(
          // Status code of response if available, otherwise 0
          statusCode: e.response?.statusCode ?? 0,
          // Message of error if available, otherwise empty string
          message: e.message ?? '',
        ),
      );
    }
  }

  Future<Either<Failure, Response>> getMessages() async {
    // Try to post form to backend
    try {
      // Send form data to backend
      var response = await Network.dio.get(
        // Endpoint for posting forms
        'get-messages',
        // Form data to send to backend
      );

      // Return response if successful
      return Right(response);
    } on DioException catch (e) {
      // Return Failure if an error occurred
      return Left(
        // Create Failure with status code and message
        Failure(
          // Status code of response if available, otherwise 0
          statusCode: e.response?.statusCode ?? 0,
          // Message of error if available, otherwise empty string
          message: e.message ?? '',
        ),
      );
    }
  }
}

final chatRepository = ChatRepository();
