import 'package:get/get.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Menu_game.dart';
import '../../timer/controller/timer_controller.dart';
import '../controller/word_controller.dart';
import 'form_word1.dart';

class Formword9PageView extends GetResponsiveView<SplashScreencontroller> {
  SplashScreencontroller controller=Get.put(SplashScreencontroller());
   List <String> stringword=['علوم','فيزياء','رياضيات','عربي','معارف العلوم','موسيقا','كيمياء','رسم','تمثيل'];
 List<String>emptylist=[];
 @override
  Widget build( BuildContext context) {
   return Scaffold(
     body: SingleChildScrollView(
       child: Container(
           height: 800,
                    width: MediaQuery.of(context).size.width ,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [Colors.yellow, Color.fromARGB(255, 240, 240, 131)],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        stops: [0.4, 0.7],
                        tileMode: TileMode.repeated,
                      ),
                    ),
                    child: Column(
                      children: [
                           InkWell(
                          onTap: () =>MenuGamePageView(),
                          child: Align(alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.arrow_back_ios,
                                           size: 20, 
                                         color: Colors.grey
                                          ),
                            ),
                          ),
                        ),
                         Row(
                          children: [
                             SizedBox(width: 100,),
                     Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container( 
                                   height: 35, width: 120,
                                  decoration:BoxDecoration(borderRadius: BorderRadius.circular(15),
                                   color:Color.fromARGB(255, 40, 131, 43),
                                             ) ,
                                 child: Row(children: [
                        Obx(() => Center(
                       child: Text('    '+controller.count9.value.toString(),
                       style: TextStyle(
                       color: Colors.white,  ),),  )),
                         Text(' : Correct', style: TextStyle(
                                   color: Colors.white))
                      ],),
                             ),
              ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container( 
                                   height: 35, width: 120,
                                  decoration:BoxDecoration(borderRadius: BorderRadius.circular(15),
                                   color:Color.fromARGB(255, 40, 131, 43),
                                             ) ,
                                 child: Row(children: [
                        Obx(() => Center(
                       child: Text('  ${controller.time.value}',
                       style: TextStyle(
                       color: Colors.white,  ),),  )),
                         Text(' : Timer', style: TextStyle(
                                   color:Colors.white))
                      ],),
                             ),
              ),
                          ],
                        ),
                        SizedBox(height: 10,),
                         Padding(
                   padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
                       child: Container(
                      width: 150,
     height: 150,
                         color: Colors.white,
                                child: 
                               Image.asset('assets/images/intro.png')
                             ),
                                ),
                            Obx(() => Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text(controller.AllWord.join(),
               style: TextStyle(color: Colors.white,fontSize: 20,
               fontWeight: FontWeight.bold),),
             )),
              Wrap(children:controller.letters.map((e) => Lettershape(e)).toList()
            ),
                Row(children: [
               Padding(
                  padding:const EdgeInsets.fromLTRB(8, 15, 8, 8),
                  child: Center(
                    child: Center(
                      child: ElevatedButton(  style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 40, 131, 43))),
                        onPressed: (){
                          if(controller.time.value.toString()!='00:01' ){
                             if(controller.count9.value!=8  ){
                                    if(stringword.contains(controller.AllWord.join())
                              &&!emptylist.contains(controller.AllWord.join())){
                                    emptylist.add(controller.AllWord.join());
                              
                               controller.count9.value+=1;
                                  correcting();
                                  print(        controller.count2.value);
                                     controller.AllWord.clear();
                                  ////اذا لم تكن الكلمه صحيحه والوقت لم ينتهي
                                   }else{
                                     Error('Error Word do You Want to Retry ?');
                                        controller.AllWord.clear();
                                   }
                             } else{
                              //الوثت لم بنتهي ولكن الكلمات جميعا صحيحه
                                controller.count9.value+=1;
                                 controller.score.value+=10;
                                 snak();
                                    controller.AllWord.clear();
                             }
                          }else{
                            //time off
                           TimeOff();
                              controller.AllWord.clear();
                          }
                        }, child: Text('Ok',
                      style:
                        TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white))),
                    ),
                  ),
                ),
                 Padding(
                  padding:const EdgeInsets.fromLTRB(8, 15, 8, 8),
                  child: Center(
                    child: ElevatedButton(  style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 40, 131, 43)),),
                      onPressed: (){
                    controller.AllWord.remove(controller.AllWord.value.last);
                      }, child: Icon(Icons.backspace_outlined,
                              size: 25, 
                          color: Colors.white
                  )
                      ),
                  ),
                )
            ],),
     
                      ],
                    ),
     
       ),
     ));
  }
  ////The function and dailoge
           Widget Lettershape( String letter){
    return  Padding(
                padding:const EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: ElevatedButton(  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 133, 220, 136)),),
                  onPressed: (){
                controller.AllWord.add(letter);
                  }, child: Text(letter,
                style:
                  TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white))),
              );
  }            
               Future  Error(String txt){
    return Get.dialog(Align( alignment: Alignment.bottomCenter,
      child: Container(
        width: 500,
        height: 50,
        color: Color.fromARGB(255, 241, 214, 179),
        child: Column(children: [
          Center( child:  Text(txt,style: TextStyle(fontSize: 20,decoration: TextDecoration.none,
                              color: Color.fromARGB(255, 40, 131, 43)),),
                           
                            ),
                        
           TextButton(onPressed: (){
                               Get.back();
                           }, child: Text('yes',
                         style: TextStyle(color:Color.fromARGB(255, 40, 131, 43))
                        )),
                               TextButton(onPressed: (){
                         Get.to(MenuGamePageView());
                           }, child: Text('No',
                         style: TextStyle(color:Color.fromARGB(255, 40, 131, 43))
                        )),
    
    
        ],),
      ),
    ));
  }          
           Future  correcting(){
    return Get.dialog(Align(alignment: Alignment.bottomCenter,
      child: Container(
         width: 500,
        height: 100,
        color: Color.fromARGB(255, 241, 214, 179),
        child: Center(child:
          Row(children: [
                              Text('Correct The Remainning is ',style: TextStyle(fontSize: 20,
                              decoration: TextDecoration.none,
                              color: Color.fromARGB(255, 40, 131, 43))),
                            Text((9- controller.count9.value).toString(),style: TextStyle(fontSize: 20,
                            decoration: TextDecoration.none,
                             color: Color.fromARGB(255, 40, 131, 43)),)
                            ],),
       ),
      ),
    ));
  }
     Future snak(){
    return Get.defaultDialog(
        title: "Result",
              backgroundColor: Colors.white,
              titleStyle: TextStyle(color: Color.fromARGB(255, 40, 131, 43)),
              middleTextStyle: TextStyle(color: Colors.black),
              barrierDismissible: false,
              radius: 50,
              content: Column(
                children: [
                 Text(controller.score.value.toString()
                 ,style:
                  TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                   Text('Congratulations, You Win This Test with  score'+controller.score.value.toString(),style: TextStyle(fontSize: 16,color: Color.fromARGB(255, 17, 77, 125),),),
                 
                      Row(children: [
                         SizedBox(width: 40,),
                           TextButton(onPressed: (){
                            Get.to(MenuGamePageView());
                           }, child: Text('yes',
                         style: TextStyle(color:Color.fromARGB(255, 40, 131, 43))
                        )), TextButton(onPressed: (){
                          Get.to(MenuGamePageView());
                          
                           }, child: Text('No',
                         style: TextStyle(color:Color.fromARGB(255, 40, 131, 43))
                        )),
                       ],)
                  ]));
                 
  }
Future  TimeOff(){
    return Get.dialog(Align(alignment: Alignment.center,
      child: Container(
         width: 500,
        height: 100,
        color: Colors.white,
        child: Column(children: [
            Text('Time Off Do You Want To Retry ? ',style: TextStyle(fontSize: 20,
            decoration: TextDecoration.none,
                              color: Color.fromARGB(255, 17, 77, 125),),),
          Row(children: [
                            
                      SizedBox(width: 40,),
                           TextButton(onPressed: (){
                                Get.back();
                        controller.onReady();
                           }, child: Text('yes',
                         style: TextStyle(color:Color.fromARGB(255, 40, 131, 43))
                        )), TextButton(onPressed: (){
                          Get.to(MenuGamePageView());
                      controller.onClose();
                           }, child: Text('No',
                         style: TextStyle(color:Color.fromARGB(255, 40, 131, 43))
                        )),        
                            ],),
        ],),
      ),
    ));
  }

}