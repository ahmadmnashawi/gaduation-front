import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../controller/serach_controller.dart';
import 'group_data.dart';
import 'user_data.dart';

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
                    onChanged: (value) async {
                      controller.searchValue.value = value;
                      await controller.searchBy(value);
                    },
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
                            onTap: () async {
                              controller.selectType.value = element;
                              await controller
                                  .searchBy(controller.searchValue.value);
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
          Obx(() => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: controller.listSearch
                      .skipWhile((t) => t.id == controller.idUser)
                      .map((element) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GFAccordion(
                            collapsedTitleBackgroundColor: Colors.transparent,
                            title: element.name ?? 'Data',
                            contentChild: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      element.type ?? '',
                                      softWrap: true,
                                      style: const TextStyle(
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 42, 42, 114),
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(),
                                  ],
                                ),
                                element.type == 'user'
                                    ? UserData(element.user)
                                    : element.type == 'group'
                                        ? GroupData(element.group)
                                        : Text(element.title ?? '',
                                            softWrap: true),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextButton(
                                      onPressed: element.isFollowed == null
                                          ? null
                                          : () async {
                                              if (element.type == 'user') {
                                                element.isFollowed!
                                                    ? await controller
                                                        .deleteUserFollow(
                                                            element.id!)
                                                    : await controller
                                                        .addUserFollow(
                                                            element.id!);
                                              } else if (element.type ==
                                                  'group') {
                                                element.isFollowed!
                                                    ? await controller
                                                        .deleteUserGroup(
                                                            element.id!)
                                                    : await controller
                                                        .addUserGroup(
                                                            element.id!);
                                              } else if (element.type ==
                                                  'refreance') {}
                                            },
                                      child: Text(
                                        element.isFollowed == null
                                            ? 'No Type Follow Here'
                                            : !element.isFollowed!
                                                ? 'UnFollow'
                                                : 'Follow',
                                        style: TextStyle(
                                            decoration: TextDecoration.none,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: element.isFollowed == null
                                                ? Colors.grey
                                                : !element.isFollowed!
                                                    ? Colors.pinkAccent
                                                    : Colors.green),
                                      )),
                                )
                              ],
                            ),
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
