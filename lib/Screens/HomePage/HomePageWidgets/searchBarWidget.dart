import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({required this.onTape, super.key});

  final Function()? onTape;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    double widthOfContainer = width * 0.9;
    double heightOfContainer = height * 0.055;
    return SizedBox(
        width: widthOfContainer,
        height: heightOfContainer,
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(heightOfContainer * 0.5)),
          child: Material(
            borderRadius: BorderRadius.circular(heightOfContainer * 0.5),
            child: InkWell(
              onTap: onTape,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: widthOfContainer * 0.05,
                        right: widthOfContainer * 0.05),
                    child: Icon(
                      Icons.search,
                      size: heightOfContainer * 0.55,
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      'Search For shops & restaurants',
                      style: TextStyle(
                          fontSize: heightOfContainer * 0.35,
                          fontWeight: FontWeight.w300),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
