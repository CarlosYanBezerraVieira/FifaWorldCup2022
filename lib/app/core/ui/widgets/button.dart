// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';

import '../styles/button_styles.dart';

class Button extends StatelessWidget {
  final ButtonStyle style;
  final TextStyle labelStyle;
  final String label;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  final bool outlined;

  const Button({
    Key? key,
    required this.style,
    required this.labelStyle,
    required this.label,
    this.width,
    this.height,
    this.onPressed,
    this.outlined = false,
  }) : super(key: key);

  Button.primary({
    super.key,
    required this.label,
    this.width,
    this.height,
    this.onPressed,
  })  : style = ButtonStyles.i.primaryButton,
        labelStyle = TextStyles.i.textSecondaryFontExtraBold,
        outlined = false;

  @override
  Widget build(BuildContext context) {
    final labelText = Text(
      label,
      style: labelStyle,
      overflow: TextOverflow.ellipsis,
    );
    return SizedBox(
        height: height,
        width: width,
        child: outlined
            ? OutlinedButton(
                onPressed: onPressed,
                style: style,
                child: labelText,
              )
            : ElevatedButton(
                onPressed: onPressed,
                style: style,
                child: labelText,
              ));
  }
}
