import 'package:mobx/mobx.dart';
import 'package:projeto_treino/app/shared/models/workout_model.dart';
import 'package:projeto_treino/app/shared/services/shared_preferences/get_workout_service.dart';

part 'history_controller.g.dart';

class HistoryController = _HistoryControllerBase with _$HistoryController;

abstract class _HistoryControllerBase with Store {
  final GetWorkoutService getWorkoutService;
  _HistoryControllerBase({this.getWorkoutService}) {
    getAllWorkouts();
  }

  @observable
  List<WorkoutModel> list;

  @action
  getAllWorkouts() async {
    list = await getWorkoutService.execute();

    print(list);
  }
}
