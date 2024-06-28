import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validation/LoginPage1.dart';

void main()
{
runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Splash_Screen(),));
}

class Splash_Screen extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>Splash_ScreenState();

}

class Splash_ScreenState extends State
{  
  @override
  void initState()
  {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Login_Page()));
     });
    super.initState();
  

  }
  
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: Color.fromARGB(255, 202, 197, 101),
    body: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/earth.png",height: 200,width: 200,),
        SizedBox(height: 40,),
        Text("Lets Go To Travel",style:GoogleFonts.pacifico(fontSize: 25,),)
      ],
    ),
  ),
   );
  }
}