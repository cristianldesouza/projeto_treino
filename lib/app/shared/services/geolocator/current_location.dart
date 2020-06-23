import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';

class CurrentLocation extends Disposable {
  final Geolocator geolocator;

  CurrentLocation({this.geolocator});

  Future<Position> execute() async {
    return await Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
  }

  @override
  void dispose() {
    this.dispose();
  }
}
