import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_treino/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_treino/app/modules/home/home_page.dart';
import 'package:projeto_treino/app/shared/repositories/user_repository/user_repository.dart';
import 'package:projeto_treino/app/shared/services/firestore/get_user_service.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => UserRepository(firestore: Firestore.instance)),
        Bind(
          (i) => HomeController(
            getUserService:
                GetUserService(userRepository: i.get<UserRepository>()),
          ),
        ),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
