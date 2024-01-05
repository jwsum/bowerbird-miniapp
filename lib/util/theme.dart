import 'package:bowerbird_miniapp/util/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme = ThemeData(
  primaryColor: kPrimaryColor,
  textTheme: textTheme,
  colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF333333)),
  elevatedButtonTheme: elevatedButtonThemeData,
  useMaterial3: true,
);

TextTheme textTheme = GoogleFonts.mulishTextTheme();

ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
      (states) {
        if (states.contains(MaterialState.disabled)) {
          return Colors.grey;
        } else if (states.contains(MaterialState.error)) {
          return Colors.red;
        } else {
          return kPrimaryColor;
        }
      },
    ),
    foregroundColor: const MaterialStatePropertyAll(Colors.white),
    iconColor: const MaterialStatePropertyAll(Colors.white),
    iconSize: const MaterialStatePropertyAll(18.0),
    padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(
        vertical: PaddingConstant.halfPadding,
        horizontal: PaddingConstant.defaultPadding)),
    shape: MaterialStatePropertyAll<OutlinedBorder>(
      RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kDefaultBorderRadius)),
    ),
    textStyle: MaterialStatePropertyAll(
        textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold)),
  ),
);
