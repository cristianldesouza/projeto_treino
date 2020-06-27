import 'package:mobx/mobx.dart';
import 'package:projeto_treino/app/shared/models/user_model.dart';

part 'user_options_controller.g.dart';

class UserOptionsController = _UserOptionsControllerBase
    with _$UserOptionsController;

abstract class _UserOptionsControllerBase with Store {
  @observable
  String nome = "";

  @observable
  int idade;

  @observable
  double altura;

  @observable
  double peso;

  @observable
  bool error = false;

  @action
  setName(String nome) {
    this.nome = nome;
  }

  @action
  setAltura(dynamic altura) {
    var alturaDouble = altura.roundToDouble();
    this.altura = alturaDouble;
  }

  @action
  setIdade(int idade) {
    this.idade = idade;
  }

  @action
  setPeso(dynamic peso) {
    var pesoDouble = peso.roundToDouble();

    this.peso = pesoDouble;
  }

  @computed
  bool get isValidName => nome.length > 1;

  @computed
  bool get isValidIdade => idade != null;

  @computed
  bool get isValidAltura => altura != null;

  @computed
  bool get isValidPeso => peso != null;

  @computed
  String get errorName =>
      !isValidName && error ? "Por favor preecha o seu nome" : "";

  @computed
  String get errorIdade =>
      !isValidIdade && error ? "Por favor preecha a sua idade" : "";

  @computed
  String get errorAltura =>
      !isValidAltura && error ? "Por favor preecha a sua altura " : "";

  @computed
  String get errorPeso =>
      !isValidPeso && error ? "Por favor preecha o seu peso" : "";

  @computed
  bool get isValidForm =>
      isValidName && isValidIdade && isValidAltura && isValidPeso;

  @action
  void saveUser() {
    if (isValidForm) {
      User user = new User(
          nome: this.nome,
          idade: this.idade,
          peso: this.peso,
          altura: this.altura);
    } else {
      this.error = true;
    }
  }
}
