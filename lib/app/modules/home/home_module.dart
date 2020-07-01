import 'package:projeto_treino/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_treino/app/modules/home/home_page.dart';
import 'package:projeto_treino/app/shared/services/firestore/get_user_service.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => HomeController(
            getUserService: GetUserService(),
          ),
        ),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
