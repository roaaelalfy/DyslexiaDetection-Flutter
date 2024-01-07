import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Headline style
  static get headlineSmallInika => theme.textTheme.headlineSmall!.inika;
  static get headlineSmallInikaOnPrimary =>
      theme.textTheme.headlineSmall!.inika.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get headlineSmallInika_1 => theme.textTheme.headlineSmall!.inika;
}

extension on TextStyle {
  TextStyle get inika {
    return copyWith(
      fontFamily: 'Inika',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }
}
