import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_treino/app/shared/widgets/splash_page.dart';
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
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: controller.pushSettings,
          )
        ],
      ),
      body: Observer(
        builder: (_) => controller.user != null ? _widgetHome() : SplashPage(),
      ),
    );
  }

  Widget _widgetHome() {
    return SingleChildScrollView(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 120,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.8,
              height: MediaQuery.of(context).size.width / 1.8,
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
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.8,
              height: MediaQuery.of(context).size.width / 4,
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
          ],
        ),
      ),
    );
  }
}
