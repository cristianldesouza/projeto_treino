import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';

class CheckGpsService extends Disposable {
  final Geolocator geolocator;

  CheckGpsService({this.geolocator});

  Future<String> execute() async {
    GeolocationStatus geolocationStatus =
        await geolocator.checkGeolocationPermissionStatus();
    bool gpsStatus = await geolocator.isLocationServiceEnabled();

    if (geolocationStatus != GeolocationStatus.granted) {
      return 'Por favor, autorize o acesso ao GPS.';
    }

    if (gpsStatus == false) {
      return 'Por favor, ative seu GPS';
    }

    return null;
  }

  @override
  void dispose() {
    this.dispose();
  }
}
