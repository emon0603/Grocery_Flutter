import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Container(

          child: Column(

            children: [

              Stack(

                children: [

                  Center(child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Image.asset("images/icons/ic_logo.png", width: 70.w, height: 70.h,),
                  )),
                  
                  
                  
                  Expanded(child: Text("Loging"))




                ],





              )



            ],



          ),




        ),
      ),


    );
  }
}
