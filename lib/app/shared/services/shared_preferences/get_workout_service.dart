import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_treino/app/shared/models/workout_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetWorkoutService extends Disposable {
  Future<List<WorkoutModel>> execute() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> workoutData = prefs.getStringList('workout');

    if (workoutData != null) {
      List<WorkoutModel> workoutList = workoutData
          .map((workout) => WorkoutModel.fromJson(json.decode(workout)))
          .toList();

      return workoutList;
    }

    return null;
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
