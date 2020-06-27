import 'package:projeto_treino/app/shared/models/workout_model.dart';
import 'interfaces/history_repository_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryRepository implements IHistoryRepository {
  final Firestore db;

  HistoryRepository(this.db);

  Future<List<WorkoutModel>> getAll() async {
    var response = await db
        .collection('history')
        .orderBy('date', descending: true)
        .getDocuments();

    return response.documents.map((doc) {
      return WorkoutModel.fromJson(doc.data);
    }).toList();
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
