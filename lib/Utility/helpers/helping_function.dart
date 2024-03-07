import 'package:flutter/material.dart';

class THelpingFunction {
  THelpingFunction._();

  static void showSnackBar(
      {required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 2),
        closeIconColor: Colors.white,
        // shape: Border.all(),
        padding: EdgeInsets.symmetric(
            horizontal: THelpingFunction.screenWidth(context: context) * 0.2),
        showCloseIcon: true,
        backgroundColor: Colors.pink,
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
          ),
          // selectionColor: Colors.amber,
        )));
  }

  static void navigateToScreen(
      {required BuildContext context, required Widget screen}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  static void showAlertDialog(
      {required BuildContext context,
      required String title,
      required String message,
      Function? driventAtEvent}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(onPressed: () => driventAtEvent, child: const Text('OK'))
          ]),
    );
  }

  static String truncateText({required String text, required int minLenght}) {
    if (text.length <= minLenght) {
      return text;
    } else {
      return text.substring(0, minLenght);
    }
  }

  static bool isDarkMode({required BuildContext context}) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize({required BuildContext context}) {
    return MediaQuery.of(context).size;
  }

  static double screenHeight({required BuildContext context}) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth({required BuildContext context}) {
    return MediaQuery.of(context).size.width;
  }

  // static String getFormatedDate({required DateTime date, String format = "dd MMM yyyy"}){
  //   return
  // }

  static List removeDoplicateFromList({required List list}) {
    return list.toSet().toList();
  }

  static void navigatWithRouteName(
      {required BuildContext context,
      required String routName,
      Object? argument}) {
    Navigator.of(context).pushNamed(routName, arguments: argument);
  }
}
