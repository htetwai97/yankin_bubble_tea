import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/core_config/config_color.dart';

class EmployeeProfileView extends StatelessWidget {
  File? image;
  String? url;
  Function? pickImage;

  EmployeeProfileView({super.key, this.image, this.url, this.pickImage});

  @override
  Widget build(BuildContext context) {
    log('image : $url , $image');
    if (url != null && url != "") {
      return InkWell(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: BUTTON_COLOR, width: 1),
              ),
              child: Image.network(
                "http://yankinbubbletea.kwintechnologykw11.com/20200618_100334.jpg",
                fit: BoxFit.fill,
              ),
            ),
            Container(
              child: IconButton(
                icon: Icon(Icons.add),
                iconSize: 10,
                color: BUTTON_COLOR,
                onPressed: () {
                  pickImage!();
                  url = "";
                },
              ),
            )
          ],
        ),
      );
    } else {
      return InkWell(
        onTap: () {},
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: BUTTON_COLOR, width: 1),
              ),
              child: (image?.path != null && image?.path != "")
                  ? Image.file(image ?? File(""))
                  : const Icon(
                      Icons.add_circle_outline,
                      size: 100,
                      color: Color.fromRGBO(8, 106, 172, 0.1),
                    ),
            ),
            Container(
              child: IconButton(
                icon: Icon(Icons.add),
                iconSize: 10,
                color: BUTTON_COLOR,
                onPressed: () {
                  pickImage!();
                },
              ),
            )
          ],
        ),
      );
    }
  }
}
