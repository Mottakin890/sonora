class ServiceResponse<T> {
  final T? data;
  final String? message;
  final int? statusCode;
  final bool isSuccess;

  ServiceResponse.success({this.data, this.message})
      : isSuccess = true,
        statusCode = null;

  ServiceResponse.error({this.message, required this.statusCode})
      : data = null,
        isSuccess = false;
}
