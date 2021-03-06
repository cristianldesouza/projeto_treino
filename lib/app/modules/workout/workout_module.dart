import 'package:geolocator/geolocator.dart';
import 'package:projeto_treino/app/modules/workout/workout_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_treino/app/modules/workout/workout_page.dart';
import 'package:projeto_treino/app/shared/services/acelerometer/user_acelerometer_service.dart';
import 'package:projeto_treino/app/shared/services/geolocator/check_gps_service.dart';
import 'package:projeto_treino/app/shared/services/geolocator/current_location.dart';
import 'package:projeto_treino/app/shared/services/geolocator/current_location_stream.dart';
import 'package:projeto_treino/app/shared/services/shared_preferences/get_user_service.dart';
import 'package:projeto_treino/app/shared/services/shared_preferences/save_workout_service.dart';

class WorkoutModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SaveWorkoutService()),
        Bind(
          (i) => Geolocator()..forceAndroidLocationManager = true,
        ),
        Bind(
          (i) => UserAcelerometerService(),
        ),
        Bind(
          (i) => WorkoutController(
            getUserService: GetUserService(),
            checkGpsService: CheckGpsService(
              geolocator: i.get<Geolocator>(),
            ),
            currentLocationStream: CurrentLocationStream(
              geolocator: i.get<Geolocator>(),
            ),
            currentLocation: CurrentLocation(
              geolocator: i.get<Geolocator>(),
            ),
            userAcelerometerService: i.get<UserAcelerometerService>(),
            saveWorkoutService: i.get<SaveWorkoutService>(),
          ),
        )
      ];

  @override
  List<Router> get routers => [
        Router("/workout", child: (_, args) => WorkoutPage(workout: args.data)),
      ];

  static Inject get to => Inject<WorkoutModule>.of();
}
