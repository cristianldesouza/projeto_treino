import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "EmagreceBughi"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 120,
          ),
          Center(
            child: Container(
              width: 200,
              height: 100,
              child: RaisedButton(
                elevation: 10,
                splashColor: Colors.white,
                color: Colors.white10,
                child: Text(
                  'Monte seu treino',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  controller.pushCreateWorkout();
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              width: 200,
              height: 50,
              child: RaisedButton(
                splashColor: Colors.white,
                elevation: 10,
                color: Colors.white10,
                child: Text(
                  'Histórico',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  controller.pushHistory();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
