import 'package:sonora/domain/results/failure.dart';
import 'package:sonora/domain/results/result.dart';

class Success<T> extends Result<T> {
  final T data;
  const Success({required this.data});

  @override
  R fold<R>(
    R Function(Failure<T> failure) onError,
    R Function(T data) onSuccess,
  ) {
    return onSuccess(data);
  }
}
