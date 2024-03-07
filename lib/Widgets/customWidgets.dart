import 'package:flutter/material.dart';
import 'package:food_panda_clone/Utility/helpers/helping_function.dart';
import 'package:food_panda_clone/Utility/validators/validations.dart';

class TWidgets {
  static Widget inkWellBtn(
      {required BuildContext context,
      required Function()? fun,
      required String btnText,
      Color color = Colors.blueAccent,
      Color textColor = Colors.white}) {
    double width = THelpingFunction.screenWidth(context: context);
    double height = THelpingFunction.screenHeight(context: context);
    return Material(
      color: color,
      child: InkWell(
        onTap: fun,
        child: Center(
            child: FittedBox(
          child: Text(
            btnText,
            style: TextStyle(
                color: textColor,
                fontSize: height * 0.025,
                fontWeight: FontWeight.w500),
          ),
        )),
      ),
    );
  }

  static Widget inkwellIconBtn(
      {required BuildContext context,
      required Function()? fun,
      required IconData? icon,
      Color color = Colors.blueAccent,
      Color iconColor = Colors.white}) {
    double height = THelpingFunction.screenHeight(context: context);

    return Container(
        clipBehavior: Clip.antiAlias,
        // width: widthOfSelectionLocationbtn,
        // height: heightOfSelectionLocationbtn,
        decoration: BoxDecoration(
            // color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(height * 0.02)),
        child: Material(
          color: color,
          child: InkWell(
            onTap: fun,
            child: Center(
                child: FittedBox(
              child: Center(
                  child: Icon(
                icon,
                color: iconColor,
                size: height * 0.5,
              )),
            )),
          ),
        ));
  }

  static Widget textformFieldWidget(
      {required BuildContext context,
      required TextEditingController controller,
      required String lable,
      String? Function(String?)? value,
      double borderOutLineRadius = 0.05}) {
    double width = MediaQuery.of(context).size.width;

    return TextFormField(
        controller: controller,
        validator: value,
        decoration: InputDecoration(
            helperMaxLines: 10,
            label: Text(lable),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(width * borderOutLineRadius)))));
  }

  static Widget TextFieldWidget(
      {required BuildContext context,
      required String hint,
      required TextEditingController controller,
      String? Function(String?)? validationFun}) {
    double height = THelpingFunction.screenHeight(context: context);
    double width = THelpingFunction.screenWidth(context: context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.01),
      child: TextFormField(
        validator: validationFun,
        controller: controller,
        decoration: InputDecoration(hintText: hint),
      ),
    );
  }
}
