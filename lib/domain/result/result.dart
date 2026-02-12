import 'failure.dart';

abstract class Result<T> {
  const Result();

  R fold<R>(
    R Function(Failure<T> failure) onError,
    R Function(T data) onSuccess,
  );
}
