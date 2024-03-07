import 'package:flutter/material.dart';
import 'package:food_panda_clone/Utility/helpers/helping_function.dart';

class ServiceContainerWidget extends StatefulWidget {
  const ServiceContainerWidget(
      {required this.imageOfServiceContainer,
      required this.textForServiceName,
      required this.textForProductPrice,
      required this.heightOfContainer,
      required this.widthOfContainer,
      this.onTap,
      super.key});
  final double widthOfContainer;
  final double heightOfContainer;
  final String textForProductPrice;
  final String textForServiceName;
  final String imageOfServiceContainer;
  final Function()? onTap;

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
    return Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(widget.widthOfContainer * 0.1),
      child: InkWell(
        onTap: widget.onTap,
        child: Padding(
          padding: EdgeInsets.all(height * 0.008),
          child: Container(
            width: widget.widthOfContainer,
            height: widget.heightOfContainer,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(widget.widthOfContainer * 0.1),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(1, 1),
                      blurRadius: 1,
                      color: Colors.black38),
                  BoxShadow(
                      offset: Offset(-1, -1),
                      blurRadius: 1,
                      color: Colors.black38)
                ]),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                // Image
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                      height:
                          (widget.heightOfContainer + widget.widthOfContainer) *
                              0.25,
                      width: widget.widthOfContainer,
                      child: Image.network(
                        widget.imageOfServiceContainer,
                        fit: BoxFit.fill,
                      )),
                ),
                SizedBox(
                  height: widget.heightOfContainer * 0.0,
                ),

                // First Text
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: widget.widthOfContainer * 0.05,
                          right: widget.widthOfContainer * 0.02),
                      child: FittedBox(
                          child: Text(
                        widget.textForServiceName,
                        style: TextStyle(
                            fontSize: widget.widthOfContainer * 0.12,
                            fontWeight: FontWeight.w400),
                      ))),
                ),

                // Second Text
                Padding(
                    padding: EdgeInsets.only(
                        left: widget.widthOfContainer * 0.05,
                        right: widget.widthOfContainer * 0.02),
                    child: Row(children: [
                      // RS
                      Text('Rs.',
                          style: TextStyle(
                              fontSize: widget.widthOfContainer * 0.1,
                              fontWeight: FontWeight.w600)),

                      // Amount
                      Padding(
                        padding: EdgeInsets.only(
                            left: widget.widthOfContainer * 0.05),
                        child: FittedBox(
                            child: Text(
                          '${widget.textForProductPrice}.00',
                          style: TextStyle(
                            fontSize: widget.widthOfContainer * 0.09,

                            // fontWeight: FontWeight.w500
                          ),
                        )),
                      ),
                    ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
