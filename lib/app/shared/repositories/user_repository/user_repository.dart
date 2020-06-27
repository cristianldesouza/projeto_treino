import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_treino/app/shared/repositories/user_repository/user_repository_interface.dart';

class UserRepository implements IUserRepository {
  final Firestore firestore;

  UserRepository({this.firestore});

  @override
  Future<QuerySnapshot> getUserDocument() async {
    return await firestore.collection('user').getDocuments();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
