import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/serach_controller.dart';

class SearchPage extends GetResponsiveView<SearchPageContrller> {
  SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Row(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(85, 8, 8, 8),
          child: Center(
            child: Text('Search'.tr,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    color: Colors.blueGrey,
                    fontFamily: "Pacifico")),
          ),
        )
      ]),
      Container(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: 450,
                child: TextFormField(
                    onChanged: (value) async =>
                        await controller.searchBy(value),
                    decoration: InputDecoration(
                        labelText: 'Search'.tr,
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 184, 183, 183),
                            fontWeight: FontWeight.bold),
                        hintText: 'Search'.tr,
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 245, 146, 149),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3,
                              color: Color.fromARGB(255, 245, 146, 149)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3,
                              color: Color.fromARGB(255, 245, 146, 149)),
                          borderRadius: BorderRadius.circular(15),
                        )))),
          ),
          Obx(() => SizedBox(
                height: 100,
                child: Wrap(
                  children: controller.typeSearch
                      .map((element) => InkWell(
                            onTap: () {
                              controller.selectType.value = element;
                            },
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(element,
                                    style: TextStyle(
                                        color: controller.selectType.value ==
                                                element
                                            ? Colors.pinkAccent
                                            : Colors.black87)),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              )),
          Obx(() => Column(
                children: controller.listSearch.map((element) {
                  controller.getData(element.id!, element.type!);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(element.name ?? '', softWrap: true),
                                Text(element.type ?? '', softWrap: true)
                              ],
                            ),
                            Text(element.title ?? '', softWrap: true),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextButton(
                                  onPressed: () async {
                                    if (element.type == 'user') {
                                      controller.isFolllow.value
                                          ? await controller
                                              .deleteUserFollow(element.id!)
                                          : await controller
                                              .addUserFollow(element.id!);
                                    } else if (element.type == 'group') {
                                      controller.isFolllowGroup.value
                                          ? await controller
                                              .deleteUserGroup(element.id!)
                                          : await controller
                                              .addUserGroup(element.id!);
                                    }
                                  },
                                  child: Text(
                                    element.type == 'user'
                                        ? controller.isFolllow.value
                                            ? 'UnFollow'
                                            : 'Follow'
                                        : element.type == 'group'
                                            ? controller.isFolllowGroup.value
                                                ? 'UnFollow'
                                                : 'Follow'
                                            : '',
                                    style: const TextStyle(
                                        color: Colors.pinkAccent),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ))
        ]),
      ),
    ]));
  }
}
