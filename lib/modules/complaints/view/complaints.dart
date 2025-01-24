import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/complaints.dart';
import 'package:graduationproject/modules/complaints/controller/complaints_controller.dart';

class ComplaintspageView extends GetResponsiveView<ComplaintsController> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Material(
                  child: InkWell(
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
                ),
                Text(
                  "com".tr,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Pacifico",
                      color: Color.fromARGB(255, 42, 42, 114),
                      decoration: TextDecoration.none),
                ),
                const SizedBox(
                  width: 190,
                ),
                // Container(
                //   height: 80,
                // child: Image.asset('assets/images/c2.png'),
                // ),
                SizedBox(
                  height: 80,
                  width: 100,
                  child: Image.asset('assets/images/c1.png'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Text(
                  "hereall".tr,
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Pacifico",
                      color: Color.fromARGB(255, 141, 140, 140),
                      decoration: TextDecoration.none),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(() => Column(
                  children: controller.ListComplaintsAdmain.map(
                      (element) => CardComplaints(element)).toList(),
                )),

            // CardComplaints('Maya Ahmad', 'I Want To By Admain for group IT',
            //     context, 'assets/images/2.png'),
            // CardComplaints(
            //     'Hadel Dabase',
            //     'I Will Publish Post in Group Math I wamt to apply',
            //     context,
            //     'assets/images/team.png'),
            // CardComplaints(
            //     'Haya Yosofi',
            //     'I want to by Admain for publish question and testing',
            //     context,
            //     'assets/images/11.png'),
            // CardComplaints(
            //     'Asia Badnjki',
            //     'I dont love Your App And I hope to improved it',
            //     context,
            //     'assets/images/12.png'),
          ],
        ),
      ),
    );
  }

  Widget CardComplaints(Complaint c) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22.0),
            side: BorderSide(color: Colors.grey)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                c.user!.Name ?? '',
                style: const TextStyle(
                  fontFamily: "Pacifico",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 246, 123, 127),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Text(
                    c.complaint ?? '',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                c.type == 0
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 250,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Tooltip(
                                message: 'NotAccept'.tr,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    c.type = 1;
                                    await controller.UpdateComplaint(c);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey,
                                    shape: const CircleBorder(),
                                  ),
                                  child: const Icon(
                                    Icons.close,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Tooltip(
                                message: 'Accept'.tr,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    c.type = 2;
                                    await controller.UpdateComplaint(c);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey,
                                    shape: const CircleBorder(),
                                  ),
                                  child: const Icon(
                                    Icons.check,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Text(
                        c.type == 1 ? 'NotAccept'.tr : 'Accept'.tr,
                        style: TextStyle(
                            color: c.type == 1
                                ? const Color.fromARGB(255, 238, 106, 97)
                                : Colors.green),
                      )
              ],
            )
            //   Icon(Icons.abc, color: Color.fromARGB(255, 246, 123, 127)),
          ]),
        ),
      ),
    );
  }
}
