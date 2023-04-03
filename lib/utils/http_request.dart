import 'dart:developer';
import 'package:http/http.dart' as http;

class HttpRequestHamroSadhan {
  
  static Future<http.StreamedResponse> multiPart(
      http.MultipartRequest request) async {
    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 401) {
        // logout from coreController
      }
      return response;
    } catch (e) {
      throw "Server Error";
    }
  }

}
