abstract class IApi {
  Future<Map<String, dynamic>> httpsGet(
    String authority,
    String unencodedPath, [
    Map<String, dynamic>? queryParameters,
  ]);
}
