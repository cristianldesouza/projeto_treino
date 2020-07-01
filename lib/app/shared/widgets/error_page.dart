import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String erroText;
  final Function(bool) gpsAtivo;

  const ErrorPage({Key key, @required this.erroText, this.gpsAtivo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 150,
            ),
            Icon(
              Icons.warning,
              color: Colors.white,
              size: 50,
            ),
            Text(
              erroText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            FloatingActionButton.extended(
                onPressed: () => gpsAtivo(true),
                label: Text(
                  'Já ativei o GPS, meu chapa.',
                  style: TextStyle(
                    color: Colors.deepPurple,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
