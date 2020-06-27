import 'package:mobx/mobx.dart';
import 'package:projeto_treino/app/modules/history/repositories/history_repository.dart';
import 'package:projeto_treino/app/shared/models/workout_model.dart';

part 'history_controller.g.dart';

class HistoryController = _HistoryControllerBase with _$HistoryController;

abstract class _HistoryControllerBase with Store {
  final HistoryRepository historyRepository;

  _HistoryControllerBase(this.historyRepository) {
    this.getAllHistories();
  }

  @observable
  List<WorkoutModel> list;

  @action
  getAllHistories() async {
    this.list = await this.historyRepository.getAll();
  }
}
