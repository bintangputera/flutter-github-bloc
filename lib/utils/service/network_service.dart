import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class NetworkService {
  Future<dynamic> getMethod(String endpoint) async {
    try {
      print("requested endpoint : $endpoint");
      final response = await http.get(Uri.parse(endpoint));
      var res = json.decode(response.body);
      if (res['message'] == null)
        return res;
      else
        throw Exception(res['message']);
    } on SocketException {
      throw Exception("Connection failed");
    }
  }
}
