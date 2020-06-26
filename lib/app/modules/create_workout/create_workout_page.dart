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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: controller.workout,
        label: Container(
          child: Text("Ir para o treino"),
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
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset("assets/images/bughi.jpeg"),
                ),
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
                  InputField(
                    hint: "Nome",
                    onChanged: controller.onChangeName,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InputField(
                    hint: "Duração",
                    keyboardType: TextInputType.number,
                    onChanged: controller.onChangeDuration,
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
