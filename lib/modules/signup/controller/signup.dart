import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/user.dart';
import 'package:graduationproject/modules/sheard/auth_service.dart';
import 'package:graduationproject/routes/app_pages.dart';
import 'package:image_picker/image_picker.dart';

import '../../genereted/sheard/util.dart';
import '../data/signup_repository.dart';

class SignUpController extends GetxController {
  var passtoggle = true.obs;
  RxBool hidePassword = true.obs;
  final stringPickImage = ''.obs;
  var selectedDate = DateTime.now().obs;
  final userRpo = SingUpRepository();
  final auth = Get.find<AuthService>();

  final user = User().obs;
  final text = 'singuphelp'.tr;

  final ImagePicker imagepicker = ImagePicker();
  PickedFile? imagefile;

  Future takePhoto(ImageSource source) async {
    final PiickedFile = await imagepicker.getImage(source: source);
    imagefile = PiickedFile;
  }

  Future pickImageFun() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      stringPickImage.value = Utility.base64String(await image.readAsBytes());
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<void> signUpUser() async {
    user.value.Phone = "56774765476";
    user.value.Image = Utility.dataFromBase64String(stringPickImage.value);
    await auth.signUp(user.value);
    Get.rootDelegate.toNamed(Routes.home);
  }

  Future<void> chooseDate(BuildContext context) async {
    await showDatePicker(
            context: context,
            initialDate: selectedDate.value,
            firstDate: DateTime(1950),
            lastDate: DateTime(2026),
            helpText: 'select DOB',
            cancelText: 'close',
            confirmText: 'confirm',
            errorFormatText: 'Enter valid date',
            errorInvalidText: 'Enter valid date range ',
            fieldLabelText: 'DOB',
            fieldHintText: 'Month/Date/Year')
        .then((PickedDate) {
      if (PickedDate != null) {
        selectedDate.value = PickedDate;
        print(selectedDate.value);
      }
    });
  }

  bool disableDate(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(const Duration(days: 1))) &&
        day.isBefore(DateTime.now().add(const Duration(days: 5))))) {
      return true;
    }
    return false;
  }
}
