import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:projeto_treino/app/shared/models/user_model.dart';
import 'package:projeto_treino/app/shared/services/shared_preferences/get_user_service.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final GetUserService getUserService;

  _HomeControllerBase({this.getUserService}) {
    checkUserOptions();
  }

  @observable
  UserModel user;

  checkUserOptions() async {
    user = await getUserService.execute();

    if (user == null) {
      Modular.to.pushReplacementNamed('/user-options');
    }

    return user;
  }

  @action
  pushSettings() async {
    user = await checkUserOptions();
    Modular.to.pushReplacementNamed('/user-options', arguments: user);
  }

  @action
  pushCreateWorkout() {
    Modular.to.pushReplacementNamed('/create-workout');
  }

  @action
  pushHistory() {
    Modular.to.pushReplacementNamed('/history');
  }
}
