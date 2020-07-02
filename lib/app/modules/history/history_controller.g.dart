// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HistoryController on _HistoryControllerBase, Store {
  final _$listAtom = Atom(name: '_HistoryControllerBase.list');

  @override
  List<WorkoutModel> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(List<WorkoutModel> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$getAllWorkoutsAsyncAction =
      AsyncAction('_HistoryControllerBase.getAllWorkouts');

  @override
  Future getAllWorkouts() {
    return _$getAllWorkoutsAsyncAction.run(() => super.getAllWorkouts());
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
