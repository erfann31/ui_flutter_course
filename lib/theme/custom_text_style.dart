import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodySmallBluegray400 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueGray400,
      );
  static get bodySmallIndigo200 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.indigo200,
      );
}

extension on TextStyle {
  TextStyle get jost {
    return copyWith(
      fontFamily: 'Jost',
    );
  }
}
