import 'package:flutter/material.dart';
import 'package:project/quiz/options.dart';
import 'package:project/quiz/result.dart';

class QuizMain extends StatefulWidget {
  const QuizMain({super.key});
 State<StatefulWidget> createState() {
    // TODO: implement createState
    return _QuizState();
  }
}



class _QuizState extends State<QuizMain> {
  final _questions = const [
	{
	'questionText': 'Какие из перечисленных вариантов являются инвестиционными продуктами?',
	'answers': [
		{'text': 'Сберегательный счет', 'score': 0},
		{'text': 'Облигации', 'score': 1},
		{'text': 'Кредитная карта', 'score': 0},
	],
	},
{
	'questionText': 'Какой из перечисленных финансовых инструментов не является рискованным?',
	'answers': [
		{'text': 'Акции', 'score': 0},
		{'text': 'Вклады в банки', 'score': 1},
		{'text': 'Криптовалюта', 'score': 0},
	],
	},
{
	'questionText': 'Что такое кредитный рейтинг?',
	'answers': [
		{'text': 'Оценка кредитоспособности заемщика' , 'score': 1},
		{'text': 'Сумма кредита, которую можно получить', 'score': 0},
		{'text': 'Процентная ставка по кредиту', 'score': 0},
	],
	},
  {
	'questionText': 'Какой из перечисленных видов страхования обязателен при покупке недвижимости?',
	'answers': [
		{'text': 'Медицинское страхование' , 'score':   0},
		{'text': 'Автомобильное страхование', 'score': 0},
		{'text': 'Страхование жилья', 'score': 1},
	],
	},
  {
	'questionText': 'Какой из перечисленных видов дохода является наиболее надежным?',
	'answers': [
		{'text': 'Заработная плата' , 'score':   1},
		{'text': 'Дивиденды от акций', 'score': 0},
		{'text': 'Выигрыш в лотерее', 'score': 0},
	],
	},
  {
	'questionText': 'Что такое диверсификация портфеля?',
	'answers': [
		{'text': 'Разнообразие инвестиционных инструментов для снижения риска' , 'score':   1},
		{'text': 'Покупка только одного вида акций', 'score': 0},
		{'text': 'Инвестирование только в рискованные инструменты', 'score': 0},
	],
	},
	 {
	'questionText': 'Какой из перечисленных видов кредитования является наиболее выгодным?',
	'answers': [
		{'text': 'Кредит наличными' , 'score':   0},
		{'text': 'Кредитная карта', 'score': 0},
		{'text': 'Ипотека', 'score': 1},
	],
	},
	
	{
	'questionText': 'Какой процент от дохода рекомендуется откладывать на накопления?',
	'answers': [
		{'text': '10-15%' , 'score':   1},
		{'text': '30-40%', 'score': 0},
		{'text': '50-60%', 'score': 0},
	],
	},
  {
	'questionText': 'Что такое инфляция?',
	'answers': [
		{'text': 'Рост цен на товары и услуги' , 'score':   1},
		{'text': 'Снижение цен на товары и услуги%', 'score': 0},
		{'text': 'Стабильность цен на товары и услуги%', 'score': 0},
	],
	},
    {
	'questionText': 'Какой из перечисленных видов инвестиций является наиболее рискованным??',
	'answers': [
		{'text': 'Облигации' , 'score':   0},
		{'text': 'Фондовый рынок', 'score': 1},
		{'text': 'Вклады в банке', 'score': 0},
	],
	},
  
];

var _questionIndex = 0;
var _totalScore = 0;

void _resetQuiz() {
	setState(() {
	_questionIndex = 0;
	_totalScore = 0;
	});
}

void _answerQuestion(int score) {
	_totalScore += score;

	setState(() {
	_questionIndex = _questionIndex + 1;
	});
	// ignore: avoid_print
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40,vertical:100 ),
        child: Center(
          child: _questionIndex < _questions.length
            ? Quiz(
              selectHandler: _answerQuestion,
              index: _questionIndex,
              questions: _questions,
              ) //Quiz
            : Result(_totalScore, _resetQuiz),
        ),
     //Padding
      ),
    );
}}