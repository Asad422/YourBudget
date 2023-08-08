// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'dart:math';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/home_page.dart';


class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final _period = [
    'Раз в месяц',
    'Раз в квартал',
    'Раз в полгода',
    'Раз в год'
  ];
  String? selectedValue;

  num income = 0;
  num sum = 0;
  int n = 0;
  TextEditingController start = TextEditingController();
  TextEditingController term = TextEditingController();
  TextEditingController bet = TextEditingController();

   final snackBar = SnackBar(
  content: Text('Проверьте заполненость всех полей'),
);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () { 
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> HomePage()));
         return Future.value(true);
       },
      child: GestureDetector(
          onPanUpdate: (details) {
      
      if (details.delta.dx > 20) {
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
      }},
        child: Scaffold(
            resizeToAvoidBottomInset: false, 
          
          appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: Text(
                'Инвестиционный калькулятор',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600, color: Colors.black, fontSize: 20),
              )),
          body: Container(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: start,
                      keyboardType: TextInputType.number,
                      cursorColor: Color.fromRGBO(0, 73, 119, 0.55),
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      decoration: const InputDecoration(
                        suffixIcon: Icon(
                          Icons.currency_ruble,
                          color: Colors.black,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 3,
                          color: Color.fromRGBO(0, 73, 119, 0.55),
                        )),
                        border: OutlineInputBorder(),
                        labelStyle:
                            TextStyle(color: Color.fromRGBO(0, 73, 119, 0.55)),
                        labelText: 'Стартовый капитал',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: term,
                      keyboardType: TextInputType.number,
                      cursorColor: Color.fromRGBO(0, 73, 119, 0.55),
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      decoration: const InputDecoration(
                        suffixText: 'лет',
                        suffixStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 3,
                          color: Color.fromRGBO(0, 73, 119, 0.55),
                        )),
                        border: OutlineInputBorder(),
                        labelStyle:
                            TextStyle(color: Color.fromRGBO(0, 73, 119, 0.55)),
                        labelText: 'Срок инвестирования',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: bet,
                      keyboardType: TextInputType.number,
                      cursorColor: Color.fromRGBO(0, 73, 119, 0.55),
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      decoration: const InputDecoration(
                        suffixIcon: Icon(
                          Icons.percent,
                          color: Colors.black,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 3,
                          color: Color.fromRGBO(0, 73, 119, 0.55),
                        )),
                        border: OutlineInputBorder(),
                        labelStyle:
                            TextStyle(color: Color.fromRGBO(0, 73, 119, 0.55)),
                        labelText: 'Ставка',
                      ),
                    ),
                    SizedBox(height: 10),
                    DropdownButtonFormField2<String>(
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 3,
                          color: Color.fromRGBO(0, 73, 119, 0.55),
                        )),
                        border: OutlineInputBorder(),
                        labelStyle:
                            TextStyle(color: Color.fromRGBO(0, 73, 119, 0.55)),
                        labelText: 'Период реинвестирования',
                      ),
                      hint: Text(
                        'Выберите период',
                        style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(0, 73, 119, 0.55)),
                      ),
                      items: _period
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Пожалуйста выберите период';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.only(right: 8),
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 24,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Доход :',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: income.toStringAsFixed(2),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              WidgetSpan(
                                child: Icon(Icons.currency_ruble),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Итоговая сумма :',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: sum.toStringAsFixed(2),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              WidgetSpan(
                                child: Icon(Icons.currency_ruble),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(0, 73, 119, 0.8)),
                        onPressed: () {
                       
                         if (start.text != '' && bet.text != '' && term.text !='' && selectedValue != null ){
                           calculate(
                          double.parse(start.text)
                          ,double.parse(bet.text)
                          ,double.parse(term.text));
                         }
                           else{
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                           }
                        
                        },
                        child: Text('Рассчитать'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void calculate(start, betPercent, term) {
    switch (selectedValue) {
      case 'Раз в месяц':
        n = 12;
        break;
      case 'Раз в квартал':
        n = 3;
        break;
      case 'Раз в полгода':
        n = 2;
        break;
      case 'Раз в год':
        n = 1;
        break;
    }
    var betNum = betPercent / 100;

    final A = (1 + betNum / n);
    final B = n * term;

    final C = pow(A, B);
    final D = start * C;

    setState(() {
      if(D < 9999999999999)  sum = D;

      else sum = 9999999999999;
             


      income = sum - start;
    });
  }
}
