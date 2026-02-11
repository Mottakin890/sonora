import 'package:sonora/domain/result/result.dart';

class Failure<T> extends Result<T> {
  final String message;
  final int? statusCode;

  const Failure({required this.message, this.statusCode});
}
