import 'repositories/history_repository.dart';
import 'repositories/interfaces/history_repository_interface.dart';
import 'history_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'history_page.dart';

class HistoryModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IHistoryRepository>((i) => HistoryRepository(Firestore.instance)),
        Bind(
          (i) => HistoryController(i.get()),
        ),
      ];

  @override
  List<Router> get routers => [
        Router("/history", child: (_, args) => HistoryPage()),
      ];

  static Inject get to => Inject<HistoryModule>.of();
}
