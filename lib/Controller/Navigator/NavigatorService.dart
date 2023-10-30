import 'package:flutter/material.dart';
import 'package:food_panda_clone/Screens/HomePage/dashboard.dart';
import 'package:food_panda_clone/Screens/Map/mapwithbloc.dart';
import 'package:food_panda_clone/Screens/identify_location.dart';

class NavigatorService {}

class SlideTransitionPage extends PageRouteBuilder {
  SlideTransitionPage({
    required this.child,
    RouteSettings? settings,
    SliverTransitionType slideTransitionType = SliverTransitionType.bottomIn,
    Duration duration = const Duration(milliseconds: 500),
  }) : super(
            settings: settings,
            transitionDuration: duration,
            reverseTransitionDuration: duration,
            transitionsBuilder: (context, animation, secondAnimation, child) {
              Tween<Offset> tween =
                  tweenSlideTransitionMap[slideTransitionType];
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
            pageBuilder: (context, animation, secondAnimation) => child);

  final Widget child;
}

Map tweenSlideTransitionMap = <SliverTransitionType, Tween>{
  SliverTransitionType.leftIn:
      Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)),
  SliverTransitionType.rightIn:
      Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)),
  SliverTransitionType.topIn:
      Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0)),
  SliverTransitionType.bottomIn:
      Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)),
};

enum SliverTransitionType {
  leftIn,
  rightIn,
  bottomIn,
  topIn,
}

Route? onGenreateRoute(RouteSettings setting) {
  switch (setting.name) {
    case DashboardPage.pageName:
      return SlideTransitionPage(child: DashboardPage());
    case IdentifyLocationPage.pageName:
      return SlideTransitionPage(child: IdentifyLocationPage());
    case GoogleMapPage.pageName:
      return (SlideTransitionPage(child: GoogleMapPage()));
  }

  if (setting.name == DashboardPage.pageName) {
    return SlideTransitionPage(settings: setting, child: DashboardPage());
  }
}
