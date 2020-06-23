import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:projeto_treino/app/shared/widgets/error_page.dart';
import 'package:projeto_treino/app/shared/widgets/splash_page.dart';
import 'workout_controller.dart';

class WorkoutPage extends StatefulWidget {
  final String title;
  final int id;
  const WorkoutPage({Key key, this.title = "Treino", this.id})
      : super(key: key);

  @override
  _WorkoutPageState createState() => _WorkoutPageState();
}

class _WorkoutPageState extends ModularState<WorkoutPage, WorkoutController> {
  @override
  void initState() {
    super.initState();
    final dispose = autorun((_) {
      controller.getLocationStream();
    });

    dispose();
  }

  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title} ${widget.id}'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: controller.backToHome,
        ),
      ),
      body: Observer(
        builder: (_) {
          if (controller.inicialPosition == null && controller.error == null) {
            return SplashPage();
          }
          if (controller.error != null) {
            return ErrorPage(
              erroText: controller.error,
            );
          }

          var position = controller.inicialPosition;
          if (controller.currentPosition.data != null) {
            position = controller.currentPosition.data;
          }

          var speedX = "0.0";

          if (controller.currentSpeed != null &&
              controller.currentSpeed.data != null &&
              controller.currentSpeed.data.x > 0) {
            speedX = controller.currentSpeed.data.x.toStringAsFixed(1);
          }

          final Set<Marker> _markers = {
            Marker(
              markerId: MarkerId("currentPositon"),
              position: LatLng(
                position.latitude,
                position.longitude,
              ),
              icon: BitmapDescriptor.defaultMarker,
            )
          };

          return Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
                child: GoogleMap(
                  markers: _markers,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      position.latitude,
                      position.longitude,
                    ),
                    zoom: 18.0,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              ),
              SizedBox(
                height: 75,
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Velocidade sugerida: ${controller.speed} km/h',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Velocidade atual: ${speedX} km/h',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        formatHHMMSS(controller.start).toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        child: FloatingActionButton.extended(
                          isExtended: true,
                          label: Text(controller.buttonText,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              )),
                          onPressed: controller.startWorkout,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

String formatHHMMSS(int seconds) {
  int hours = (seconds / 3600).truncate();
  seconds = (seconds % 3600).truncate();
  int minutes = (seconds / 60).truncate();

  String hoursStr = (hours).toString().padLeft(2, '0');
  String minutesStr = (minutes).toString().padLeft(2, '0');
  String secondsStr = (seconds % 60).toString().padLeft(2, '0');

  if (hours == 0) {
    return "$minutesStr:$secondsStr";
  }

  return "$hoursStr:$minutesStr:$secondsStr";
}
