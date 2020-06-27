import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_treino/app/shared/widgets/input_field.dart';
import 'user_options_controller.dart';

class UserOptionsPage extends StatefulWidget {
  final String title;
  const UserOptionsPage({Key key, this.title = "Informações do gordinho"})
      : super(key: key);

  @override
  _UserOptionsPageState createState() => _UserOptionsPageState();
}

class _UserOptionsPageState
    extends ModularState<UserOptionsPage, UserOptionsController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Observer(
            builder: (_) => Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Image.asset(
                    'assets/images/fat.png',
                    height: 125,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InputField(
                  labelText: "Nome",
                  inputTextColor: Colors.white,
                  onChanged: controller.setName,
                ),
                SizedBox(
                  height: 10,
                ),
                InputField(
                    labelText: "Idade",
                    inputTextColor: Colors.white,
                    keyboardType: TextInputType.number,
                    onChanged: (idade) {
                      controller.setIdade(int.parse(idade));
                    }),
                SizedBox(
                  height: 10,
                ),
                InputField(
                  labelText: "Altura",
                  inputTextColor: Colors.white,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
                InputField(
                  labelText: "Peso",
                  inputTextColor: Colors.white,
                  suffixText: "kg",
                  suffixStyle: TextStyle(color: Colors.white, fontSize: 20),
                  keyboardType: TextInputType.number,
                  onChanged: (peso) {
                    controller.setPeso(double.parse(peso));
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 250,
                  child: FloatingActionButton.extended(
                    isExtended: true,
                    label: Text(
                      "Salvar",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.deepPurple,
                      ),
                    ),
                    onPressed: controller.saveUser,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}