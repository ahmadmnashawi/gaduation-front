import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class Utility {
  static Image imageFromBase64String(
      String base64String, double? width, double? hight) {
    return width == null && hight == null
        ? Image.memory(
            base64Decode(base64String),
            fit: BoxFit.fill,
          )
        : Image.memory(
            base64Decode(base64String),
            width: width,
            height: hight,
            fit: BoxFit.fill,
          );
  }

  static Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  static String base64String(Uint8List data) {
    return base64Encode(data);
  }

  static Widget getImage(
      {Uint8List? base64StringPh,
      String? link,
      double? width,
      double? hight,
      bool isStratch = true}) {
    if (base64StringPh != null) {
      var image = base64String(base64StringPh);
      return ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: imageFromBase64String(image, width, hight));
    } else if (link != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.network(
          link.trimLeft(),
          fit: isStratch ? BoxFit.cover : BoxFit.contain,
          width: width,
          height: hight,
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.asset(
          'assets/images/no_image.jpeg',
          fit: BoxFit.cover,
          width: width ?? 40,
          height: hight ?? 40,
        ),
      );
    }
  }
}
