import 'package:flutter/material.dart';

class CategrizedListView extends StatefulWidget {
  const CategrizedListView(
      {required this.widthOfCategory,
      required this.heightOfCategory,
      required this.textForCategory,
      super.key});
  final String textForCategory;
  final double widthOfCategory;
  final double heightOfCategory;

  @override
  State<CategrizedListView> createState() => _CategrizedListViewState();
}

class _CategrizedListViewState extends State<CategrizedListView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
            child: Text(
          widget.textForCategory,
          style: TextStyle(fontSize: widget.heightOfCategory * 0.1),
        ))
      ],
    );
  }
}
