import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';
import 'package:fwc_album_app/app/core/ui/widgets/rounded_button.dart';

import '../../core/ui/styles/button_styles.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('SplashPage'),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              style: ButtonStyles.i.primaryButton,
              onPressed: () {},
              child: const Text('Salvar'),
            ),
          ),
          Center(
            child: OutlinedButton(
              style: ButtonStyles.i.primaryOutlineButton,
              onPressed: () {},
              child: const Text('Salvar'),
            ),
          ),
          const TextField(),
          Button(
            onPressed: () {},
            style: context.buttonStyles.yellowOutlineButton,
            labelStyle: context.textStyle.textSecondaryFontExtraBold,
            label: "Criar",
          ),
          Button.primary(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 30,
            onPressed: () {},
            label: "Criar",
          ),
          RoundedButton(icon: Icons.add, onPressed: () {})
        ],
      ),
    );
  }
}
