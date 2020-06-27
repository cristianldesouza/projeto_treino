import 'create_workout_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'create_workout_page.dart';

class CreateWorkoutModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CreateWorkoutController()),
      ];

  @override
  List<Router> get routers => [
        Router('/create-workout', child: (_, args) => CreateWorkoutPage()),
      ];

  static Inject get to => Inject<CreateWorkoutModule>.of();
}
