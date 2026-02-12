import 'package:sonora/domain/results/result.dart';

class Failure<T> extends Result<T> {
  final String message;
  final int? statusCode;

  const Failure({required this.message, this.statusCode});

  @override
  R fold<R>(
    R Function(Failure<T> failure) onError,
    R Function(T data) onSuccess,
  ) {
    return onError(this);
  }
}
