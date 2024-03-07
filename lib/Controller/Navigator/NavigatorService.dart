import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_panda_clone/features/ItemSelection/item_selection.dart';
import 'package:food_panda_clone/features/admin/bloc/bloc_food_category_bloc.dart';
import 'package:food_panda_clone/features/admin/bloc/bloc_image_picker_bloc.dart';
import 'package:food_panda_clone/features/admin/bloc/waiting_bloc.dart';
import 'package:food_panda_clone/features/admin/screens/admin_page.dart';
import 'package:food_panda_clone/features/authentication/bloc/bloc/auth_bloc.dart';
import 'package:food_panda_clone/features/authentication/screens/PhoneAuth/PhoneAuth.dart';
import 'package:food_panda_clone/features/authentication/screens/Sigup/screnns/signUpPage.dart';
import 'package:food_panda_clone/features/cartedProducts/bloc/bloc/carted_bloc.dart';
import 'package:food_panda_clone/features/cartedProducts/screens/cartedProductsPage.dart';
import 'package:food_panda_clone/features/dashBoard/bloc/bloc/bottom_sheet_bloc.dart';
import 'package:food_panda_clone/features/dashBoard/screens/dashboard.dart';
import 'package:food_panda_clone/features/map/bloc/BlocOfMap/_bloc.dart';
import 'package:food_panda_clone/features/map/screens/mapwithbloc.dart';
import 'package:food_panda_clone/features/map/screens/widgets/identify_location.dart';
import 'package:food_panda_clone/features/home/homePage.dart';

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
      Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0)),
  SliverTransitionType.rightIn:
      Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0)),
  SliverTransitionType.topIn:
      Tween<Offset>(begin: const Offset(0, -1), end: const Offset(0, 0)),
  SliverTransitionType.bottomIn:
      Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0)),
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
      return SlideTransitionPage(child: _dashboardPage(setting));
    case IdentifyLocationPage.pageName:
      return SlideTransitionPage(child: const IdentifyLocationPage());
    case GoogleMapPage.pageName:
      return (SlideTransitionPage(child: const GoogleMapPage()));
    case PhoneAuthPage.pageName:
      return (SlideTransitionPage(child: const PhoneAuthPage()));
    case AdminPage.pageName:
      return SlideTransitionPage(child: _adminPage());
    case ItemsSelection.pageName:
      return SlideTransitionPage(child: _itemsSelected());
    case HomePage.pageName:
      return SlideTransitionPage(child: const HomePage());
    case CartedProductPage.pageName:
      return SlideTransitionPage(child: _cartedProductPage());
    case SignUpPage.pageName:
      return SlideTransitionPage(child: _signUpPage());
  }
}

Widget _signUpPage() {
  return BlocProvider(
    create: (context) => AuthBloc(),
    child: const SignUpPage(),
  );
}

Widget _cartedProductPage() {
  return BlocProvider(
    create: (context) => CartedBloc(),
    child: const CartedProductPage(),
  );
}

Widget _dashboardPage(RouteSettings setting) {
  return DashboardPage(currentLocation: setting.arguments as String);
}

Widget _identifyLocationPage() {
  return BlocProvider(
      create: (context) => LocationBlocClass(),
      child: const IdentifyLocationPage());
}

Widget _itemsSelected() {
  return const ItemsSelection();
}

Widget _adminPage() {
  return MultiBlocListener(
    listeners: [
      BlocProvider(
        create: (context) => WaitingBloc(),
      ),
      BlocProvider(create: (context) => BlocImagePickerBloc()),
      BlocProvider(create: (context) => BlocFoodCategoryBloc()),
    ],
    child: const AdminPage(),
  );
}
