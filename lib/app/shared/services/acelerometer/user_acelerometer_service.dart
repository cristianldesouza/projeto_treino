import 'dart:async';
import 'package:sensors/sensors.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserAcelerometerService extends Disposable {

  StreamSubscription<UserAccelerometerEvent> execute() {
    return userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      return event.x;
    });   
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}