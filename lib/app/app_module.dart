import 'package:projeto_treino/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:projeto_treino/app/app_widget.dart';
import 'package:projeto_treino/app/modules/create_workout/create_workout_module.dart';
import 'package:projeto_treino/app/modules/home/home_module.dart';
import 'package:projeto_treino/app/modules/workout/workout_module.dart';
import 'package:projeto_treino/app/modules/history/history_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: HomeModule()),
        Router('/workout', module: WorkoutModule()),
        Router('/history', module: HistoryModule()),
        Router('/create-workout', module: CreateWorkoutModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
