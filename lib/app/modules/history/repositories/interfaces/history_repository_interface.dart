import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_treino/app/shared/models/history_model.dart';

abstract class IHistoryRepository implements Disposable {
  Future<List<HistoryModel>> getAll();
}
