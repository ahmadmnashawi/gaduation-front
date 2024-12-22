
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../signin.dart/view/signin.dart';
import '../../signup/view/signup1.dart';



class Intro3 extends StatelessWidget { 
  @override
  Widget build(BuildContext Context) {
 return Center(
   child: Column(
     children: [
        //  Lottie.network(
        //         'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json',
        //         height: 200),
       Padding(
         padding: const EdgeInsets.fromLTRB(8, 90, 8, 8),
         child: Container(
          height: 300,
          color: Colors.white,
          child: 
            Image.asset('assets/images/8.png')
          
         ),
       ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey),
                    fixedSize:
                        MaterialStateProperty.all(const Size.fromWidth(300))),
                onPressed: () {
                  Get.to(SignInViewPage ());
                 },
                child: Text(
                  "Sign In".tr,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
         ),
     Padding(
           padding: const EdgeInsets.all(8.0),
           child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 42, 42, 114)),
                    fixedSize:
                        MaterialStateProperty.all(const Size.fromWidth(300),
                        )),
                onPressed: () {
                //  Get.to(signupage ());
                 },
                child: Text(
                  "Sign Up".tr,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
         ),
     ],
   ),
 );

  }}