import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_treino/app/shared/models/workout_model.dart';

class SaveWorkoutService extends Disposable {
  final Firestore db;

  SaveWorkoutService(this.db);

  Future<bool> execute(WorkoutModel workoutModel) async {
    Timestamp now = Timestamp.fromDate(DateTime.now());
    workoutModel.date = now;

    await this.db.collection('history').add(workoutModel.toJson());

    return true;
  }

  @override
  void dispose() {}
}
