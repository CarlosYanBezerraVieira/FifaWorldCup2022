import 'package:flutter/material.dart';
import 'package:flutter_awesome_select/flutter_awesome_select.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/pages/my_stickers/presenter/my_stickers_presenter.dart';

class StickerGroupFilter extends StatefulWidget {
  final Map<String, String> countries;
  const StickerGroupFilter({
    Key? key,
    required this.countries,
  }) : super(key: key);

  @override
  State<StickerGroupFilter> createState() => _StickerGroupFilterState();
}

class _StickerGroupFilterState extends State<StickerGroupFilter> {
  List<String>? selected = [];
  @override
  Widget build(BuildContext context) {
    final presenter = context.get<MyStickersPresenter>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SmartSelect<String>.multiple(
        title: 'Filtro',
        tileBuilder: (context, state) {
          return InkWell(
            onTap: () {
              state.showModal();
            },
            child: _StickerGroupTile(
              clearCallback: () {
                setState(() {
                  selected = null;
                });
                presenter.countryFilter(selected);
              },
              label: state.selected.title?.join(", ") ?? "Filtro",
            ),
          );
        },
        selectedValue: selected ?? [],
        onChange: (selectedValue) {
          setState(() {
            selected = selectedValue.value;
          });

          presenter.countryFilter(selected);
        },
        choiceItems: S2Choice.listFrom(
            source: widget.countries.entries
                .map(
                  (e) => {
                    "value": e.key,
                    "title": e.value,
                  },
                )
                .toList(),
            value: ((_, item) => item['value'] ?? ""),
            title: (_, item) => item['title'] ?? ""),
        choiceType: S2ChoiceType.switches,
        modalType: S2ModalType.bottomSheet,
        choiceGrouped: true,
        modalFilter: false,
        placeholder: "",
      ),
    );
  }
}

class _StickerGroupTile extends StatelessWidget {
  final String label;
  final VoidCallback clearCallback;

  const _StickerGroupTile({
    Key? key,
    required this.label,
    required this.clearCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: const Color(0xFFF0F0F0),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Icon(
              Icons.filter_list,
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Text(
                label,
                style: context.textStyle.textSecondaryFontRegular
                    .copyWith(fontSize: 11),
              ),
            ),
            InkWell(
              onTap: clearCallback,
              child: const Icon(Icons.clear),
            )
          ],
        ),
      ),
    );
  }
}
