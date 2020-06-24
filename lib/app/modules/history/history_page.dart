import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_treino/app/shared/widgets/splash_page.dart';
import 'history_controller.dart';

class HistoryPage extends StatefulWidget {
  final String title;
  const HistoryPage({Key key, this.title = "History"}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends ModularState<HistoryPage, HistoryController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Histórico de treino"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Modular.to.pushReplacementNamed('/');
          },
        ),
      ),
      body: _body(),
    );
  }

  _body() {
    return Observer(
      builder: (_) => controller.list != null
          ? PageView(
              children: <Widget>[
                ListView.builder(
                    itemCount: controller.list.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      var history = controller.list[index];
                      return ListTile(
                        title: Text(history.workoutName),
                      );
                    })
              ],
            )
          : SplashPage(),
    );
  }
}
