import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_panda_clone/Controller/Navigator/Routes.dart';
import 'package:food_panda_clone/Utility/theme/custume_theme/appbar_theme.dart';
import 'package:food_panda_clone/Utility/theme/theme.dart';
import 'package:food_panda_clone/features/authentication/screens/Sigup/screnns/signUpPage.dart';
import 'package:food_panda_clone/features/dashBoard/screens/dashboard.dart';
import 'package:food_panda_clone/features/map/bloc/BlocOfMap/_bloc.dart';
import 'package:food_panda_clone/features/home/homePage.dart';

// import 'Bloc/BlocOfMap/_bloc.dart';
import 'Controller/Navigator/NavigatorService.dart';
import 'features/admin/bloc/bloc_image_picker_bloc.dart';
import 'features/map/screens/mapwithbloc.dart';
// import 'Screens/Admin/bloc/bloc_image_picker_bloc.dart';
// import 'Screens/map/mapwithbloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocationBlocClass(),
        ),
        BlocProvider(create: (context) => BlocImagePickerBloc())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        // theme: ThemeData(
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //   useMaterial3: true,
        // ),
        theme: TAppTheme.materialAppColorTheme(
            context: context,
            brightnessLightOrDark: Brightness.light,
            outlineSideBorderBlueOrAccentblueColor: Colors.blue,
            themeColorBaseOnBrightnessUsingAtManyNeededlocation: Colors.white,
            themeOPColorBaseOnBrightnessUsingAtManyNeededLocation:
                Colors.black),
        darkTheme: TAppTheme.materialAppColorTheme(
            context: context,
            brightnessLightOrDark: Brightness.dark,
            outlineSideBorderBlueOrAccentblueColor: Colors.blueAccent,
            themeColorBaseOnBrightnessUsingAtManyNeededlocation: Colors.black,
            themeOPColorBaseOnBrightnessUsingAtManyNeededLocation:
                Colors.white),
        initialRoute: RoutesName.signUpPage,
        onGenerateRoute: onGenreateRoute,
        // home: SignUpPage(),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
