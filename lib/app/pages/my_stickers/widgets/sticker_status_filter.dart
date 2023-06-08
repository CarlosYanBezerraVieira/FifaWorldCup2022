import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album_app/app/core/enum/sticker_status_enum.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';
import 'package:fwc_album_app/app/pages/my_stickers/presenter/my_stickers_presenter.dart';

class StickerStatusFilter extends StatelessWidget {
  final StatusFilterEnum filterSelected;

  const StickerStatusFilter({
    Key? key,
    required this.filterSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = context.get<MyStickersPresenter>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        spacing: 5,
        alignment: WrapAlignment.center,
        children: [
          Button(
              width: MediaQuery.of(context).size.width * .3,
              style: filterSelected == StatusFilterEnum.all
                  ? context.buttonStyles.yellowButton
                  : context.buttonStyles.primaryButton,
              labelStyle: filterSelected == StatusFilterEnum.all
                  ? context.textStyle.textSecondaryFontMedium.copyWith(
                      color: context.colors.primary,
                    )
                  : context.textStyle.textSecondaryFontMedium,
              label: StatusFilterEnum.all.label,
              onPressed: () {
                presenter.statusFilter(StatusFilterEnum.all);
              }),
          Button(
              width: MediaQuery.of(context).size.width * .3,
              style: filterSelected == StatusFilterEnum.missing
                  ? context.buttonStyles.yellowButton
                  : context.buttonStyles.primaryButton,
              labelStyle: filterSelected == StatusFilterEnum.missing
                  ? context.textStyle.textSecondaryFontMedium.copyWith(
                      color: context.colors.primary,
                    )
                  : context.textStyle.textSecondaryFontMedium,
              label: StatusFilterEnum.missing.label,
              onPressed: () {
                presenter.statusFilter(StatusFilterEnum.missing);
              }),
          Button(
              width: MediaQuery.of(context).size.width * .3,
              style: filterSelected == StatusFilterEnum.repeated
                  ? context.buttonStyles.yellowButton
                  : context.buttonStyles.primaryButton,
              labelStyle: filterSelected == StatusFilterEnum.repeated
                  ? context.textStyle.textSecondaryFontMedium.copyWith(
                      color: context.colors.primary,
                    )
                  : context.textStyle.textSecondaryFontMedium,
              label: StatusFilterEnum.repeated.label,
              onPressed: () {
                presenter.statusFilter(StatusFilterEnum.repeated);
              }),
        ],
      ),
    );
  }
}
