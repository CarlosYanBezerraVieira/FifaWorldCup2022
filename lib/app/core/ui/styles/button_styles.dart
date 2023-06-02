import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';

class ButtonStyles {
  static ButtonStyles? _instance;

  ButtonStyles._();
  static ButtonStyles get i {
    _instance ??= ButtonStyles._();
    return _instance!;
  }

  ButtonStyle get yellowButton => ElevatedButton.styleFrom(
        textStyle: TextStyles.i.textSecondaryFontExtraBold.copyWith(
          fontSize: 14,
        ),
        backgroundColor: ColorsApp.i.yellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      );

  ButtonStyle get yellowOutlineButton => OutlinedButton.styleFrom(
        textStyle: TextStyles.i.textSecondaryFontExtraBold.copyWith(
          fontSize: 14,
        ),
        side: BorderSide(color: ColorsApp.i.yellow),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      );

  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
        textStyle: TextStyles.i.textSecondaryFontExtraBold.copyWith(
          fontSize: 14,
        ),
        backgroundColor: ColorsApp.i.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      );

  ButtonStyle get primaryOutlineButton => OutlinedButton.styleFrom(
        textStyle: TextStyles.i.textSecondaryFontExtraBold.copyWith(
          fontSize: 14,
        ),
        side: BorderSide(color: ColorsApp.i.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      );
}

extension ButtonStylesExtension on BuildContext {
  ButtonStyles get buttonStyles => ButtonStyles.i;
}
