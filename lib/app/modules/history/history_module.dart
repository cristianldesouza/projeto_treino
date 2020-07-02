import 'package:projeto_treino/app/shared/services/shared_preferences/get_workout_service.dart';

import 'history_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'history_page.dart';

class HistoryModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => HistoryController(getWorkoutService: GetWorkoutService()),
        ),
      ];

  @override
  List<Router> get routers => [
        Router("/history", child: (_, args) => HistoryPage()),
      ];

  static Inject get to => Inject<HistoryModule>.of();
}
