import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_treino/app/modules/user_options/services/save_user_options_service.dart';
import 'package:projeto_treino/app/modules/user_options/user_options_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_treino/app/modules/user_options/user_options_page.dart';
import 'package:projeto_treino/app/shared/repositories/user_repository/user_repository.dart';
import 'package:projeto_treino/app/shared/services/firestore/get_user_service.dart';

class UserOptionsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => UserOptionsController(
              getUserService: GetUserService(
                userRepository: UserRepository(firestore: Firestore.instance),
              ),
              saveUserOptionsService: SaveUserOptionsService(
                Firestore.instance,
              ),
            )),
      ];

  @override
  List<Router> get routers => [
        Router('/user-options', child: (_, args) => UserOptionsPage()),
      ];

  static Inject get to => Inject<UserOptionsModule>.of();
}
