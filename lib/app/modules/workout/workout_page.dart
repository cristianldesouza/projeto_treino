import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('${widget.title} ${widget.id}'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: controller.backToHome,
          )),
      body: Observer(builder: (_) {
        return !controller.hasError
            ? SafeArea(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text('oi'),
                    )
                  ],
                ),
              )
            : SafeArea(
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
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
