import 'package:flutter/material.dart';

class ServiceContainerWidget extends StatefulWidget {
  const ServiceContainerWidget(
      {required this.imageOfServiceContainer,
      required this.textForServiceName,
      required this.textForServiceDiscription,
      required this.heightOfContainer,
      required this.widthOfContainer,
      super.key});
  final double widthOfContainer;
  final double heightOfContainer;
  final String textForServiceDiscription;
  final String textForServiceName;
  final String imageOfServiceContainer;

  @override
  State<ServiceContainerWidget> createState() => _ServiceContainerWidgetState();
}

class _ServiceContainerWidgetState extends State<ServiceContainerWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;

    // double widthOfContainer = width * 0.4;

    // double heightOfContainer = height * 0.3;
    return Padding(
      padding: EdgeInsets.all(height * 0.008),
      child: Container(
        width: widget.widthOfContainer,
        height: widget.heightOfContainer,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.widthOfContainer * 0.1),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  offset: Offset(1, 1), blurRadius: 1, color: Colors.black38),
              BoxShadow(
                  offset: Offset(-1, -1), blurRadius: 1, color: Colors.black38)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First Text
            Padding(
                padding: EdgeInsets.only(
                    left: widget.widthOfContainer * 0.05,
                    top: widget.widthOfContainer * 0.05,
                    right: widget.widthOfContainer * 0.02),
                child: FittedBox(
                    child: Text(
                  widget.textForServiceName,
                  style: TextStyle(
                      fontSize: widget.widthOfContainer * 0.12,
                      fontWeight: FontWeight.w600),
                ))),

            // Second Text
            Padding(
                padding: EdgeInsets.only(
                    left: widget.widthOfContainer * 0.05,
                    right: widget.widthOfContainer * 0.02),
                child: FittedBox(
                    child: Text(
                  widget.textForServiceDiscription,
                  style: TextStyle(
                    fontSize: widget.widthOfContainer * 0.09,

                    // fontWeight: FontWeight.w500
                  ),
                ))),
            SizedBox(
              height: widget.heightOfContainer * 0.2,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                  height: widget.heightOfContainer * 0.4,
                  child: Image.asset(widget.imageOfServiceContainer)),
            ),
          ],
        ),
      ),
    );
  }
}
