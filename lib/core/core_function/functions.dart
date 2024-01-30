import 'package:flutter/material.dart';
import 'package:multipurpose_pos_application/core/core_config/config_color.dart';
import 'package:multipurpose_pos_application/core/core_config/config_dimens.dart';
import 'package:multipurpose_pos_application/core/core_config/config_style.dart';
import 'package:page_transition/page_transition.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Functions {
  static void transition(context, Widget screen, [Duration? duration]) {
    Future.delayed(duration ?? const Duration(milliseconds: 0), () async {
      await Navigator.push(context,
          PageTransition(child: screen, type: PageTransitionType.fade));
    });
  }

  static void bottomTopUp(context, Widget screen, [Duration? duration]) {
    Future.delayed(duration ?? const Duration(milliseconds: 0), () async {
      await Navigator.push(context,
          PageTransition(child: screen, type: PageTransitionType.bottomToTop));
    });
  }

  static void rightToLeftTransition(context, Widget screen,
      [Duration? duration]) {
    Future.delayed(duration ?? const Duration(milliseconds: 0), () async {
      await Navigator.push(context,
          PageTransition(child: screen, type: PageTransitionType.rightToLeft));
    });
  }

  static void replace(context, Widget screen, [Duration? duration]) {
    Future.delayed(duration ?? const Duration(milliseconds: 0), () async {
      Navigator.removeRoute(context,
          PageTransition(child: screen, type: PageTransitionType.fade));
    });
  }

  static void replacementTransition(context, Widget screen,
      [Duration? duration]) {
    Future.delayed(duration ?? const Duration(milliseconds: 0), () async {
      await Navigator.pushReplacement(
        context,
        PageTransition(child: screen, type: PageTransitionType.fade),
      );
    });
  }

  static void showSuccessDialog(BuildContext context, double height,
      Function onTap, String title, String content) async {
    await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: WHITE_COLOR,
          title: Text(
            title,
            style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_HEAVY),
          ),
          content: Text(
            content,
            style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_HEAVY),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                onTap();
              },
              child: Text(
                "OK",
                style: ConfigStyle.regularStyle(FONT_LARGE, CARD_FIRST_COLOR),
              ),
            ),
          ],
        );
      },
    );
  }

  static void editDialog(
      BuildContext context,
      double height,
      Function onTapFirst,
      Function onTapSecond,
      String title,
      String content,
      String firstButtonName,
      String secondButtonName) async {
    await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: WHITE_COLOR,
          title: Text(
            title,
            style: ConfigStyle.regularStyle(FONT_MEDIUM + 4, BLACK_HEAVY),
          ),
          content: Text(
            content,
            style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_HEAVY),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                onTapFirst();
              },
              child: Text(
                firstButtonName,
                style:
                    ConfigStyle.regularStyle(FONT_LARGE - 4, CARD_FIRST_COLOR),
              ),
            ),
            TextButton(
              onPressed: () {
                onTapSecond();
              },
              child: Text(
                secondButtonName,
                style:
                    ConfigStyle.regularStyle(FONT_LARGE - 4, CARD_FIRST_COLOR),
              ),
            ),
          ],
        );
      },
    );
  }

  static void editAndDeleteDialog(
    BuildContext context,
    double height,
    Function onTapFirst,
    Function onTapSecond,
    Function onTapThird,
    String title,
    String content,
    String firstButtonName,
    String secondButtonName,
    String thirdButtonName,
  ) async {
    await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: WHITE_COLOR,
          title: Text(
            title,
            style: ConfigStyle.regularStyle(FONT_MEDIUM + 4, BLACK_HEAVY),
          ),
          content: Text(
            content,
            style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_HEAVY),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                onTapFirst();
              },
              child: Text(
                firstButtonName,
                style:
                    ConfigStyle.regularStyle(FONT_LARGE - 4, CARD_FIRST_COLOR),
              ),
            ),
            TextButton(
              onPressed: () {
                onTapSecond();
              },
              child: Text(
                secondButtonName,
                style:
                    ConfigStyle.regularStyle(FONT_LARGE - 4, CARD_FIRST_COLOR),
              ),
            ),
            TextButton(
              onPressed: () {
                onTapThird();
              },
              child: Text(
                thirdButtonName,
                style:
                    ConfigStyle.regularStyle(FONT_LARGE - 4, CARD_FIRST_COLOR),
              ),
            ),
          ],
        );
      },
    );
  }

  static toast({String? msg, bool status = true}) {
    return Fluttertoast.showToast(
        msg: msg.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: status ? BLACK_LIGHT : Colors.red,
        textColor: WHITE_COLOR,
        fontSize: 16.0);
  }
}
