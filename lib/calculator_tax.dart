// ignore_for_file: prefer_const_constructors



import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/home_page.dart';

class CalculatorTax extends StatefulWidget {
  const CalculatorTax({super.key});

  @override
  State<CalculatorTax> createState() => _CalculatorTaxState();
}

class _CalculatorTaxState extends State<CalculatorTax> {
  final _period = [
    'Подоходный налог (13%-15%)',
    'Налог на диведенды (13%)',
    'НДФЛ для нерезидентов (30%)',
    'Налог на выигрыши (35%)'
  ];
  String? selectedValue;

   num end = 0;

  TextEditingController start = TextEditingController();
  

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
                'Калькулятор НДФЛ',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600, color: Colors.black, fontSize: 20),
              )),
          body: SingleChildScrollView(
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
                      labelText: 'Сумма до налогообложения',
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
                      labelText: 'Налог',
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
                        return 'Пожалуйста выберите ставку';
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
                 
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Сумма после налогообложения :',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: end.toStringAsFixed(2),
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
                     
                       if (start.text != '' && selectedValue != null){
                         calculate(
                        double.parse(start.text)
                         );
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
    );
  }

  void calculate(start) {
    late  double tax;
    switch (selectedValue) {
      case 'Подоходный налог (13%-15%)':
        tax = 0.14;
        break;
      case 'Налог на диведенды (13%)':
        tax = 0.13;
        break;
      case 'НДФЛ для нерезидентов (30%)':
        tax = 0.3;
        break;
      case 'Налог на выигрыши (35%)':
        tax = 0.35;
        break;
    }

    setState(() {
      end = start - start*tax;
    });
  }
}
