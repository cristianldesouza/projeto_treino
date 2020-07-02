import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_treino/app/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetUserService extends Disposable {
  Future<UserModel> execute() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String userData = prefs.getString('user');

    if (userData != null) {
      UserModel user = UserModel.fromJson(jsonDecode(userData));

      return user;
    }

    return null;
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
