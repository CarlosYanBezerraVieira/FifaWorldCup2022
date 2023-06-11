import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';
import 'package:fwc_album_app/app/core/ui/widgets/rounded_button.dart';

import 'package:fwc_album_app/app/pages/sticker_detail/presenter/sticker_detail_presente.dart';
import 'package:fwc_album_app/app/pages/sticker_detail/view/sticker_detail_view_impl.dart';

class StickerDetailPage extends StatefulWidget {
  final StickerDetailPresente presente;

  const StickerDetailPage({
    Key? key,
    required this.presente,
  }) : super(key: key);

  @override
  State<StickerDetailPage> createState() => _StickerDetailPageState();
}

class _StickerDetailPageState extends StickerDetailViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes Figurinha'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                hasSticker
                    ? "assets/images/sticker.png"
                    : "assets/images/sticker_pb.png",
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$countryCode $stickerNumber",
                      style: context.textStyle.textPrimaryFontBold
                          .copyWith(fontSize: 22),
                    ),
                    const Spacer(),
                    RoundedButton(
                        icon: Icons.remove,
                        onPressed: widget.presente.decrementAmount),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "$amount",
                        style: context.textStyle.textSecondaryFontMedium,
                      ),
                    ),
                    RoundedButton(
                        icon: Icons.add,
                        onPressed: widget.presente.incrementAmount)
                  ],
                ),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 15, bottom: 10),
                  child: Text(
                    countryName,
                    style: context.textStyle.textPrimaryFontRegular,
                  )),
              Button.primary(
                width: MediaQuery.of(context).size.width * .9,
                label: hasSticker ? "Atualizar figurinha" : "Adicionar Figurinha",
                onPressed: widget.presente.saveSticker,
              ),
              Button(
                width: MediaQuery.of(context).size.width * .9,
                style: context.buttonStyles.primaryOutlineButton,
                labelStyle:
                    context.textStyle.textSecondaryFontExtraBoldPrimaryColor,
                label: "Excluir Figurinha",
                onPressed: () {
                  widget.presente.deleteSticker();
                },
                outlined: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
