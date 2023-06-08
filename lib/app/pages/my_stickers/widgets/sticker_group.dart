// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fwc_album_app/app/core/enum/sticker_status_enum.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/models/group_stickers.dart';
import 'package:fwc_album_app/app/models/user_sticker_model.dart';

class StickerGroup extends StatelessWidget {
  final StatusFilterEnum statusFilter;
  final GroupStickers group;
  const StickerGroup({
    Key? key,
    required this.statusFilter,
    required this.group,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 64,
            child: OverflowBox(
              maxWidth: double.infinity,
              maxHeight: double.infinity,
              child: ClipRect(
                child: Align(
                  alignment: const Alignment(0, -0.1),
                  widthFactor: 1,
                  heightFactor: 0.1,
                  child: Image.network(
                    group.flag,
                    cacheWidth: (MediaQuery.of(context).size.width * 3).toInt(),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              group.countryName,
              style: context.textStyle.titleBlack.copyWith(fontSize: 26),
            ),
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final stickerNumber = '${group.stickerStart + index}';
              final stickerList = group.stickers
                  .where((sticker) => sticker.stickerNumber == stickerNumber);
              final sticker = stickerList.isNotEmpty ? stickerList.first : null;

              final stickerWidget = Sticker(
                stickerNumber: stickerNumber,
                sticker: sticker,
                countryCode: group.countryCode,
              );

              if (statusFilter == StatusFilterEnum.all) {
                return stickerWidget;
              } else if (statusFilter == StatusFilterEnum.missing) {
                if (sticker == null) {
                  return stickerWidget;
                }
              } else if (statusFilter == StatusFilterEnum.repeated) {
                if (sticker != null && sticker.duplicate > 0) {
                  return stickerWidget;
                }
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}

class Sticker extends StatelessWidget {
  final String stickerNumber;

  final String countryCode;
  final UserStickerModel? sticker;
  const Sticker({
    Key? key,
    required this.stickerNumber,
    required this.countryCode,
    required this.sticker,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: (sticker?.duplicate ?? 0) > 0
                ? context.colors.primary
                : context.colors.grey),
        child: Column(
          children: [
            Visibility(
              maintainAnimation: true,
              maintainState: true,
              maintainSize: true,
              visible: sticker != null,
              child: Container(
                padding: const EdgeInsets.all(2),
                alignment: Alignment.topRight,
                child: Text(
                  sticker?.duplicate.toString() ?? '',
                  style: context.textStyle.textSecondaryFontMedium
                      .copyWith(color: context.colors.yellow),
                ),
              ),
            ),
            Text(
              countryCode,
              style: context.textStyle.textSecondaryFontExtraBold.copyWith(
                  color: sticker != null ? Colors.white : Colors.black),
            ),
            Text(
              stickerNumber,
              style: context.textStyle.textSecondaryFontExtraBold.copyWith(
                  color: sticker != null ? Colors.white : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
