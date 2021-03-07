import 'package:http/http.dart' as http;

import 'package:flutter_weather_app/external/apis/contracts/i_api.dart';

class Api implements IApi {
  final Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  Future<Map<String, dynamic>> httpsGet(
    String authority,
    String unencodedPath, [
    Map<String, dynamic>? queryParameters,
  ]) async {
    final response = await http.get(
      Uri.https(authority, unencodedPath, queryParameters),
      headers: this._headers,
    );
    return {'statusCode': response.statusCode, 'data': response.body};
  }
}
