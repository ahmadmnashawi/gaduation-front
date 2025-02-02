import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api/ui/util.dart';
import '../../../app/model/user.dart';

// ignore: must_be_immutable
class UserData extends GetView {
  late User? user;
  UserData(this.user);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Utility.getImage(
                    base64StringPh: user!.Image,
                    width: 100,
                    hight: 100,
                  )),
            ),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        user!.Name ?? '',
                        // 'Mohammad Ahmmad',
                        style: const TextStyle(
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 42, 42, 114),
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          user!.UserName ?? '',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 42, 42, 114),
                            fontSize: 14,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox()
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(4),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.email,
                  color: Color.fromARGB(255, 246, 123, 127),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  user!.Email ?? "",
                  //'MohmmadAhmad@gmail.com',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 42, 42, 114),
                      fontSize: 16,
                      decoration: TextDecoration.none),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.cast_for_education,
                  color: Color.fromARGB(255, 246, 123, 127),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Text(
                  user!.Study ?? "",
                  //  'Information Tecnology',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 42, 42, 114),
                      fontSize: 16,
                      decoration: TextDecoration.none),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
