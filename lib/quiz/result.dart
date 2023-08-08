import 'package:flutter/material.dart';
import 'package:project/common_widgets.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final void Function() resetHandler;

  Result(this.resultScore, this.resetHandler);



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            'Кол-во правильных ответов : $resultScore / 10',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15,),
          mainMenuButton(text: 'Пройти еще раз',onPress: resetHandler)
        ],
      ),
    );
  }
}
