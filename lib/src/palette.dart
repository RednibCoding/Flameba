import 'package:flutter/material.dart';

class Palette {
  static bool darkMode = false;

  // Accent Colors
  static const kCricleItemColor = Color(0xFFE5E5E5);

  // Background Colors
  static Color kBackgroundColor = kMain()[800]!;
  static Color kIconBackgroundColor = kMain()[800]!;

  //Darkmode / Lightmode getter
  static MaterialColor kMain() {
    if (darkMode) {
      return kMainDark;
    } else {
      return kMainLight;
    }
  }

  static MaterialColor kRed() {
    if (darkMode) {
      return kRedDark;
    } else {
      return kRedLight;
    }
  }

  static MaterialColor kGreen() {
    if (darkMode) {
      return kGreenDark;
    } else {
      return kGreenLight;
    }
  }

  static MaterialColor kYellow() {
    if (darkMode) {
      return kYellowDark;
    } else {
      return kYellowLight;
    }
  }

  static MaterialColor kOrange() {
    if (darkMode) {
      return kOrangeDark;
    } else {
      return kOrangeLight;
    }
  }

  //Theme
  static const MaterialColor kMainLight = MaterialColor(
    0xff005188, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff1a6294), //10%
      100: Color(0xff3374a0), //20%
      200: Color(0xff4d85ac), //30%
      300: Color(0xff6697b8), //40%
      400: Color(0xff80a8c4), //50%
      500: Color(0xff99b9cf), //60%
      600: Color(0xffb3cbdb), //70%
      700: Color(0xffccdce7), //80%
      800: Color(0xffe6eef3), //90%
      900: Color(0xffffffff), //100%
    },
  );
  static const MaterialColor kMainDark = MaterialColor(
    0xff005188, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff00497a), //10%
      100: Color(0xff00416d), //20%
      200: Color(0xff00395f), //30%
      300: Color(0xff003152), //40%
      400: Color(0xff002944), //50%
      500: Color(0xff002036), //60%
      600: Color(0xff001829), //70%
      700: Color(0xff00101b), //80%
      800: Color(0xff00080e), //90%
      900: Color(0xff000000), //100%
    },
  );

  static const MaterialColor kRedLight = MaterialColor(
    0xff911219, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff9c2a30), //10%
      100: Color(0xffa74147), //20%
      200: Color(0xffb2595e), //30%
      300: Color(0xffbd7175), //40%
      400: Color(0xffc8898c), //50%
      500: Color(0xffd3a0a3), //60%
      600: Color(0xffdeb8ba), //70%
      700: Color(0xffe9d0d1), //80%
      800: Color(0xfff4e7e8), //90%
      900: Color(0xffffffff), //100%
    },
  );
  static const MaterialColor kRedDark = MaterialColor(
    0xff911219, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff831017), //10%
      100: Color(0xff740e14), //20%
      200: Color(0xff660d12), //30%
      300: Color(0xff570b0f), //40%
      400: Color(0xff49090d), //50%
      500: Color(0xff3a070a), //60%
      600: Color(0xff2b0507), //70%
      700: Color(0xff1d0405), //80%
      800: Color(0xff0e0202), //90%
      900: Color(0xff000000), //100%
    },
  );

  static const MaterialColor kGreenLight = MaterialColor(
    0xff008700, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff1a931a), //10%
      100: Color(0xff339f33), //20%
      200: Color(0xff4dab4d), //30%
      300: Color(0xff66b766), //40%
      400: Color(0xff80c380), //50%
      500: Color(0xff99cf99), //60%
      600: Color(0xffb3dbb3), //70%
      700: Color(0xffcce7cc), //80%
      800: Color(0xffe6f3e6), //90%
      900: Color(0xffffffff), //100%
    },
  );
  static const MaterialColor kGreenDark = MaterialColor(
    0xff008700, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff007a00), //10%
      100: Color(0xff006c00), //20%
      200: Color(0xff005f00), //30%
      300: Color(0xff005100), //40%
      400: Color(0xff004400), //50%
      500: Color(0xff003600), //60%
      600: Color(0xff002800), //70%
      700: Color(0xff001b00), //80%
      800: Color(0xff000d00), //90%
      900: Color(0xff000000), //100%
    },
  );

  static const MaterialColor kYellowLight = MaterialColor(
    0xffFFC821, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffffce37), //10%
      100: Color(0xffffd34d), //20%
      200: Color(0xffffd964), //30%
      300: Color(0xffffde7a), //40%
      400: Color(0xffffe490), //50%
      500: Color(0xffffe9a6), //60%
      600: Color(0xffffefbc), //70%
      700: Color(0xfffff4d3), //80%
      800: Color(0xfffffae9), //90%
      900: Color(0xffffffff), //100%
    },
  );

  static const MaterialColor kYellowDark = MaterialColor(
    0xffFFC821, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffe6b41e), //10%
      100: Color(0xffcca01a), //20%
      200: Color(0xffb38c17), //30%
      300: Color(0xff997814), //40%
      400: Color(0xff806411), //50%
      500: Color(0xff66500d), //60%
      600: Color(0xff4c3c0a), //70%
      700: Color(0xff332807), //80%
      800: Color(0xff191403), //90%
      900: Color(0xff000000), //100%
    },
  );

  static const MaterialColor kOrangeLight = MaterialColor(
    0xffffa300, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffffac1a), //10%
      100: Color(0xffffb533), //20%
      200: Color(0xffffbf4d), //30%
      300: Color(0xffffc866), //40%
      400: Color(0xffffd180), //50%
      500: Color(0xffffda99), //60%
      600: Color(0xffffe3b3), //70%
      700: Color(0xffffedcc), //80%
      800: Color(0xfffff6e6), //90%
      900: Color(0xffffffff), //100%
    },
  );

  static const MaterialColor kOrangeDark = MaterialColor(
    0xffffa300, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffe69300), //10%
      100: Color(0xffcc8200), //20%
      200: Color(0xffb37200), //30%
      300: Color(0xff996200), //40%
      400: Color(0xff805200), //50%
      500: Color(0xff664100), //60%
      600: Color(0xff4c3100), //70%
      700: Color(0xff332100), //80%
      800: Color(0xff191000), //90%
      900: Color(0xff000000), //100%
    },
  );
}
