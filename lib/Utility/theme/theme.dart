import 'package:flutter/material.dart';

import 'custume_theme/appbar_theme.dart';
import 'custume_theme/bottom_sheet_theme.dart';
import 'custume_theme/check_box_theme.dart';
import 'custume_theme/chip_theme.dart';
import 'custume_theme/elevated_btn_theme.dart';
import 'custume_theme/outline_btn_theme.dart';
import 'custume_theme/text_field_theme.dart';
import 'custume_theme/text_theme.dart';

class TAppTheme {
  TAppTheme._();

// Method For Both (Light & Dark Mode)
  static ThemeData materialAppColorTheme(
      {required BuildContext context,
      required Brightness brightnessLightOrDark,
      // required Color scaffoldBackgroundColorLightOrDark,
      // required Color textColorOPTheme,
      // required Color chipOPColorLightOrDark,
      // required Color appBareOPColorThemeLightOrDark,
      // required Color bottomSheetColorsDarkOrLight,
      // required Color outlineBtnOPColorLightorDark,
      required Color outlineSideBorderBlueOrAccentblueColor,
      // required Color inputDecorationOPLightOrDarkTheme,
      required Color themeColorBaseOnBrightnessUsingAtManyNeededlocation,
      required Color themeOPColorBaseOnBrightnessUsingAtManyNeededLocation}) {
    return ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        brightness: brightnessLightOrDark,
        primaryColor: Colors.blue,
        textTheme: TTextTheme.textMaterialAppLightOrDarkTheme(
            context: context,
            textColortheme:
                themeOPColorBaseOnBrightnessUsingAtManyNeededLocation),
        chipTheme: TChipTheme.chipThemeDataLightOrDark(
            context: context,
            chipOPColorLightOrDark:
                themeOPColorBaseOnBrightnessUsingAtManyNeededLocation),
        scaffoldBackgroundColor:
            themeColorBaseOnBrightnessUsingAtManyNeededlocation,
        appBarTheme: TAppbarTheme.appBarMaterialAppLightOrDarkTheme(
            context: context,
            appBareOPColorThemeLightOrDark:
                themeOPColorBaseOnBrightnessUsingAtManyNeededLocation),
        checkboxTheme:
            TCheckBoxTheme.checkboxLightOrDarkTheme(context: context),
        bottomSheetTheme: TBottomSheetTheme.bottomAppBarLightOrDarkTheme(
            context: context,
            bottomSheetColorsDarkOrLight:
                themeColorBaseOnBrightnessUsingAtManyNeededlocation),
        elevatedButtonTheme:
            TElevatedBtnTheme.elevatedBtnLightOrDarkTheme(context: context),
        outlinedButtonTheme: TOutlintTheme.outlinedButtonLightOrDarkThemeData(
            context: context,
            outlineBtnOPColorLightorDark:
                themeOPColorBaseOnBrightnessUsingAtManyNeededLocation,
            outlineSideBorderBlueOrAccentblueColor:
                outlineSideBorderBlueOrAccentblueColor),
        inputDecorationTheme: TTextFieldTheme.inputDecorationLightOrDarkTheme(
            context: context,
            inputDecorationOPLightOrDarkTheme:
                themeOPColorBaseOnBrightnessUsingAtManyNeededLocation));
  }

  // static ThemeData darkTheme = ThemeData(
  //   useMaterial3: true,
  //   fontFamily: 'Poppins',
  //   brightness: Brightness.dark,
  //   scaffoldBackgroundColor: Colors.black,
  //   textTheme: TAppTextTheme.lightTextTheme,
  // );
}
