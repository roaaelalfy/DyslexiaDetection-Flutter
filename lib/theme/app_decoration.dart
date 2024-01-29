import 'package:dyslexiadetectorapp/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:dyslexiadetectorapp/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );

  // Outline decorations
  static BoxDecoration get outlineLightBlue => BoxDecoration(
        color: theme.colorScheme.primary,
        border: Border.all(
          color: appTheme.lightBlue100,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineLightblue100 => BoxDecoration(
        border: Border.all(
          color: appTheme.lightBlue100,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineLightblue10001 => BoxDecoration(
        border: Border.all(
          color: appTheme.lightBlue10001,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineLightblue100011 => BoxDecoration(
        color: theme.colorScheme.primary,
        border: Border.all(
          color: appTheme.lightBlue10001,
          width: 1.h,
        ),
      );
}

class BorderRadiusStyle {
  // Rounded borders
  static BorderRadius get roundedBorder25 => BorderRadius.circular(
        25.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
