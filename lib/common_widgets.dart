import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

Widget mainMenuButton({ text,onPress,}){
  return 

     AnimatedButton(
            
              selectedBackgroundColor: Colors.black  ,
               height: 70,
                animationDuration: Duration(milliseconds: 500),
               width: 300,
               text: text,
               isReverse: true,
               selectedTextColor: Colors.white,
               transitionType: TransitionType.LEFT_TO_RIGHT,
               textStyle: TextStyle(color: Colors.black,fontSize: 20),
               backgroundColor: Colors.white,
               borderColor: Colors.black,
             
               borderWidth: 1, onPress: onPress,
     );
}