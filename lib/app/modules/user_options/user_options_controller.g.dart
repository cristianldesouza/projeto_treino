// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_options_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserOptionsController on _UserOptionsControllerBase, Store {
  Computed<bool> _$isValidNameComputed;

  @override
  bool get isValidName =>
      (_$isValidNameComputed ??= Computed<bool>(() => super.isValidName,
              name: '_UserOptionsControllerBase.isValidName'))
          .value;
  Computed<bool> _$isValidIdadeComputed;

  @override
  bool get isValidIdade =>
      (_$isValidIdadeComputed ??= Computed<bool>(() => super.isValidIdade,
              name: '_UserOptionsControllerBase.isValidIdade'))
          .value;
  Computed<bool> _$isValidAlturaComputed;

  @override
  bool get isValidAltura =>
      (_$isValidAlturaComputed ??= Computed<bool>(() => super.isValidAltura,
              name: '_UserOptionsControllerBase.isValidAltura'))
          .value;
  Computed<bool> _$isValidPesoComputed;

  @override
  bool get isValidPeso =>
      (_$isValidPesoComputed ??= Computed<bool>(() => super.isValidPeso,
              name: '_UserOptionsControllerBase.isValidPeso'))
          .value;
  Computed<String> _$errorNameComputed;

  @override
  String get errorName =>
      (_$errorNameComputed ??= Computed<String>(() => super.errorName,
              name: '_UserOptionsControllerBase.errorName'))
          .value;
  Computed<String> _$errorIdadeComputed;

  @override
  String get errorIdade =>
      (_$errorIdadeComputed ??= Computed<String>(() => super.errorIdade,
              name: '_UserOptionsControllerBase.errorIdade'))
          .value;
  Computed<String> _$errorAlturaComputed;

  @override
  String get errorAltura =>
      (_$errorAlturaComputed ??= Computed<String>(() => super.errorAltura,
              name: '_UserOptionsControllerBase.errorAltura'))
          .value;
  Computed<String> _$errorPesoComputed;

  @override
  String get errorPeso =>
      (_$errorPesoComputed ??= Computed<String>(() => super.errorPeso,
              name: '_UserOptionsControllerBase.errorPeso'))
          .value;
  Computed<bool> _$isValidFormComputed;

  @override
  bool get isValidForm =>
      (_$isValidFormComputed ??= Computed<bool>(() => super.isValidForm,
              name: '_UserOptionsControllerBase.isValidForm'))
          .value;

  final _$nomeAtom = Atom(name: '_UserOptionsControllerBase.nome');

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$idadeAtom = Atom(name: '_UserOptionsControllerBase.idade');

  @override
  int get idade {
    _$idadeAtom.reportRead();
    return super.idade;
  }

  @override
  set idade(int value) {
    _$idadeAtom.reportWrite(value, super.idade, () {
      super.idade = value;
    });
  }

  final _$alturaAtom = Atom(name: '_UserOptionsControllerBase.altura');

  @override
  double get altura {
    _$alturaAtom.reportRead();
    return super.altura;
  }

  @override
  set altura(double value) {
    _$alturaAtom.reportWrite(value, super.altura, () {
      super.altura = value;
    });
  }

  final _$pesoAtom = Atom(name: '_UserOptionsControllerBase.peso');

  @override
  double get peso {
    _$pesoAtom.reportRead();
    return super.peso;
  }

  @override
  set peso(double value) {
    _$pesoAtom.reportWrite(value, super.peso, () {
      super.peso = value;
    });
  }

  final _$errorAtom = Atom(name: '_UserOptionsControllerBase.error');

  @override
  bool get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(bool value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$saveUserAsyncAction =
      AsyncAction('_UserOptionsControllerBase.saveUser');

  @override
  Future saveUser() {
    return _$saveUserAsyncAction.run(() => super.saveUser());
  }

  final _$_UserOptionsControllerBaseActionController =
      ActionController(name: '_UserOptionsControllerBase');

  @override
  dynamic setName(String nome) {
    final _$actionInfo = _$_UserOptionsControllerBaseActionController
        .startAction(name: '_UserOptionsControllerBase.setName');
    try {
      return super.setName(nome);
    } finally {
      _$_UserOptionsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setAltura(double altura) {
    final _$actionInfo = _$_UserOptionsControllerBaseActionController
        .startAction(name: '_UserOptionsControllerBase.setAltura');
    try {
      return super.setAltura(altura);
    } finally {
      _$_UserOptionsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIdade(int idade) {
    final _$actionInfo = _$_UserOptionsControllerBaseActionController
        .startAction(name: '_UserOptionsControllerBase.setIdade');
    try {
      return super.setIdade(idade);
    } finally {
      _$_UserOptionsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPeso(dynamic peso) {
    final _$actionInfo = _$_UserOptionsControllerBaseActionController
        .startAction(name: '_UserOptionsControllerBase.setPeso');
    try {
      return super.setPeso(peso);
    } finally {
      _$_UserOptionsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nome: ${nome},
idade: ${idade},
altura: ${altura},
peso: ${peso},
error: ${error},
isValidName: ${isValidName},
isValidIdade: ${isValidIdade},
isValidAltura: ${isValidAltura},
isValidPeso: ${isValidPeso},
errorName: ${errorName},
errorIdade: ${errorIdade},
errorAltura: ${errorAltura},
errorPeso: ${errorPeso},
isValidForm: ${isValidForm}
    ''';
  }
}
