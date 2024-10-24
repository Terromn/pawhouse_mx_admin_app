import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color_palette.dart';

class TeAppThemeData {
  static const double appMargin = 16;
  static const double generalBorderRadius = 30;

  static const double teContainerElevation = 6;

  // GAPS //
  static const double generalGap = 12;
  static const double textSmallGap = 4;
  static const double textBigGap = 10;

  // PADDINGS //
  static const double containerPaddingVertical = 12;
  static const double containerPaddingHorizontral = 21;

  // ICONS //
  static const double iconArrowSize = 18;

  static String? teFont = GoogleFonts.montserrat().fontFamily;

  static final ThemeData darkTheme = ThemeData(
    primaryColorDark: TeAppColorPalette.blueGreeny,

    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: TeAppColorPalette.blueGreeny,
    ),
    // APPBAR //
    appBarTheme: AppBarTheme(
      backgroundColor: TeAppColorPalette.darkBlue,
      foregroundColor: TeAppColorPalette.white,
      elevation: 12,
      centerTitle: true,
      titleTextStyle: GoogleFonts.montserrat(
          fontSize: 20,
          fontWeight: FontWeight.w900,
          color: TeAppColorPalette.white),
    ),

    switchTheme: SwitchThemeData(
      trackColor: WidgetStateProperty.all<Color>(TeAppColorPalette.blue),
      thumbColor: WidgetStateProperty.all<Color>(TeAppColorPalette.blueGreeny),
      trackOutlineColor: WidgetStateProperty.all<Color>(TeAppColorPalette.blue),
    ),

    dialogTheme: DialogTheme(
        backgroundColor: TeAppColorPalette.darkBlue,
        titleTextStyle: TextStyle(
          color: TeAppColorPalette.white,
          fontSize: 26,
          fontFamily: teFont,
          fontWeight: FontWeight.bold,
        ),
        contentTextStyle: TextStyle(
          color: TeAppColorPalette.white,
          fontSize: 18,
          fontFamily: teFont,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center),

    // BOTTOM NAV BAR //
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: TeAppColorPalette.blueGreeny,
      selectedItemColor: TeAppColorPalette.darkBlue,
      showUnselectedLabels: false,
      selectedIconTheme: IconThemeData(size: 42),
      unselectedIconTheme: IconThemeData(size: 32),
      elevation: 12,
    ),

    // ElEVATED BUTTON //
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.all<TextStyle>(const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: TeAppColorPalette.darkBlue,
        )),
        padding: WidgetStateProperty.all<EdgeInsetsGeometry?>(
            const EdgeInsets.symmetric(horizontal: 12, vertical: 4)),
        backgroundColor:
            WidgetStateProperty.all<Color>(TeAppColorPalette.blueGreeny),
        alignment: Alignment.center,
        elevation: WidgetStateProperty.all(12),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
      ),
    ),

    // SNACK BAR //
    snackBarTheme: const SnackBarThemeData(
      backgroundColor:
          TeAppColorPalette.blueGreeny, // Set the desired background color
      contentTextStyle: TextStyle(
          color: TeAppColorPalette.darkBlue), // Set the desired text color
    ),

    // TEXT BUTTON //
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all<Color>(
          TeAppColorPalette.darkBlue,
        ),
      ),
    ),

    // CARD //
    cardTheme: CardTheme(
      elevation: 24,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
    ),

    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: TeAppColorPalette.white,
    ),

    // TEXTFIELD //
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: TeAppColorPalette.darkBlue),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: TeAppColorPalette.darkBlue, width: 4),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      outlineBorder: BorderSide(color: TeAppColorPalette.darkBlue, width: 4),
      contentPadding: EdgeInsets.symmetric(horizontal: TeAppThemeData.containerPaddingHorizontral,  vertical: TeAppThemeData.containerPaddingVertical),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: TeAppColorPalette.blueGreeny, width: 6),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      
    ),

    // TIME PICKER //
    timePickerTheme: const TimePickerThemeData(
      backgroundColor: TeAppColorPalette.darkBlue,
      dialHandColor: TeAppColorPalette.blueGreeny,
      dayPeriodColor: TeAppColorPalette.blueGreeny,
      dialBackgroundColor: TeAppColorPalette.blue,
      hourMinuteColor: TeAppColorPalette.blue,
      dayPeriodTextColor: TeAppColorPalette.darkBlue,
      hourMinuteTextColor: TeAppColorPalette.blueGreeny,
      // You can customize other properties as well
    ),

    datePickerTheme: DatePickerThemeData(
      backgroundColor: TeAppColorPalette.darkBlue,
      headerBackgroundColor: TeAppColorPalette.blue,
      headerForegroundColor: TeAppColorPalette.white,
      todayBorder: const BorderSide(color: TeAppColorPalette.blueGreeny),
      dividerColor: TeAppColorPalette.blueGreeny,
      todayBackgroundColor: WidgetStateProperty.all<Color>(
        TeAppColorPalette.darkBlue,
      ),
      dayOverlayColor: WidgetStateProperty.all<Color>(
        TeAppColorPalette.blueGreeny,
      ),
      todayForegroundColor: WidgetStateProperty.all<Color>(
        TeAppColorPalette.blueGreeny,
      ),
      rangeSelectionOverlayColor: WidgetStateProperty.all<Color>(
        TeAppColorPalette.blueGreeny,
      ),
      rangePickerBackgroundColor: TeAppColorPalette.blueGreeny,
      dayBackgroundColor:
          WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return TeAppColorPalette.blueGreeny;
        } else {
          return TeAppColorPalette.darkBlue;
        }
      }),
      dayForegroundColor:
          WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return TeAppColorPalette.darkBlue;
        } else {
          return TeAppColorPalette.white;
        }
      }),
      surfaceTintColor: TeAppColorPalette.blueGreeny,
      rangePickerHeaderForegroundColor: TeAppColorPalette.white,
    ),

    splashColor: TeAppColorPalette.blueGreeny,
    scaffoldBackgroundColor: TeAppColorPalette.white,

    // GENERAL //
    brightness: Brightness.dark,
    primaryColor: TeAppColorPalette.darkBlue,
    fontFamily: teFont,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.montserrat(
          fontSize: 20,
          fontWeight: FontWeight.w800,
          color: TeAppColorPalette.white),
      displayMedium: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: TeAppColorPalette.white),
    ),
  );
}
