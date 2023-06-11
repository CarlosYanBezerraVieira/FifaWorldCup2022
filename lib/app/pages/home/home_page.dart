import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/routes/routes_app.dart';

import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';
import 'package:fwc_album_app/app/pages/home/presenter/home_presenter.dart';
import 'package:fwc_album_app/app/pages/home/view/home_view_impl.dart';
import 'package:fwc_album_app/app/pages/home/widgets/status_tile.dart';

import 'widgets/sticker_percent_widget.dart';

class HomePage extends StatefulWidget {
  final HomePresenter presenter;
  const HomePage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends HomeViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.colors.primary,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: context.colors.primary,
          actions: [
            IconButton(
                onPressed: () {
                  widget.presenter.logout();
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ))
          ],
        ),
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/background.png',
                    ),
                    fit: BoxFit.cover)),
            child: LayoutBuilder(
              builder: (_, constrains) {
                return ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constrains.maxHeight,
                  ),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.only(bottom: 35),
                            child: Image.asset(
                              "assets/images/bola.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          StickerPercentWidget(
                              percent: user?.totalCompletePercente ?? 0),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "${user?.totalStickers ?? 0} Figurinhas",
                            style: context.textStyle.titleWhite,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          StatusTile(
                            label: 'Todas',
                            value: user?.totalAlbum ?? 0,
                            icon: Image.asset(
                              "assets/images/all_icon.png",
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          StatusTile(
                            label: 'Faltando',
                            value: user?.totalComplete ?? 0,
                            icon: Image.asset(
                              "assets/images/missing_icon.png",
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          StatusTile(
                            label: 'Repetidas',
                            value: user?.totalDuplicates ?? 0,
                            icon: Image.asset(
                              "assets/images/repeated_icon.png",
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Button(
                              width: MediaQuery.of(context).size.width * .9,
                              onPressed: () async {
                                await Navigator.of(context)
                                    .pushNamed(context.routes.mySticker);
                                widget.presenter.getUserData();
                              },
                              outlined: true,
                              style: context.buttonStyles.yellowOutlineButton,
                              labelStyle: context
                                  .textStyle.textSecondaryFontExtraBold
                                  .copyWith(color: context.colors.yellow),
                              label: "Minhas figurinhas")
                        ],
                      ),
                    ),
                  ),
                );
              },
            )));
  }
}
