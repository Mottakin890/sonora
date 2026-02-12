import 'package:sonora/domain/result/failure.dart';
import 'package:sonora/domain/result/result.dart';

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
