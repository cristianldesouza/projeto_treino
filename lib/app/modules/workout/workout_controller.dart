import 'dart:async';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
import 'package:projeto_treino/app/modules/workout/services/save_workout_service.dart';
import 'package:projeto_treino/app/shared/models/user_model.dart';
import 'package:projeto_treino/app/shared/models/workout_model.dart';
import 'package:projeto_treino/app/shared/services/acelerometer/user_acelerometer_service.dart';
import 'package:projeto_treino/app/shared/services/firestore/get_user_service.dart';
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
  final SaveWorkoutService saveWorkoutService;
  final GetUserService getUserService;

  @observable
  bool mostraBotao = true;

  @observable
  bool running = false;

  @observable
  UserModel user;

  _WorkoutControllerBase(
      {this.checkGpsService,
      this.currentLocationStream,
      this.userAcelerometerService,
      this.currentLocation,
      this.getUserService,
      this.saveWorkoutService}) {
    checkGps();
    getInitialPosition();
    getUser();
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
  int calories = 0;

  @observable
  ObservableStream<UserAccelerometerEvent> currentSpeed;

  @action
  getUser() async {
    user = await getUserService.execute();
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

  @action
  Future<void> saveWorkout(WorkoutModel workoutModel) async {
    bool response = await this.saveWorkoutService.execute(workoutModel);

    if (response) {
      backToHome();
    }
  }

  @observable
  int start;

  bool isRunning = false;

  Timer timer;

  @observable
  int timeValue = 0;

  @observable
  bool finishedWorkout = false;

  void startTimer() {
    // Start the periodic timer which prints something every 1 seconds
    isRunning = true;
    buttonText = 'Pausar';
    timer = Timer.periodic(Duration(seconds: 1), (time) {
      if (start < 1) {
        timer.cancel();

        this.finishedWorkout = true;
      } else {
        timeValue = timeValue + 1;
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
  setCalories(int val) {
    var kcal = user.peso.toInt() * 0.0175 * val / 1000;

    calories += kcal.toInt();
  }

  @action
  startWorkout() {
    if (isRunning) {
      stopTimer();
    } else {
      playLocal('inicio');
      startTimer();
    }

    currentSpeed = userAcelerometerService.execute().asObservable();
  }

  playLocal(nome) async {
    AudioCache player = AudioCache();

    // player.play('inicio.mp3"');
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
