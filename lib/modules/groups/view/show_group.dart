import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/groups/controller/group_controller.dart';
import 'package:graduationproject/modules/groups/view/group.dart';

import '../../../api/ui/util.dart';
import '../../../app/model/group.dart';
import 'add_group.dart';

class ShowGroupPageView extends GetResponsiveWidget<GroupController> {
  ShowGroupPageView({super.key});
  @override
  Widget builder() {
    return SizedBox(
      height: screen.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.arrow_back_ios,
                          size: 20, color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Text(
                  "al".tr,
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Pacifico",
                      color: Color.fromARGB(255, 42, 42, 114),
                      decoration: TextDecoration.none),
                ),
                IconButton(
                    hoverColor: const Color.fromARGB(255, 42, 42, 114),
                    color: const Color.fromARGB(255, 245, 146, 149),
                    onPressed: controller.auth.isAdmin() ||
                            controller.user.value.Id == 2
                        ? () async {
                            await controller.getAllContent();
                            controller.addnewGroup.value = Group();
                            Get.to(AddGroup());
                          }
                        : () {
                            Get.showSnackbar(const GetSnackBar(
                              duration: Duration(seconds: 2),
                              title: 'Access',
                              message: 'You Dont Have Permission',
                            ));
                          },
                    icon: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.add,
                        size: 30,
                      ),
                    ))
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Obx(() => SingleChildScrollView(
                  child: Column(
                    children:
                        controller.allGroups.map((e) => cardGroup(e)).toList(),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget cardGroup(Group g) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          onTap: () async {
            await controller.getGroup(g.Id!);
            await controller.getPosts();
            await controller.existingMember();
            Get.to(GroupView());
          },
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              g.groupName ?? '',
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
          ),
          leading: Utility.getImage(
              base64StringPh: g.Image,
              link: g.imageOnline,
              width: 50,
              hight: 50),
        ));
  }
}
