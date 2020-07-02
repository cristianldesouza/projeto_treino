import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_treino/app/shared/models/user_model.dart';
import 'package:projeto_treino/app/shared/widgets/input_field.dart';
import 'user_options_controller.dart';

class UserOptionsPage extends StatefulWidget {
  final String title;
  final UserModel user;

  const UserOptionsPage(
      {Key key, this.user, this.title = "Informações do gordinho"})
      : super(key: key);

  @override
  _UserOptionsPageState createState() => _UserOptionsPageState();
}

class _UserOptionsPageState
    extends ModularState<UserOptionsPage, UserOptionsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: widget.user == null
            ? null
            : IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Modular.to.pushReplacementNamed('/')),
        title: Text(widget.title),
      ),
      body: _userWidget(widget.user),
    );
  }

  Widget _userWidget(user) {
    if (user != null) {
      controller.setName(user.nome);
      controller.setAltura(user.altura);
      controller.setIdade(user.idade);
      controller.setPeso(user.peso);
    }

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
              initialValue: user == null ? "" : user.nome,
              labelText: "Nome",
              inputTextColor: Colors.white,
              onChanged: controller.setName,
              errorText: controller.errorName,
            ),
            SizedBox(
              height: 10,
            ),
            InputField(
                initialValue: user == null ? "" : user.idade.toString(),
                labelText: "Idade",
                inputTextColor: Colors.white,
                keyboardType: TextInputType.number,
                errorText: controller.errorIdade,
                onChanged: (idade) {
                  controller.setIdade(int.parse(idade));
                }),
            SizedBox(
              height: 10,
            ),
            InputField(
              initialValue: user == null ? "" : user.altura.toString(),
              labelText: "Altura",
              suffixText: "cm",
              inputTextColor: Colors.white,
              keyboardType: TextInputType.number,
              errorText: controller.errorAltura,
              onChanged: (altura) {
                controller.setAltura(double.parse(altura));
              },
            ),
            SizedBox(
              height: 10,
            ),
            InputField(
              initialValue: user == null ? "" : user.peso.toString(),
              labelText: "Peso",
              inputTextColor: Colors.white,
              suffixText: "kg",
              suffixStyle: TextStyle(color: Colors.white, fontSize: 20),
              keyboardType: TextInputType.number,
              errorText: controller.errorPeso,
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
    );
  }
}
