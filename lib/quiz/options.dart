import 'package:flutter/material.dart';

import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final Function selectHandler;
  final List<Map<String, Object>> questions;
  final int index;

  Quiz({
    required this.selectHandler,
    required this.questions,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final Object? questionText = questions[index]['questionText'];

    return Column(
      children: <Widget>[
        Question(
          questionText: questionText.toString(),
        ),
        ...(questions[index]['answers'] as List<Map>).map((answer) {
          return Answer(() => selectHandler(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
