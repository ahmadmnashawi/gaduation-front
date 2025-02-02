import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/group.dart';

import '../../../api/ui/util.dart';

// ignore: must_be_immutable
class GroupData extends GetView {
  late Group? group;
  GroupData(this.group);
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
                    base64StringPh: group!.Image,
                    link: group!.imageOnline,
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
                        group!.groupName ?? '',
                        // 'Mohammad Ahmmad',
                        style: const TextStyle(
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 42, 42, 114),
                          fontSize: 18,
                        ),
                      ),
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
                  Icons.description,
                  color: Color.fromARGB(255, 246, 123, 127),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  group!.Description ?? "",
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
      ],
    );
  }
}
