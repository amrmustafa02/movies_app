import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movies/my_theme.dart';

class DialogUtils {
  static void showLoadingDialog(BuildContext context) {
    showDialog(
        // The user CANNOT close this dialog  by pressing outsite it
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return Dialog(
            // The background color
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // The loading indicator
                  LoadingAnimationWidget.threeRotatingDots(
                      color: Theme.of(context).primaryColor, size: 30),
                  const SizedBox(
                    height: 15,
                  ),
                  // Some text
                  const Text(
                    "Loading...",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          );
        });
  }

  static Widget getShowMessage(String text, BuildContext context,
      Function okFunction, Function cancelFunction) {
    return AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: Text(text),
      titleTextStyle: const TextStyle(color: Colors.white, fontSize: 18),
      actions: [
        TextButton(
          onPressed: () {
            okFunction();
          },
          child: Text(
            "OK",
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
      ],
    );
  }

  static void showBottomSheet(BuildContext context, Widget widget) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(15), topLeft: Radius.circular(15)),
      ),
      context: context,
      builder: (BuildContext context) {
        return widget;
      },
    );
  }
}
