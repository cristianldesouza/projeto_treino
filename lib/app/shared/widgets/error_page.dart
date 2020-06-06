import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String erroText;

  const ErrorPage({Key key, @required this.erroText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              erroText,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
