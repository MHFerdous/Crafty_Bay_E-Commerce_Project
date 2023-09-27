class NetworkResponse {
  final int statusCode;
  final bool isSuccess;
  final dynamic responseJson;

  NetworkResponse(this.isSuccess, this.statusCode, this.responseJson);
}
