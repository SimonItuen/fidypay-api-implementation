class ApiResponse<T> {
  final T data;
  final T headers;
  ApiResponse({required this.data, required this.headers});

  factory ApiResponse.noContent({required T headers}) =>
      ApiResponse(data: {'message': 'No Content'} as T, headers: headers);
}
