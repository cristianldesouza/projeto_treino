import 'dart:async';
import 'package:sensors/sensors.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserAcelerometerService extends Disposable {
  Stream<UserAccelerometerEvent> execute() {
    return userAccelerometerEvents;
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
