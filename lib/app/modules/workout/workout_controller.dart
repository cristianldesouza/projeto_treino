import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
import 'package:projeto_treino/app/shared/services/acelerometer/user_acelerometer_service.dart';
import 'package:projeto_treino/app/shared/services/geolocator/check_gps_service.dart';
import 'package:projeto_treino/app/shared/services/geolocator/current_location_stream.dart';
import 'package:sensors/sensors.dart';

part 'workout_controller.g.dart';

class WorkoutController = _WorkoutControllerBase with _$WorkoutController;

abstract class _WorkoutControllerBase with Store {
  final CheckGpsService checkGpsService;
  final CurrentLocationStream currentLocationStream;
  final UserAcelerometerService userAcelerometerService;
  
  @observable
  bool mostraBotao = true;

  @observable
  bool running = false;

  @observable
  int speed = 0;

  _WorkoutControllerBase({this.checkGpsService, this.currentLocationStream, this.userAcelerometerService}) {
    checkGps();
    getLocation();
  }

  @observable
  String error;

  @observable
  ObservableStream<Position> currentPosition;
  
  @observable
  StreamSubscription<UserAccelerometerEvent> teste;

  @action
  checkGps() async {
    error = await checkGpsService.execute();
  }

  @action
  getLocation() async {
    currentPosition = currentLocationStream.execute().asObservable();
  }

  backToHome() {
    Modular.to.pushReplacementNamed('/');
  }

  @action
  startWorkout() {
    mostraBotao = false;
    running = true;
    teste = userAcelerometerService.execute();
    print("ola que tal putedo  $teste");
  }
}
