import 'package:projeto_treino/app/modules/workout/workout_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_treino/app/modules/workout/workout_page.dart';

class WorkoutModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => WorkoutController()),
      ];

  @override
  List<Router> get routers => [
        Router("/workout", child: (_, args) => WorkoutPage(id: args.data)),
      ];

  static Inject get to => Inject<WorkoutModule>.of();
}
