import 'repositories/create_workout_repository.dart';
import 'repositories/interfaces/create_workout_repository_interface.dart';
import 'create_workout_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'create_workout_page.dart';

class CreateWorkoutModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<ICreateWorkoutRepository>((i) => CreateWorkoutRepository(Dio())),
        Bind((i) => CreateWorkoutController()),
      ];

  @override
  List<Router> get routers => [
        Router('/create-workout', child: (_, args) => CreateWorkoutPage()),
      ];

  static Inject get to => Inject<CreateWorkoutModule>.of();
}
