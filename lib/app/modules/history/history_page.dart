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
                ListView.separated(
                    padding: const EdgeInsets.only(top: 4.0),
                    itemCount: controller.list.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                          height: 4,
                        ),
                    itemBuilder: (BuildContext ctxt, int index) {
                      var history = controller.list[index];
                      return Container(
                        padding: const EdgeInsets.only(top: 4, bottom: 4),
                        color: Colors.white,
                        child: ListTile(
                          leading: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                history.date,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          title: Text(history.workoutName),
                          subtitle: Text(
                              "Duração: ${history.duration} min \nVel: ${history.velocity} km/h"),
                          trailing: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text("Calorias: ${history.calories} kcal"),
                            ],
                          ),
                        ),
                      );
                    })
              ],
            )
          : SplashPage(),
    );
  }
}
