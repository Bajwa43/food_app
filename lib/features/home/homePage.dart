import 'package:flutter/material.dart';
import 'package:food_panda_clone/Controller/Navigator/Routes.dart';
import 'package:food_panda_clone/Utility/helpers/helping_function.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String pageName = '/';

  @override
  Widget build(BuildContext context) {
    double width = THelpingFunction.screenWidth(context: context);
    double height = THelpingFunction.screenHeight(context: context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: SizedBox(
                  // width: width*0.7,
                  height: height * 0.45,
                  child: Image.asset(
                    'assets/images/Backend.png',
                    fit: BoxFit.fill,
                  )),
            ),
            // BUTTONS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      THelpingFunction.navigatWithRouteName(
                          context: context, routName: RoutesName.adminPage);
                    },
                    child: const Text('Admin')),
                ElevatedButton(
                    onPressed: () {
                      THelpingFunction.navigatWithRouteName(
                          context: context,
                          routName: RoutesName.dashboardPage,
                          argument: 'Bahawalpur');
                    },
                    child: const Text('DashBoard')),
                ElevatedButton(
                    onPressed: () {
                      THelpingFunction.navigatWithRouteName(
                        context: context,
                        routName: RoutesName.signUpPage,
                        // argument: 'Bahawalpur'
                      );
                    },
                    child: const Text('SignUp')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
