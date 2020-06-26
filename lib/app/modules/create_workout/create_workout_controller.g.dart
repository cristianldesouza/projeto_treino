// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_workout_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateWorkoutController on _CreateWorkoutControllerBase, Store {
  final _$nameAtom = Atom(name: '_CreateWorkoutControllerBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$titleAtom = Atom(name: '_CreateWorkoutControllerBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$durationAtom = Atom(name: '_CreateWorkoutControllerBase.duration');

  @override
  int get duration {
    _$durationAtom.reportRead();
    return super.duration;
  }

  @override
  set duration(int value) {
    _$durationAtom.reportWrite(value, super.duration, () {
      super.duration = value;
    });
  }

  final _$_CreateWorkoutControllerBaseActionController =
      ActionController(name: '_CreateWorkoutControllerBase');

  @override
  dynamic onChangeName(dynamic name) {
    final _$actionInfo = _$_CreateWorkoutControllerBaseActionController
        .startAction(name: '_CreateWorkoutControllerBase.onChangeName');
    try {
      return super.onChangeName(name);
    } finally {
      _$_CreateWorkoutControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onChangeDuration(dynamic duration) {
    final _$actionInfo = _$_CreateWorkoutControllerBaseActionController
        .startAction(name: '_CreateWorkoutControllerBase.onChangeDuration');
    try {
      return super.onChangeDuration(duration);
    } finally {
      _$_CreateWorkoutControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic workout() {
    final _$actionInfo = _$_CreateWorkoutControllerBaseActionController
        .startAction(name: '_CreateWorkoutControllerBase.workout');
    try {
      return super.workout();
    } finally {
      _$_CreateWorkoutControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
title: ${title},
duration: ${duration}
    ''';
  }
}
