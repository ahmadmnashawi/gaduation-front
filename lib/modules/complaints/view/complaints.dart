import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/complaints.dart';
import 'package:graduationproject/modules/complaints/controller/complaints_controller.dart';

class ComplaintspageView extends GetResponsiveView<ComplaintsController> {
  ComplaintsController controller=Get.put(ComplaintsController());
  Uint8List? image;

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
                Tooltip(
                  message: 'hl'.tr,
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
                                      border:
                                          Border.all(color: Colors.blueAccent)),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                         Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Align(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  "el".tr,
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "Pacifico",
                                                      color: Color.fromARGB(
                                                          255, 42, 42, 114),
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 8, 10, 10),
                                          child: Column(
                                            children: <Widget>[
                                              Text(
                                                controller.text,
                                                textAlign: TextAlign.left,
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    decoration:
                                                        TextDecoration.none,
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
                )
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
        child: Row(
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: SizedBox(
            //     width: 40,
            //     height: 40,
            //     child: url == null
            //         ? Image.asset(
            //             'assets/images/angryimg.png',
            //             width: screen.width,
            //             fit: BoxFit.cover,
            //           )
            //         : Utility.imageFromBase64String(
            //             Utility.base64String(url), 50, 50),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: GFImageOverlay(
            //     height: 40,
            //     width: 40,
            //     shape: BoxShape.circle,
            //     image: AssetImage(
            //       url),
            //     boxFit: BoxFit.cover,
            //   ),
            // ),
            Container(
              // height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.3,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22.0)),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0)),
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
                    padding: const EdgeInsets.all(16.0),
                    width: 300,
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
                  Padding(
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
                                controller.UpdateComplaint(c);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: c.type == 1
                                    ? const Color.fromARGB(255, 238, 106, 97)
                                    : Colors.grey,
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
                                c.type = 0;
                                controller.UpdateComplaint(c);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    c.type == 0 ? Colors.green : Colors.grey,
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
                  //   Icon(Icons.abc, color: Color.fromARGB(255, 246, 123, 127)),
                ]),
              ),
            ),
          ],
        ));
  }
}
