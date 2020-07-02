import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_treino/app/shared/models/workout_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveWorkoutService extends Disposable {
  SaveWorkoutService();

  Future<bool> execute(WorkoutModel workoutModel) async {
    List<String> list;
    workoutModel.date = DateTime.now();

    SharedPreferences prefs = await SharedPreferences.getInstance();

    list = prefs.getStringList('workout');

    if (list == null) {
      list = [];
    }

    list.add(jsonEncode(workoutModel.toJson()).toString());

    prefs.setStringList('workout', list);

    return true;
  }

  @override
  void dispose() {}
}
