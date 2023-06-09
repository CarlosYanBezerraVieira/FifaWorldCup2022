import 'package:flutter/widgets.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album_app/app/pages/sticker_detail/presenter/sticker_detail_presente.dart';
import 'package:fwc_album_app/app/pages/sticker_detail/presenter/sticker_detail_presente_impl.dart';
import 'package:fwc_album_app/app/pages/sticker_detail/sticker_detail_page.dart';

class StickerDetailRoute extends FlutterGetItPageRoute {
  const StickerDetailRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
    Bind.lazySingleton<StickerDetailPresente>((i) => StickerDetailPresenteImpl())
  ];

  @override
  WidgetBuilder get page => (context) =>  StickerDetailPage(presente: context.get(),) ;
}
