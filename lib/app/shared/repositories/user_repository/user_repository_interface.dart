import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class IUserRepository implements Disposable {
  Future<QuerySnapshot> getUserDocument();
}
