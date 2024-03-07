import 'package:flutter/material.dart';

class ItemsSelection extends StatefulWidget {
  const ItemsSelection({super.key});
  static const pageName = '/ItemsSelection';

  @override
  State<ItemsSelection> createState() => _ItemsSelectionState();
}

class _ItemsSelectionState extends State<ItemsSelection> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Page'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.black,
              height: height * 0.85,
              child: Column(children: [
                Container(
                    width: width * 0.9,
                    height: height * 0.35,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Image.asset('assets/images/map*.png')),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
