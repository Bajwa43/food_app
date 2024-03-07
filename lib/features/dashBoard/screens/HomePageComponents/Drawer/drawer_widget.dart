import 'package:flutter/material.dart';
import 'package:food_panda_clone/features/dashBoard/screens/HomePageComponents/Drawer/DrawerWidgets/InkwellIconTextBtn.dart';
// import 'package:food_panda_clone/Screens/dashBoalib/features/authentication/screens/blocrd/HomePageComponents/Drawer/DrawerWidgets/InkwellIconTextBtn.dart';

// import '../../../HomePageComponents/Drawer/DrawerWidgets/InkwellIconTextBtn.dart';

class DrawerWidgets extends StatefulWidget {
  const DrawerWidgets({super.key});

  @override
  State<DrawerWidgets> createState() => _DrawerWidgetsState();
}

class _DrawerWidgetsState extends State<DrawerWidgets> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    double widthOfDrawer = width * 0.8;
    double heightOfDrawerAccountContainer = height * 0.35;
    double heightOfDrawerOptionContainer = height * 0.65;

    return SizedBox(
        width: widthOfDrawer,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: heightOfDrawerAccountContainer,
              // width: 100,
              color: Colors.pink,
            ),
            Container(
              height: heightOfDrawerOptionContainer,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWellIconTextBtn(
                      widthOfDrawer: widthOfDrawer,
                      icon: Icons.question_mark,
                      btnText: 'Help center'),
                  InkWellIconTextBtn(
                      widthOfDrawer: widthOfDrawer,
                      icon: Icons.business_sharp,
                      btnText: 'Foodpanda for business'),
                  InkWellIconTextBtn(
                      widthOfDrawer: widthOfDrawer,
                      icon: Icons.gif_box,
                      btnText: 'Invite friends'),

                  // Divider b/w Drawer Option Btns
                  const Divider(
                    thickness: 0.5,
                  ),

                  // Setting Btn

                  InkWell(
                    child: SizedBox(
                      width: widthOfDrawer,
                      child: Padding(
                        padding: EdgeInsets.all(height * 0.023),
                        child: Text('Setting',
                            style: TextStyle(fontSize: widthOfDrawer * 0.055)),
                      ),
                    ),
                  ),
                  InkWell(
                    child: SizedBox(
                      width: widthOfDrawer,
                      child: Padding(
                        padding: EdgeInsets.all(height * 0.023),
                        child: Text('Term & Conditions /Privacy.',
                            style: TextStyle(fontSize: widthOfDrawer * 0.055)),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
