import 'package:projeto_treino/app/modules/user_options/user_options_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_treino/app/modules/user_options/user_options_page.dart';

class UserOptionsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => UserOptionsController()),
      ];

  @override
  List<Router> get routers => [
        Router('/user-options', child: (_, args) => UserOptionsPage()),
      ];

  static Inject get to => Inject<UserOptionsModule>.of();
}