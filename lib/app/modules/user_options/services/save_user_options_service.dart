import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_treino/app/shared/models/user_model.dart';

class SaveUserOptionsService extends Disposable {
  final Firestore db;

  SaveUserOptionsService(this.db);

  Future<void> execute(UserModel userModel) async {
    print(userModel);
    await db.collection('user').add(userModel.toJson());
    return true;
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
