import 'package:get/get.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Menu_game.dart';
import '../../timer/controller/timer_controller.dart';
import '../controller/word_controller.dart';
import 'form4.dart';

class Formword3PageView extends GetResponsiveView<SplashScreencontroller> {
  SplashScreencontroller controller=Get.put(SplashScreencontroller());
   List <String> stringword=['شخص',"كروب","فكرة","اعضاء"];
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
                        colors: [Color.fromARGB(255, 125, 213, 128), Color.fromARGB(255, 134, 207, 241)],
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
                                   color:Colors.lightGreenAccent,
                                             ) ,
                                 child: Row(children: [
                        Obx(() => Center(
                       child: Text('    '+controller.count3.value.toString(),
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
                                   color:Colors.lightGreenAccent,
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
                            Text('Gusses The Word Accouring To Photo',
              style: TextStyle(color: Colors.black,fontSize: 20,
              fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                         Padding(
                   padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
                       child: Container(width: 100,height: 70,
                         color: Colors.white,
                                child: 
                               Image.asset('assets/images/group1.png')
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
                          backgroundColor: MaterialStateProperty.all(Colors.lightGreenAccent)),
                        onPressed: (){
                          if(controller.time.value.toString()!='00:01' ){
                             if(controller.count3.value!=3  ){
                                    if(stringword.contains(controller.AllWord.join())
                              &&!emptylist.contains(controller.AllWord.join())){
                                    emptylist.add(controller.AllWord.join());
                              
                               controller.count3.value+=1;
                                  correcting();
                                  print(        controller.count2.value);
                                     controller.AllWord.clear();
                                  ////اذا لم تكن الكلمه صحيحه والوقت لم ينتهي
                                   }else{
                                     Get.to(Formword4PageView());
                                      // Error('Error Word with score  '+controller.score.value.toString());
                                        controller.AllWord.clear();
                                   }
                             } else{
                              //الوثت لم بنتهي ولكن الكلمات جميعا صحيحه
                                controller.count3.value+=1;
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
                        backgroundColor: MaterialStateProperty.all(Colors.lightGreenAccent),),
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
                    backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent),),
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
        color: Colors.white,
        child: Column(children: [
          Center( child:  Text(txt,style: TextStyle(fontSize: 20,decoration: TextDecoration.none,
                              color: Color.fromARGB(255, 81, 112, 216)),),
                           
                            ),
                              TextButton(
                onPressed: () {
                 Get.back();
                },
                child: Text('yes', style: TextStyle(color: Color.fromARGB(255, 81, 112, 216)))),
                        TextButton(onPressed: (){
                         Get.to(MenuGamePageView());
                           }, child: Text('No',
                         style: TextStyle(color:Color.fromARGB(255, 81, 112, 216))
                        ))
    
    
        ],),
      ),
    ));
  }          
           Future  correcting(){
    return Get.dialog(Align(alignment: Alignment.bottomCenter,
      child: Container(
         width: 500,
        height: 50,
        color: Colors.white,
        child: Center(child:
          Row(children: [
                              Text('Correct The Remainning is ',style: TextStyle(fontSize: 20,
                              decoration: TextDecoration.none,
                              color: Colors.lightBlueAccent)),
                            Text((4- controller.count3.value).toString(),style: TextStyle(fontSize: 20,
                            decoration: TextDecoration.none,
                             color: Colors.lightBlueAccent),)
                            ],),
       ),
      ),
    ));
  }
     Future snak(){
    return Get.defaultDialog(
        title: "Result",
              backgroundColor: Colors.white,
              titleStyle: TextStyle(color: Colors.lightGreenAccent),
              middleTextStyle: TextStyle(color: Colors.black),
              barrierDismissible: false,
              radius: 50,
              content: Column(
                children: [
                 Text(controller.score.value.toString()
                 ,style:
                  TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                   Text('Congratulations, You Win This Test with scre?'+controller.score.value.toString(),style: TextStyle(fontSize: 16,color: Colors.lightBlueAccent),),
                  // Text('Do You Want To Go To Next Level',style: TextStyle(fontSize: 16,color: Colors.lightBlueAccent),),
                      Row(children: [
                         SizedBox(width: 40,),
                           TextButton(onPressed: (){
                            Get.to(MenuGamePageView());
                           }, child: Text('yes',
                         style: TextStyle(color:Colors.lightGreenAccent)
                        )), TextButton(onPressed: (){
                          Get.to(MenuGamePageView());
                          
                           }, child: Text('No',
                         style: TextStyle(color:Colors.lightGreenAccent)
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
            Text('Time Off Do You Want to Retry  ',style: TextStyle(fontSize: 20,
            decoration: TextDecoration.none,
                              color: Colors.lightGreenAccent),),
          Row(children: [
                            
                      SizedBox(width: 40,),
                           TextButton(onPressed: (){
                                 Get.back();
                              // Get.to(MenuGamePageView());
                         controller.onReady();
                           }, child: Text('yes',
                         style: TextStyle(color:Colors.lightBlueAccent)
                        )), TextButton(onPressed: (){
                          Get.to(MenuGamePageView());
                      controller.onClose();
                           }, child: Text('No',
                         style: TextStyle(color:Colors.lightBlueAccent)
                        )),        
                            ],),
        ],),
      ),
    ));
  }

}