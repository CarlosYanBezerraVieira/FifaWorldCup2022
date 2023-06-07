import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/pages/my_sticker/widgets/sticker_group_filter.dart';
import 'widgets/sticker_group.dart';
import 'widgets/sticker_status_filter.dart';

class MyStickerPage extends StatelessWidget {
  const MyStickerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Figurinhas'),
      ),
      body: CustomScrollView(slivers: [
        const SliverToBoxAdapter(
          child: Column(
            children: [
              StickerStatusFilter(filterSelected: "Todas"),
              StickerGroupFilter(),
            ],
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) {
            return const StickerGroup();
          },
          childCount: 10,
        ))
      ]),
    );
  }
}
