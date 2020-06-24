import 'package:projeto_treino/app/shared/models/history_model.dart';
import 'interfaces/history_repository_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryRepository implements IHistoryRepository {
  final Firestore db;

  HistoryRepository(this.db);

  Future<List<HistoryModel>> getAll() async {
    var response =
        await db.collection('history').orderBy('date').getDocuments();

    return response.documents
        .map((doc) => HistoryModel(
              workoutName: doc.data['workoutName'],
              date: doc.data['date'],
              velocity: doc.data['velocity'],
              duration: doc.data['duration'],
            ))
        .toList();
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
