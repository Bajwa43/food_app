import 'package:flutter/material.dart';

class InkWellIconTextBtn extends StatelessWidget {
  const InkWellIconTextBtn(
      {required this.widthOfDrawer,
      required this.icon,
      required this.btnText,
      super.key});

  final IconData icon;
  final String btnText;
  final double widthOfDrawer;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;

    return InkWell(
      child: Padding(
        padding: EdgeInsets.all(height * 0.023),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(right: width * 0.07),
            child: Icon(
              icon,
              color: Colors.pink,
              size: widthOfDrawer * 0.08,
            ),
          ),
          FittedBox(
            child: Text(
              btnText,
              style: TextStyle(fontSize: widthOfDrawer * 0.055),
            ),
          )
        ]),
      ),
    );
  }
}
