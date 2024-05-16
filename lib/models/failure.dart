class Failure {
  final String message;
  final int? statusCode;
  final Map<String, dynamic>? errors;

  Failure({
    required this.message,
    required this.statusCode,
    this.errors
  });

  @override
  String toString() => message;
}
