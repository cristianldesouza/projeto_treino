import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
import 'package:projeto_treino/app/shared/services/geolocator/check_gps_service.dart';
import 'package:projeto_treino/app/shared/services/geolocator/current_location_stream.dart';

part 'workout_controller.g.dart';

class WorkoutController = _WorkoutControllerBase with _$WorkoutController;

abstract class _WorkoutControllerBase with Store {
  final CheckGpsService checkGpsService;
  final CurrentLocationStream currentLocationStream;

  _WorkoutControllerBase({this.checkGpsService, this.currentLocationStream}) {
    checkGps();
    getLocation();
  }

  @observable
  String error;

  @observable
  ObservableStream<Position> currentPosition;

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
    
  }
}
