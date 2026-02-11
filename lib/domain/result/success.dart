import 'package:sonora/domain/result/result.dart';

class Success<T> extends Result<T> {
  final T data;
  const Success({required this.data});
}
