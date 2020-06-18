// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WorkoutController on _WorkoutControllerBase, Store {
  final _$mostraBotaoAtom = Atom(name: '_WorkoutControllerBase.mostraBotao');

  @override
  bool get mostraBotao {
    _$mostraBotaoAtom.reportRead();
    return super.mostraBotao;
  }

  @override
  set mostraBotao(bool value) {
    _$mostraBotaoAtom.reportWrite(value, super.mostraBotao, () {
      super.mostraBotao = value;
    });
  }

  final _$errorAtom = Atom(name: '_WorkoutControllerBase.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$currentPositionAtom =
      Atom(name: '_WorkoutControllerBase.currentPosition');

  @override
  ObservableStream<Position> get currentPosition {
    _$currentPositionAtom.reportRead();
    return super.currentPosition;
  }

  @override
  set currentPosition(ObservableStream<Position> value) {
    _$currentPositionAtom.reportWrite(value, super.currentPosition, () {
      super.currentPosition = value;
    });
  }

  final _$checkGpsAsyncAction = AsyncAction('_WorkoutControllerBase.checkGps');

  @override
  Future checkGps() {
    return _$checkGpsAsyncAction.run(() => super.checkGps());
  }

  final _$getLocationAsyncAction =
      AsyncAction('_WorkoutControllerBase.getLocation');

  @override
  Future getLocation() {
    return _$getLocationAsyncAction.run(() => super.getLocation());
  }

  final _$_WorkoutControllerBaseActionController =
      ActionController(name: '_WorkoutControllerBase');

  @override
  dynamic startWorkout() {
    final _$actionInfo = _$_WorkoutControllerBaseActionController.startAction(
        name: '_WorkoutControllerBase.startWorkout');
    try {
      return super.startWorkout();
    } finally {
      _$_WorkoutControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
mostraBotao: ${mostraBotao},
error: ${error},
currentPosition: ${currentPosition}
    ''';
  }
}
