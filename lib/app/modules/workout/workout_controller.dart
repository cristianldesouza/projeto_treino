import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_timer/flutter_timer.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
import 'package:projeto_treino/app/shared/services/acelerometer/user_acelerometer_service.dart';
import 'package:projeto_treino/app/shared/services/geolocator/check_gps_service.dart';
import 'package:projeto_treino/app/shared/services/geolocator/current_location.dart';
import 'package:projeto_treino/app/shared/services/geolocator/current_location_stream.dart';
import 'package:sensors/sensors.dart';

part 'workout_controller.g.dart';

class WorkoutController = _WorkoutControllerBase with _$WorkoutController;

abstract class _WorkoutControllerBase with Store {
  final CheckGpsService checkGpsService;
  final CurrentLocationStream currentLocationStream;
  final UserAcelerometerService userAcelerometerService;
  final CurrentLocation currentLocation;

  @observable
  bool mostraBotao = true;

  @observable
  bool running = false;

  @observable
  int speed = 4;

  _WorkoutControllerBase({
    this.checkGpsService,
    this.currentLocationStream,
    this.userAcelerometerService,
    this.currentLocation,
  }) {
    checkGps();
    getInitialPosition();
  }

  @observable
  String error;

  @observable
  String buttonText = 'Começar';

  @observable
  ObservableStream<Position> currentPosition;

  @observable
  Position inicialPosition;

  @observable
  ObservableStream<UserAccelerometerEvent> currentSpeed;

  @action
  workout({seconds: int}) {
    switch (seconds) {
      case 300:
        speed = 6;
        break;
      case 900:
        speed = 5;
        break;
      case 1200:
        speed = 10;
        break;
      case 1800:
        speed = 4;
        break;
      default:
    }
  }

  @action
  checkGps() async {
    error = await checkGpsService.execute();
  }

  @action
  getInitialPosition() async {
    inicialPosition = await currentLocation.execute();
  }

  @action
  getLocationStream() async {
    currentPosition = currentLocationStream.execute().asObservable();
  }

  backToHome() {
    currentLocationStream.dispose();

    Modular.to.pushReplacementNamed('/');
  }

  @observable
  int start = 1800;

  bool isRunning = false;

  Timer timer;

  void startTimer() {
    // Start the periodic timer which prints something every 1 seconds
    isRunning = true;
    buttonText = 'Pausar';
    timer = Timer.periodic(Duration(seconds: 1), (time) {
      if (start < 1) {
        timer.cancel();
      } else {
        start = start - 1;
      }
    });
  }

  stopTimer() {
    buttonText = 'Continuar';
    isRunning = false;
    timer.cancel();
  }

  @action
  startWorkout() {
    if (isRunning) {
      stopTimer();
    } else {
      startTimer();
    }

    currentSpeed = userAcelerometerService.execute().asObservable();
  }

  @action
  stopWorkout() {
    if (running) {
      running = false;
      buttonText = "Continuar";
    } else {
      running = true;
      buttonText = "Pausar";
    }
  }
}
