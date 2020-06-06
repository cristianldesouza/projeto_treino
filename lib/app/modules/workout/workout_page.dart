import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
            ],
          );
        },
      ),
    );
  }
}
