import 'package:http/http.dart' as http;
import 'package:zero/app/core/utils/exports.dart';

class RestServices {
  // Get Data (API's Calling Point)
  static Future<http.Response> getData({
    required Uri uri,
    required Method method,
    String? body,
    String? token,
  }) async {
    debugPrint('Body:$body');
    final headers = <String, String>{
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
    switch (method) {
      case Method.post:
        return await http.post(uri, headers: headers, body: body);
      case Method.put:
        return await http.put(uri, headers: headers, body: body);
      case Method.delete:
        return await http.delete(uri, headers: headers, body: body);
      case Method.get:
      default:
        return await http.get(uri, headers: headers);
    }
  }

  // Get Responses
  Future<String> getResponse({
    required String uri,
    required Method method,
    bool isMovie = false,
    Map<String, dynamic>? queryParameters,
    String? body,
    String? token,
    handleTokenExpire = false,
  }) async {
    try {
      final url = Uri.https(
          isMovie ? Endpoints.moviesBaseUrl : Endpoints.baseUrl,
          uri,
          queryParameters);
      var response = await getData(
        uri: url,
        method: method,
        body: body,
        token: token,
      ).timeout(
        const Duration(
          seconds: 180,
        ),
      );
      debugPrint(url.toString());
      if (response.statusCode == 200) {
        return response.body;
      } else if (handleTokenExpire &&
          (response.statusCode == 401 || response.statusCode == 400)) {
        debugPrint('Token Expire');
        return '';
      } else {
        return '';
      }
    } catch (e) {
      debugPrint(e.toString());
      return "";
    }
  }
}
