import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/model/complaints.dart';
import '../controller/complaints_controller.dart';

class UserComplaintspageView extends GetResponsiveView<ComplaintsController> {
  @override
  ComplaintsController controller = Get.put(ComplaintsController());
  final myController = TextEditingController();
  final _formfield = GlobalKey<FormState>();

  UserComplaintspageView({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formfield,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 450,
                child: Material(
                  child: TextFormField(
                    controller: myController,
                    decoration: InputDecoration(
                      labelText: ' EnterYourComplaints'.tr,
                      labelStyle: const TextStyle(
                          color: Colors.black45, fontWeight: FontWeight.bold),
                      hintText: 'EnterYourComplaints'.tr,
                      prefixIcon: const Icon(
                        Icons.read_more_sharp,
                        color: Color.fromARGB(255, 245, 146, 149),
                      ),
                    ),
                    keyboardType: TextInputType.multiline,
                    minLines: 1, //Normal textInputField will be displayed
                    maxLines: 5, // when user presses enter it will adapt to it
                    onChanged: (value) {
                      controller.newComplaint.value.complaint = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                        return "x".tr;
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  //////////////add Complaints from user
                  onPressed: () {
                    if (_formfield.currentState!.validate()) {
                      controller.newComplaint.value.IdUser =
                          controller.user.value.Id;
                      controller.newComplaint.value.type = 0;
                      controller.addComplaint();
                      myController.clear();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 0)),
                  child: Text(
                    'Send'.tr,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  "PrevouisComplaints".tr,
                  style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Pacifico",
                      color: Color.fromARGB(255, 42, 42, 114),
                      decoration: TextDecoration.none),
                ),
                Obx(() => Column(
                    children: controller.listUser
                        .map((e) => complaintscard(e))
                        .toList()
                    // complaintscard(
                    //     Complaint(complaint: 'too', user: User(Name: 'lama'))),
                    // complaintscard('I want to Be Admain For Post ', 'assets/images/4.png',context,'R')
                    //   ],
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget complaintscard(Complaint c) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          //  width: Get.width / 0.1,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.3,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0)),
          child: Column(children: [
            Row(
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: SizedBox(
                //     width: 40,
                //     height: 40,
                //     child: c.user!.Image == null
                //         ? Image.asset(
                //             'assets/images/angryimg.png',
                //             width: screen.width,
                //             fit: BoxFit.cover,
                //           )
                //         : Utility.imageFromBase64String(
                //             Utility.base64String(c.user!.Image!), 50, 50),
                //   ),
                // ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    c.user!.Name ?? '',
                    style: const TextStyle(
                      fontFamily: "Pacifico",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      color: Color.fromARGB(255, 246, 123, 127),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Text(
                    c.complaint ?? "",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 18,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                ],
              ),
            ),
            gettype(index: c.type ?? 5)
          ]),
        ),
      ),
    );
  }

  Widget gettype({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
        widget = Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Accepted'.tr,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
                color: Colors.green[400],
              ),
            ),
          ),
        );
        {}
        break;
      case 1:
        widget = Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Refuses'.tr,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
                color: Colors.red,
              ),
            ),
          ),
        );
        break;
      default:
        widget = Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              'NotPross'.tr,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
                color: Colors.grey,
              ),
            ),
          ),
        );
        {}

        break;
    }
    return widget;
  }
}
