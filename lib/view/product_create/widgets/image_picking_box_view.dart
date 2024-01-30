// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';

class ImagePickingBoxView extends StatelessWidget {
  Function onTapImagePicker;
  File? file;
  String? url;
  ImagePickingBoxView({
    super.key,
    required this.onTapImagePicker,
    this.file,
    this.url,
  });

  @override
  Widget build(BuildContext context) {
    if (url != null && url != "") {
      String photoUrl = url!;
      return InkWell(
        onTap: () {
          onTapImagePicker();
        },
        child: Container(
          width: scaleWidth(context) / 6,
          height: scaleWidth(context) / 6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: BUTTON_COLOR, width: 1),
          ),
          child: Image.network(
            photoUrl,
            fit: BoxFit.fill,
          ),
        ),
      );
    } else {
      return InkWell(
        onTap: () {
          onTapImagePicker();
        },
        child: Container(
          width: scaleWidth(context) / 6,
          height: scaleWidth(context) / 6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: BUTTON_COLOR, width: 1),
          ),
          child: (file?.path != null && file?.path != "")
              ? Image.file(file ?? File(""))
              : const Icon(
                  Icons.add_circle_outline,
                  size: 100,
                  color: Color.fromRGBO(8, 106, 172, 0.1),
                ),
        ),
      );
    }
  }
}
