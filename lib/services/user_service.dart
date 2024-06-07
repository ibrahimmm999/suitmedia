import 'dart:convert';

import 'package:suitmedia/models/user_model.dart';
import 'package:suitmedia/services/url_service.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<List<UserModel>> getUsers() async {
    var url = UrlService().api();
    var headers = {
      'Content-Type': 'application/json',
    };

    var response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'] as List;

      List<UserModel> users = List<UserModel>.from(
        data.map((e) => UserModel.fromJson(
              e,
            )),
      );

      return users;
    } else {
      throw "Get data user failed";
    }
  }
}
