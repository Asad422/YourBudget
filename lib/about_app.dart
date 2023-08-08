import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/home_page.dart';

class About extends StatelessWidget {
  const About({super.key});

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
                'О приложении',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600, color: Colors.black, fontSize: 20),
              )),
              
              
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(child:  Text('Привет, уважаемый пользователь!\n\nНаше приложение создано, чтобы у вас не было проблем с изучением и соблюдением финансовой грамотности. С этим вам поможет отфильтрованная, важная информация о ней и пару незаменимых калькуляторов, которые помогут упростить ведение бюджета',
                              
                               style: GoogleFonts.sansita(
                                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15,height: 1.4),
                              ),
                            ),
                ),
              )),
    );
  }
}