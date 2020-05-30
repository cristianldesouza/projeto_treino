import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';

part 'workout_controller.g.dart';

class WorkoutController = _WorkoutControllerBase with _$WorkoutController;

abstract class _WorkoutControllerBase with Store {
  _WorkoutControllerBase() {
    getLocation();
  }

  @computed
  bool get hasError =>
      !gpsStatus || geolocationStatus != GeolocationStatus.granted
          ? true
          : false;

  @computed
  String get errorText {
    if (!gpsStatus) {
      return 'Por favor, ative seu GPS';
    }

    if (geolocationStatus != GeolocationStatus.granted) {
      return 'Por favor, autorize o acesso ao GPS.';
    }

    return null;
  }

  @observable
  bool gpsStatus = false;

  @observable
  GeolocationStatus geolocationStatus;

  @observable
  ObservableStream<Position> position;

  @action
  getLocation() async {
    Geolocator geolocator = Geolocator()..forceAndroidLocationManager = true;

    geolocationStatus = await geolocator.checkGeolocationPermissionStatus();
    gpsStatus = await geolocator.isLocationServiceEnabled();

    if (!hasError) {
      var locationOptions =
          LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);

      Stream<Position> positionStream = geolocator
          .getPositionStream(locationOptions); //TODO: COLOCAR EM UM SERVICE

      position = positionStream.asObservable();
    } else {
      await Future.delayed(Duration(seconds: 2));
      backToHome();
    }
  }

  backToHome() {
    Modular.to.pushReplacementNamed('/');
  }
}
