import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_treino/app/shared/widgets/input_field.dart';
import 'create_workout_controller.dart';

class CreateWorkoutPage extends StatefulWidget {
  final String title;
  const CreateWorkoutPage({Key key, this.title = "CreateWorkout"})
      : super(key: key);

  @override
  _CreateWorkoutPageState createState() => _CreateWorkoutPageState();
}

class _CreateWorkoutPageState
    extends ModularState<CreateWorkoutPage, CreateWorkoutController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 1,
        title: Text("Monte seu treino"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Modular.to.pushReplacementNamed('/');
          },
        ),
      ),
      body: _body(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          bottom: 60,
        ),
        child: FloatingActionButton.extended(
          backgroundColor: Colors.deepPurple,
          onPressed: controller.workout,
          label: Container(
            child: Text(
              "Ir para o treino",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _body() {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              height: 120,
              color: Colors.deepPurple,
              margin: const EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset("assets/images/bughi.jpeg"),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset("assets/images/bughi.jpeg"),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset("assets/images/bughi.jpeg"),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset("assets/images/bughi.jpeg"),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset("assets/images/bughi.jpeg"),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Observer(
                    builder: (_) => Text(
                      controller.title,
                      style: TextStyle(fontSize: 30, color: Colors.deepPurple),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Observer(
                    builder: (_) => InputField(
                      inputTextColor: Colors.deepPurple,
                      hintColor: Colors.deepPurple,
                      colorBorder: Colors.deepPurple,
                      hint: "Nome",
                      onChanged: controller.onChangeName,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Observer(
                    builder: (_) => InputField(
                      inputTextColor: Colors.deepPurple,
                      hintColor: Colors.deepPurple,
                      colorBorder: Colors.deepPurple,
                      hint: "Duração",
                      suffixText: "Minutos",
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        controller.time = int.parse(value);
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
