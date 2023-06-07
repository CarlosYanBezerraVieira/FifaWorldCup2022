import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';

class StickerStatusFilter extends StatelessWidget {
  final String filterSelected;

  const StickerStatusFilter({
    Key? key,
    required this.filterSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        spacing: 5,
        alignment: WrapAlignment.center,
        children: [
          Button(
            width: MediaQuery.of(context).size.width *.3,
              style: context.buttonStyles.yellowButton,
              labelStyle: context.textStyle.textSecondaryFontMedium.copyWith(
                color: context.colors.primary,
              ),
              label: 'Todas',
              onPressed: () {}),
                Button(
                   width: MediaQuery.of(context).size.width *.3,
              style: context.buttonStyles.primaryButton,
              labelStyle: context.textStyle.textSecondaryFontMedium,
              label: 'Faltando',
              onPressed: () {}),
                  Button(
                      width: MediaQuery.of(context).size.width *.3,
              style: context.buttonStyles.primaryButton,
              labelStyle: context.textStyle.textSecondaryFontMedium,
              label: 'Repetidas',
              onPressed: () {}),
        ],
      ),
    );
  }
}
