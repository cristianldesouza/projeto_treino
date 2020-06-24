import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @action
  pushWorkout(int workout) {
    Modular.to.pushReplacementNamed('/workout', arguments: workout);
  }

  @action
  pushHistory() {
    Modular.to.pushReplacementNamed('/history');
  }
}
