// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WorkoutController on _WorkoutControllerBase, Store {
  Computed<bool> _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_WorkoutControllerBase.hasError'))
          .value;
  Computed<String> _$errorTextComputed;

  @override
  String get errorText =>
      (_$errorTextComputed ??= Computed<String>(() => super.errorText,
              name: '_WorkoutControllerBase.errorText'))
          .value;

  final _$gpsStatusAtom = Atom(name: '_WorkoutControllerBase.gpsStatus');

  @override
  bool get gpsStatus {
    _$gpsStatusAtom.reportRead();
    return super.gpsStatus;
  }

  @override
  set gpsStatus(bool value) {
    _$gpsStatusAtom.reportWrite(value, super.gpsStatus, () {
      super.gpsStatus = value;
    });
  }

  final _$geolocationStatusAtom =
      Atom(name: '_WorkoutControllerBase.geolocationStatus');

  @override
  GeolocationStatus get geolocationStatus {
    _$geolocationStatusAtom.reportRead();
    return super.geolocationStatus;
  }

  @override
  set geolocationStatus(GeolocationStatus value) {
    _$geolocationStatusAtom.reportWrite(value, super.geolocationStatus, () {
      super.geolocationStatus = value;
    });
  }

  final _$positionAtom = Atom(name: '_WorkoutControllerBase.position');

  @override
  ObservableStream<Position> get position {
    _$positionAtom.reportRead();
    return super.position;
  }

  @override
  set position(ObservableStream<Position> value) {
    _$positionAtom.reportWrite(value, super.position, () {
      super.position = value;
    });
  }

  final _$getLocationAsyncAction =
      AsyncAction('_WorkoutControllerBase.getLocation');

  @override
  Future getLocation() {
    return _$getLocationAsyncAction.run(() => super.getLocation());
  }

  @override
  String toString() {
    return '''
gpsStatus: ${gpsStatus},
geolocationStatus: ${geolocationStatus},
position: ${position},
hasError: ${hasError},
errorText: ${errorText}
    ''';
  }
}
