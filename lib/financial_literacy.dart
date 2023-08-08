import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/common_widgets.dart';
import 'package:project/home_page.dart';
import 'package:project/quiz/quiz.dart';


class Literacy extends StatelessWidget {
  const Literacy({super.key});

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
                  'Для чего нужна финансовая грамотность',
                  style: GoogleFonts.sansita(
                      fontWeight: FontWeight.w600, color: Colors.black, fontSize: 16),
                )),
                
                body:  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ListView(
                            physics: BouncingScrollPhysics(),
                            children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Умение распоряжаться деньгами является основой жизненной стабильности и материального благополучия:',
                                
                                 style: GoogleFonts.sansita(
                                  fontWeight: FontWeight.w500, color: Colors.grey, fontSize: 18,height: 1.4),
                                ),
                              ],
                            ),
                              SizedBox(height : 15),
                               Text('  -  Благодаря финансовой грамотности вы сможете больше зарабатывать. Это означает возможность со временем иметь все, что хочется, а также развиваться, становиться более независимым.',
                            
                             style: GoogleFonts.sansita(
                              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15,height: 1.4),
                            ),
                            SizedBox(height : 15),
                               Text('  -  Вы чувствуете себя комфортно сегодня, у вас формируется уверенность в будущем. Ведь деньги тратятся только на необходимое и полезное. А знания и гибкое мышление помогают правильно вести себя при изменившихся обстоятельствах.',
                            
                             style: GoogleFonts.sansita(
                              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15,height: 1.4),
                            ),
                            
                            SizedBox(height : 15),
                               Text('  -  Вы становитесь более дисциплинированным. Это качество делает проще все сферы жизни, не только денежную.',
                            
                             style: GoogleFonts.sansita(
                              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15,height: 1.4),
                            ),
                             SizedBox(height : 15),
                               Text('  -  У окружающих появляется еще один повод уважать вас, что повышает самооценку. Люди видят пример успеха, достигнутого честным путем, знаниями и самодисциплиной, а это вдохновляет.',
                            
                             style: GoogleFonts.sansita(
                              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15,height: 1.4),
                            ),
                            SizedBox(height : 15),
                            
                             Text('Вы можете проверить свою финансовую грамотность пройдя тест ниже',
                            
                             style: GoogleFonts.sansita(
                              fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 15,height: 1.4),
                            ),
                              SizedBox(height : 15),
                               Center(
                                 child: mainMenuButton(text :'Quiz', onPress: (){
                                            
                                           Future.delayed(Duration(milliseconds: 500),(){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=> QuizMain()));
                                             
                                           });
                                         
                                         },),
                               ),
                          ]),
                  
                ),
                
                ),
      ),
    );
  }
}