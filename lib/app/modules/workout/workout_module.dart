import 'package:geolocator/geolocator.dart';
import 'package:projeto_treino/app/modules/workout/workout_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_treino/app/modules/workout/workout_page.dart';
import 'package:projeto_treino/app/shared/services/geolocator/check_gps_service.dart';
import 'package:projeto_treino/app/shared/services/geolocator/current_location_stream.dart';

class WorkoutModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => Geolocator()..forceAndroidLocationManager = true,
        ),
        Bind(
          (i) => WorkoutController(
            checkGpsService: CheckGpsService(
              geolocator: i.get<Geolocator>(),
            ),
            currentLocationStream: CurrentLocationStream(
              geolocator: i.get<Geolocator>(),
            ),
          ),
        )
      ];

  @override
  List<Router> get routers => [
        Router("/workout", child: (_, args) => WorkoutPage(id: args.data)),
      ];

  static Inject get to => Inject<WorkoutModule>.of();
}
