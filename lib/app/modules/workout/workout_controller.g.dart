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

  final _$runningAtom = Atom(name: '_WorkoutControllerBase.running');

  @override
  bool get running {
    _$runningAtom.reportRead();
    return super.running;
  }

  @override
  set running(bool value) {
    _$runningAtom.reportWrite(value, super.running, () {
      super.running = value;
    });
  }

  final _$userAtom = Atom(name: '_WorkoutControllerBase.user');

  @override
  UserModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
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

  final _$buttonTextAtom = Atom(name: '_WorkoutControllerBase.buttonText');

  @override
  String get buttonText {
    _$buttonTextAtom.reportRead();
    return super.buttonText;
  }

  @override
  set buttonText(String value) {
    _$buttonTextAtom.reportWrite(value, super.buttonText, () {
      super.buttonText = value;
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

  final _$inicialPositionAtom =
      Atom(name: '_WorkoutControllerBase.inicialPosition');

  @override
  Position get inicialPosition {
    _$inicialPositionAtom.reportRead();
    return super.inicialPosition;
  }

  @override
  set inicialPosition(Position value) {
    _$inicialPositionAtom.reportWrite(value, super.inicialPosition, () {
      super.inicialPosition = value;
    });
  }

  final _$caloriesAtom = Atom(name: '_WorkoutControllerBase.calories');

  @override
  int get calories {
    _$caloriesAtom.reportRead();
    return super.calories;
  }

  @override
  set calories(int value) {
    _$caloriesAtom.reportWrite(value, super.calories, () {
      super.calories = value;
    });
  }

  final _$currentSpeedAtom = Atom(name: '_WorkoutControllerBase.currentSpeed');

  @override
  ObservableStream<UserAccelerometerEvent> get currentSpeed {
    _$currentSpeedAtom.reportRead();
    return super.currentSpeed;
  }

  @override
  set currentSpeed(ObservableStream<UserAccelerometerEvent> value) {
    _$currentSpeedAtom.reportWrite(value, super.currentSpeed, () {
      super.currentSpeed = value;
    });
  }

  final _$startAtom = Atom(name: '_WorkoutControllerBase.start');

  @override
  int get start {
    _$startAtom.reportRead();
    return super.start;
  }

  @override
  set start(int value) {
    _$startAtom.reportWrite(value, super.start, () {
      super.start = value;
    });
  }

  final _$timeValueAtom = Atom(name: '_WorkoutControllerBase.timeValue');

  @override
  int get timeValue {
    _$timeValueAtom.reportRead();
    return super.timeValue;
  }

  @override
  set timeValue(int value) {
    _$timeValueAtom.reportWrite(value, super.timeValue, () {
      super.timeValue = value;
    });
  }

  final _$finishedWorkoutAtom =
      Atom(name: '_WorkoutControllerBase.finishedWorkout');

  @override
  bool get finishedWorkout {
    _$finishedWorkoutAtom.reportRead();
    return super.finishedWorkout;
  }

  @override
  set finishedWorkout(bool value) {
    _$finishedWorkoutAtom.reportWrite(value, super.finishedWorkout, () {
      super.finishedWorkout = value;
    });
  }

  final _$tempoInicialAtom = Atom(name: '_WorkoutControllerBase.tempoInicial');

  @override
  int get tempoInicial {
    _$tempoInicialAtom.reportRead();
    return super.tempoInicial;
  }

  @override
  set tempoInicial(int value) {
    _$tempoInicialAtom.reportWrite(value, super.tempoInicial, () {
      super.tempoInicial = value;
    });
  }

  final _$getUserAsyncAction = AsyncAction('_WorkoutControllerBase.getUser');

  @override
  Future getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  final _$checkGpsAsyncAction = AsyncAction('_WorkoutControllerBase.checkGps');

  @override
  Future checkGps() {
    return _$checkGpsAsyncAction.run(() => super.checkGps());
  }

  final _$getInitialPositionAsyncAction =
      AsyncAction('_WorkoutControllerBase.getInitialPosition');

  @override
  Future getInitialPosition() {
    return _$getInitialPositionAsyncAction
        .run(() => super.getInitialPosition());
  }

  final _$getLocationStreamAsyncAction =
      AsyncAction('_WorkoutControllerBase.getLocationStream');

  @override
  Future getLocationStream() {
    return _$getLocationStreamAsyncAction.run(() => super.getLocationStream());
  }

  final _$saveWorkoutAsyncAction =
      AsyncAction('_WorkoutControllerBase.saveWorkout');

  @override
  Future<void> saveWorkout(WorkoutModel workoutModel) {
    return _$saveWorkoutAsyncAction.run(() => super.saveWorkout(workoutModel));
  }

  final _$_WorkoutControllerBaseActionController =
      ActionController(name: '_WorkoutControllerBase');

  @override
  dynamic setCalories(int val) {
    final _$actionInfo = _$_WorkoutControllerBaseActionController.startAction(
        name: '_WorkoutControllerBase.setCalories');
    try {
      return super.setCalories(val);
    } finally {
      _$_WorkoutControllerBaseActionController.endAction(_$actionInfo);
    }
  }

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
  dynamic stopWorkout() {
    final _$actionInfo = _$_WorkoutControllerBaseActionController.startAction(
        name: '_WorkoutControllerBase.stopWorkout');
    try {
      return super.stopWorkout();
    } finally {
      _$_WorkoutControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
mostraBotao: ${mostraBotao},
running: ${running},
user: ${user},
error: ${error},
buttonText: ${buttonText},
currentPosition: ${currentPosition},
inicialPosition: ${inicialPosition},
calories: ${calories},
currentSpeed: ${currentSpeed},
start: ${start},
timeValue: ${timeValue},
finishedWorkout: ${finishedWorkout},
tempoInicial: ${tempoInicial}
    ''';
  }
}
