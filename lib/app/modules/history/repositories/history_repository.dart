import 'package:projeto_treino/app/shared/models/history_model.dart';
import 'interfaces/history_repository_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class HistoryRepository implements IHistoryRepository {
  final Firestore db;

  HistoryRepository(this.db);

  Future<List<HistoryModel>> getAll() async {
    var response = await db
        .collection('history')
        .orderBy('date', descending: true)
        .getDocuments();

    initializeDateFormatting();

    return response.documents.map((doc) {
      var date = doc.data['date'].toDate().toUtc();
      var formatedDate =
          DateFormat(DateFormat.NUM_MONTH_DAY, 'pt_Br').format(date);
      print(formatedDate);

      return HistoryModel(
          workoutName: doc.data['workoutName'],
          date: formatedDate,
          velocity: doc.data['velocity'],
          duration: doc.data['duration'],
          calories: doc.data['calories']);
    }).toList();
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
