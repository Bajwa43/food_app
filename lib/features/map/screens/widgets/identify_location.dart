import 'package:flutter/material.dart';
import 'package:food_panda_clone/features/map/screens/mapwithbloc.dart';
// import 'package:food_panda_clone/Screens/map/mapwithbloc.dart';

class IdentifyLocationPage extends StatefulWidget {
  const IdentifyLocationPage({super.key});
  static const String pageName = '/IdentifyLocationPage';

  @override
  State<IdentifyLocationPage> createState() => _IdentifyLocationPageState();
}

class _IdentifyLocationPageState extends State<IdentifyLocationPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    double widthOfDrawer = width * 0.8;

    // Size
    double sizeOfImage = height * 0.2;
    double sizeOfTitleMap = height * 0.08;
    double widthOfCurrentLocationBtn = width * 0.8;
    double heightOfCurrentLocationBtn = width * 0.15;

    return Scaffold(
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          // Image Of Map Loocation
          SizedBox(
              height: sizeOfImage,
              child: Image.asset('assets/images/map*.png')),
          // Title For Map Location
          SizedBox(
            height: sizeOfTitleMap,
            child: const FittedBox(
              child: Text('''Find resturents and shops
               near you!''', style: TextStyle(fontWeight: FontWeight.w700)),
            ),
          ),

          //  Button For Live Location
          Container(
            width: widthOfCurrentLocationBtn,
            height: heightOfCurrentLocationBtn,
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius:
                    BorderRadius.circular(heightOfCurrentLocationBtn * 0.5),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black38,
                    offset: Offset(1, 1),
                    blurRadius: 1,
                  ),
                ]),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(GoogleMapPage.pageName);
              },
              child: Center(
                child: SizedBox(
                  height: heightOfCurrentLocationBtn * 0.4,
                  child: const FittedBox(
                    child: Text('Share my current location',
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
