import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/helpers/loader.dart';
import 'package:fwc_album_app/app/core/ui/helpers/messager.dart';
import 'package:fwc_album_app/app/pages/sticker_detail/sticker_detail_page.dart';

import './sticker_detail_view.dart';

abstract class StickerDetailViewImpl extends State<StickerDetailPage>
    with Loader, Messager
    implements StickerDetailView {
  bool hasSticker = false;
  String countryCode = "";
  String stickerNumber = "";
  String countryName = "";

  int amount = 0;

  @override
  void initState() {
    widget.presente.view = this;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showLoader();
      var arguments = ModalRoute.of(context)?.settings.arguments;
      if (arguments != null && arguments is Map<String, dynamic>) {
        widget.presente.load(
          countryCode: arguments['countryCode']!,
          stickerNumber: arguments['stickerNumber']!,
          countryName: arguments['countryName']!,
          stickerUser: arguments['stickerUser'],
        );
      } else {
        hideLoader();
        Navigator.of(context).pop();
        showError(message: "Não foi possivel carregar a figurinha");
      }
    });
    super.initState();
  }

  @override
  void screenLoader(
    bool hasSticker,
    String countryCode,
    String stickerNumber,
    String countryName,
    int amount,
  ) {
    hideLoader();
    setState(() {
      this.hasSticker = hasSticker;
      this.countryCode = countryCode;
      this.stickerNumber = stickerNumber;
      this.countryName = countryName;
      this.amount = amount;
    });
  }

  @override
  void updateAmount(int amount) {
    setState(() {
      this.amount = amount;
    });
  }

  @override
  void saveSucess() {
    hideLoader();
    Navigator.of(context).pop();
  }
  @override
  void error(String message) {
    hideLoader();
    showError(message:message );
  }
}
