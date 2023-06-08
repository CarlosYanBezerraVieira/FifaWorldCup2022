// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';

import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';

class StickerGroup extends StatelessWidget {
  const StickerGroup({super.key});

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
                  child: Image.asset(
                    "assets/images/flags/BRA.png",
                    cacheWidth: (MediaQuery.of(context).size.width * 3).toInt(),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Brasil",
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
              return Sticker(
                index: index,
              );
            },
          ),
        ],
      ),
    );
  }
}

class Sticker extends StatelessWidget {
  final int index;
  const Sticker({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color:
                index % 2 == 0 ? context.colors.primary : context.colors.grey),
        child: Column(
          children: [
            Visibility(
              maintainAnimation: true,
              maintainState: true,
              maintainSize: true,
              visible: index % 2 == 0,
              child: Container(
                padding: const EdgeInsets.all(2),
                alignment: Alignment.topRight,
                child: Text(
                  '1',
                  style: context.textStyle.textSecondaryFontMedium
                      .copyWith(color: context.colors.yellow),
                ),
              ),
            ),
            Text(
              "BRA",
              style: context.textStyle.textSecondaryFontExtraBold.copyWith(
                  color: index % 2 == 0 ? Colors.white : Colors.black),
            ),
            Text(
              "$index",
              style: context.textStyle.textSecondaryFontExtraBold.copyWith(
                  color: index % 2 == 0 ? Colors.white : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}