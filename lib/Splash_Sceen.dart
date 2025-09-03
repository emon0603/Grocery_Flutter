import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceries/utils/AppColors.dart';

import 'HomePage.dart';

class Splash_Sceen extends StatefulWidget {
  const Splash_Sceen({super.key});

  @override
  State<Splash_Sceen> createState() => _Splash_SceenState();
}

class _Splash_SceenState extends State<Splash_Sceen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage())));
    super.initState();
  }


  @override
  Widget build(BuildContext context) { return MaterialApp(

    debugShowCheckedModeBanner: false,
    home: Scaffold(

      body: Container(
        width: double.infinity,
        height: double.infinity,
        color:  AppColors.splash_color,

        child: Center(
          child: Stack(

            children: [


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("images/icons/ic_logo.png", color: Colors.white,),
                  SizedBox(width: 10,),
                  Text("Grocery",
                    style: TextStyle(
                      fontSize: 44.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,


                    ),),

                ],


              )


            ],


          ),
        ),


      ),


    ),


  );
  }
}

