import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../menu/view/HomePage.dart';
import '../../../../Menu_game.dart';
import '../../timer/controller/timer_controller.dart';
import '../controller/word_controller.dart';
import 'form_word3.dart';

class Formword2PageView extends GetResponsiveView<SplashScreencontroller> {
  SplashScreencontroller controller = Get.put(SplashScreencontroller());
  List<String> stringword = ["شعلة", "ضوء", 'فكرة'];
  List<String> emptylist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 24, 167, 89),
              Color.fromARGB(255, 109, 180, 141)
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            stops: [0.4, 0.7],
            tileMode: TileMode.repeated,
          ),
              ),
              child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Get.to(HomePage());
                },
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        Icon(Icons.arrow_back_ios, size: 20, color: Colors.grey),
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 90,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 35,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.yellow,
                      ),
                      child: Row(
                        children: [
                          Obx(() => Center(
                                child: Text(
                                  '    ' + controller.count2.value.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                          Text(' : Correct',
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 35,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.yellow,
                      ),
                      child: Row(
                        children: [
                          Obx(() => Center(
                                child: Text(
                                  '  ${controller.time.value}',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                          Text(' : Timer', style: TextStyle(color: Colors.white))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
                  Text('Gusses The Word Accouring To Photo',
              style: TextStyle(color: Colors.black,fontSize: 20,
              fontWeight: FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 10, 8, 8),
                child: Container(
                    color: Colors.white,
                    child: Image.asset('assets/images/hidd.png')),
              ),
              Obx(() => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      controller.AllWord.join(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              Wrap(
                  children:
                      controller.letters.map((e) => Lettershape(e)).toList()),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
                    child: Center(
                      child: Center(
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.yellow),
                            ),
                            onPressed: () {
                              if (controller.time.value.toString() !=
                                  '00:01') {
                                if (controller.count2.value != 2) {
                                  if (stringword
                                          .contains(controller.AllWord.join()) &&
                                      !emptylist
                                          .contains(controller.AllWord.join())) {
                                    emptylist.add(controller.AllWord.join());
                                    controller.count2.value += 1;
                                  
                                    correcting();
                                    print(controller.count2.value);
                                    controller.AllWord.clear();
                                    ////اذا لم تكن الكلمه صحيحه والوقت لم ينتهي
                                  } else {
                                      // Get.to(Formword3PageView());
                                    Error('Error Word Try Again Please');
                                    controller.AllWord.clear();
                                  }
                                } else {
                                  //الوثت لم بنتهي ولكن الكلمات جميعا صحيحه
                                  controller.count2.value += 1;
                                  controller.score.value+=10;
                                  snak();
                                  controller.AllWord.clear();
                                }
                              } else {
                                //time off
                                TimeOff();
                                controller.AllWord.clear();
                              }
                            },
                            child: Text('Ok',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
                    child: Center(
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.yellow),
                          ),
                          onPressed: () {
                            controller.AllWord.remove(
                                controller.AllWord.value.last);
                          },
                          child: Icon(Icons.backspace_outlined,
                              size: 25, color: Colors.white)),
                    ),
                  )
                ],
              ),
            ],
          ),
              ),
            ),
        ));
  }

  Widget Lettershape(String letter) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Color.fromARGB(255, 241, 228, 106)),
          ),
          onPressed: () {
            controller.AllWord.add(letter);
          },
          child: Text(letter,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white))),
    );
  }

  Future Error(String txt) {
    return Get.dialog(Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 500,
        height: 60,
        color: Colors.white,
        child: Column(
          children: [
            Center(
              child: Text(
                txt,
                style: TextStyle(
                    fontSize: 20,
                    decoration: TextDecoration.none,
                    color: Color.fromARGB(255, 241, 228, 106)),
              ),
            ),
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('yes', style: TextStyle(color: Colors.yellow))),
                        TextButton(onPressed: (){
                         Get.to(MenuGamePageView());
                           }, child: Text('No',
                         style: TextStyle(color:Colors.yellow)
                        ))
          ],
        ),
      ),
    ));
  }

  Future correcting() {
    return Get.dialog(Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 500,
        height: 40,
        color: Colors.white,
        child: Center(
          child: Row(
            children: [
              Text('Correct The Remainning is ',
                  style: TextStyle(
                      fontSize: 20,
                      decoration: TextDecoration.none,
                      color: Color.fromARGB(255, 241, 228, 106))),
              Text(
                (3 - controller.count2.value).toString(),
                style: TextStyle(
                  decoration: TextDecoration.none,
                    fontSize: 20, color: Color.fromARGB(255, 241, 228, 106)),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Future snak() {
    return Get.defaultDialog(
        title: "Result",
        backgroundColor: Colors.white,
        titleStyle: TextStyle(color: Colors.yellow),
        middleTextStyle: TextStyle(color: Color.fromARGB(255, 241, 228, 106)),
        barrierDismissible: false,
        radius: 50,
        content: Column(children: [
          Text(
            controller.score.value.toString() ,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            'Congratulations, You Win This Level',
            style: TextStyle(
                fontSize: 16, color: Color.fromARGB(255, 241, 228, 106)),
          ),
          Text(
            'Do You Want To Go To Next Level',
            style: TextStyle(
                fontSize: 16, color: Color.fromARGB(255, 241, 228, 106)),
          ),
          Row(
            children: [
              SizedBox(
                width: 40,
              ),
              TextButton(
                  onPressed: () {
                    Get.to(Formword3PageView());
                  },
                  child: Text('yes', style: TextStyle(color: Colors.yellow))),
              TextButton(
                  onPressed: () {
                    Get.to(MenuGamePageView());
                  },
                  child: Text('No', style: TextStyle(color: Colors.yellow))),
            ],
          )
        ]));
  }

  Future TimeOff() {
    return Get.dialog(Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 500,
        height: 100,
        color: Colors.white,
        child: Column(
          children: [
            Text(
              'Time Off Do You Want To contuine ? ',
              style: TextStyle(
                  fontSize: 20,
                  decoration: TextDecoration.none,
                  color: Color.fromARGB(255, 241, 228, 106)),
            ),
            Row(
              children: [
                SizedBox(
                  width: 40,
                ),
                TextButton(
                    onPressed: () {
                           Get.back();
                    // Get.to(Formword3PageView());
                    controller.onReady();
                    },
                    child: Text('yes', style: TextStyle(color: Colors.yellow))),
                TextButton(
                    onPressed: () {
                      Get.to(MenuGamePageView());
                      controller.onClose();
                    },
                    child: Text('No', style: TextStyle(color: Colors.yellow))),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
