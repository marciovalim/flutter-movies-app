import 'dart:convert';

import 'package:http/http.dart';
import 'package:movies_app/data/core/api_constants.dart';

class ApiClient {
  final Client _client;

  const ApiClient(this._client);

  dynamic get(String middlePath) async {
    final response = await _client.get(
      Uri.parse(
          '${ApiConstants.BASE_URL}$middlePath?api_key=${ApiConstants.KEY}'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    throw Exception(response.reasonPhrase);
  }
}
