import 'package:flutter_modular/flutter_modular.dart';

abstract class ICreateWorkoutRepository implements Disposable {
  Future fetchPost();
}
