import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';

class StickerPercentWidget extends StatelessWidget {
  final int percent;
  const StickerPercentWidget({Key? key, required this.percent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: context.colors.grey,
            shape: BoxShape.circle,
          ),
          child: Center(child: Text("$percent", style: context.textStyle.titlePrimaryColor,)),
        ),

        Transform.rotate(
          angle:  -pi /2.5,
          child: SizedBox(
            height: 110,
            width: 110,
            child: CircularProgressIndicator(
              color: Colors.white,
              value: percent/100,
              backgroundColor: Colors.white.withOpacity(0.5),
              strokeWidth: 5,
            ),
          ),
        )
        
      ],
    );
  }
}
