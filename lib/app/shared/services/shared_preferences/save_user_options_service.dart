import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_treino/app/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveUserOptionsService extends Disposable {
  Future<void> execute(UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('user');

    prefs.setString('user', jsonEncode(userModel.toJson()).toString());

    return true;
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
