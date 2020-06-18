import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_timer/flutter_timer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
  //use 'controller' variable to access controller

  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
  }

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
          print(controller.currentPosition.data);
          if (controller.currentPosition.data == null &&
              controller.error == null) {
            return SplashPage();
          }

          if (controller.error != null) {
            return ErrorPage(
              erroText: controller.error,
            );
          }

          var position = controller.currentPosition.data;

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
                    zoom: 19.0,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              ),
              SizedBox(
                height: 75,
              ),
              Observer(
                builder: (_) {
                  print(controller.currentSpeed);

                  return controller.mostraBotao
                      ? FlatButton(
                          color: Colors.white,
                          textColor: Colors.black,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
                          padding: EdgeInsets.all(8.0),
                          splashColor: Colors.blueAccent,
                          onPressed: controller.startWorkout,
                          child: Text(
                            "Iniciar Treino",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        )
                      : Column(children: <Widget>[
                          Text(
                            'Velocidade sugerida: ${controller.speed.toString()} km/h',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Velocidade atual: 44 km/h',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          TikTikTimer(
                            initialDate: DateTime.now(),
                            running: controller.running,
                            height: 100,
                            width: 100,
                            backgroundColor: Colors.indigo,
                            timerTextStyle:
                                TextStyle(color: Colors.white, fontSize: 20),
                            borderRadius: 100,
                            isRaised: true,
                            tracetime: (time) {
                              //print(time.getCurrentMinute);
                              switch (time.getCurrentMinute) {
                                case 0:
                                  controller.speed = 4;
                                  break;
                                case 5:
                                  controller.speed = 6;
                                  break;
                                case 15:
                                  controller.speed = 5;
                                  break;
                                case 20:
                                  controller.speed = 10;
                                  break;
                                case 30:
                                  controller.mostraBotao = true;
                                  controller.running = false;
                                  break;
                                default:
                              }

                              // if (time.getCurrentSecond == 10) {
                              //   controller.mostraBotao = true;
                              // }
                            },
                          ),
                        ]);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
