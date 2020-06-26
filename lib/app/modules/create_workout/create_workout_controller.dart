import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:projeto_treino/app/shared/models/workout_model.dart';

part 'create_workout_controller.g.dart';

class CreateWorkoutController = _CreateWorkoutControllerBase
    with _$CreateWorkoutController;

abstract class _CreateWorkoutControllerBase with Store {
  @observable
  String name;

  @observable
  String title = "Treino";

  @observable
  int duration;

  @action
  onChangeName(name) {
    this.name = name;
    this.title = name;

    if (name == '') {
      this.title = "Treino";
    }
  }

  @action
  onChangeDuration(duration) {
    this.duration = duration;
  }

  @action
  workout() {
    WorkoutModel workoutModel =
        WorkoutModel(name: this.name, duration: this.duration);

    Modular.to.pushReplacementNamed('/workout', arguments: workoutModel);
  }
}
