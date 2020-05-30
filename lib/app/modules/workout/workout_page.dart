import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
          )),
      body: Observer(
        builder: (_) {
          if (!controller.hasError && controller.inicialPosition != null) {
            final Set<Marker> _markers = {
              Marker(
                markerId: MarkerId("111"),
                position: LatLng(
                  controller.inicialPosition.latitude,
                  controller.inicialPosition.longitude,
                ),
                icon: BitmapDescriptor.defaultMarker,
              )
            };

            return GoogleMap(
              markers: _markers,
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  controller.inicialPosition.latitude,
                  controller.inicialPosition.longitude,
                ),
                zoom: 19.0,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            );
          } else {
            return SafeArea(
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 220,
                    ),
                    Icon(
                      Icons.warning,
                      color: Colors.white,
                    ),
                    Text(
                      controller.errorText,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
