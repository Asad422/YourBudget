// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/about_app.dart';
import 'package:project/calculator.dart';
import 'package:project/calculator_tax.dart';
import 'package:project/common_widgets.dart';
import 'package:project/financial_literacy.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return   Scaffold(
      backgroundColor:  Colors.transparent,
      body: Container(
        height: context.screenHeight,
        width: context.screenWidth,
        decoration: const  BoxDecoration(
          image: DecorationImage(image: 
          AssetImage('assets/images/homescreen.png',

          ),fit: BoxFit.cover)
        ),
        child: Padding(
          padding:  EdgeInsets.only(top: context.screenHeight/3),
          child: Column(
            children: [
             Text('   ТВОЙ\nБЮДЖЕТ',style: GoogleFonts.jost(
            fontSize: 30,
            wordSpacing: 0.5
            
          ),),
      const     SizedBox(height: 8),
          Column(children: [
          
          mainMenuButton(text :'Финансовая грамотность', onPress: (){
            Future.delayed(Duration(milliseconds: 500),(){
               Navigator.push(context, MaterialPageRoute(builder: (context)=> Literacy()));
              
            });
          
          },),
          const SizedBox(height: 8,),
          mainMenuButton(text :'Инвестиционный калькулятор', onPress: (){
             
            Future.delayed(Duration(milliseconds: 500),(){
               Navigator.push(context, MaterialPageRoute(builder: (context)=> Calculator()));
              
            });
          
          },),  const SizedBox(height: 8,),
            mainMenuButton(text :'Калькулятор НДФЛ', onPress: (){
             
            Future.delayed(Duration(milliseconds: 500),(){
               Navigator.push(context, MaterialPageRoute(builder: (context)=> CalculatorTax()));
              
            });
          
          },),
           const SizedBox(height: 8,),
          mainMenuButton(text : 'О приложении', onPress: (){
Future.delayed(Duration(milliseconds: 500),(){
               Navigator.push(context, MaterialPageRoute(builder: (context)=> About()));
              
            });
          },),
          
          ],)
          ],),
        )
      ),
    );
  }
}