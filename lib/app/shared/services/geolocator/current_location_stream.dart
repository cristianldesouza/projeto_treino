import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';

class CurrentLocationStream extends Disposable {
  final Geolocator geolocator;

  CurrentLocationStream({this.geolocator});

  Stream<Position> execute() {
    LocationOptions locationOptions = LocationOptions(
      accuracy: LocationAccuracy.bestForNavigation,
      distanceFilter: 10,
    );

    return geolocator.getPositionStream(locationOptions);
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
