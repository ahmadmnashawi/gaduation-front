import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HelpPage extends StatelessWidget {
  HelpPage({super.key, this.title});

  String? title;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Tooltip(
        message: 'Help About Page',
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
                onPressed: () {
                  Get.dialog(Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.blueAccent)),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Help",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Pacifico",
                                            color: Color.fromARGB(
                                                255, 42, 42, 114),
                                            decoration: TextDecoration.none),
                                      ),
                                    )),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 8, 10, 10),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      title ?? '',
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ));
                },
                icon: const Icon(
                  Icons.help_outline_outlined,
                  size: 30,
                  color: Color.fromARGB(255, 246, 123, 127),
                )),
          ),
        ),
      ),
    );
  }
}
