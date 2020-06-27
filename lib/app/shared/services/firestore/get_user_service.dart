import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_treino/app/shared/models/user_model.dart';
import 'package:projeto_treino/app/shared/repositories/user_repository/user_repository.dart';

class GetUserService extends Disposable {
  final UserRepository userRepository;

  GetUserService({this.userRepository});

  Future<UserModel> execute() async {
    QuerySnapshot qs = await userRepository.getUserDocument();

    if (qs.documents.length > 0) {
      return UserModel.fromJson(qs.documents[0].data);
    }

    return null;
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
