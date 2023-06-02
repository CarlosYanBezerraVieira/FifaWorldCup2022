import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/helpers/loader.dart';
import 'package:fwc_album_app/app/core/ui/helpers/messager.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';
import 'package:fwc_album_app/app/core/ui/widgets/rounded_button.dart';

import '../../core/ui/styles/button_styles.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with Loader, Messager {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('SplashPage'),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              style: ButtonStyles.i.primaryButton,
              onPressed: () async {
                showLoader();
                await Future.delayed(const Duration(seconds: 2));
                hideLoader();
              },
              child: const Text('Salvar'),
            ),
          ),
          Center(
            child: OutlinedButton(
              style: ButtonStyles.i.primaryOutlineButton,
              onPressed: () {
                showError(message: 'error');
              },
              child: const Text('Salvar'),
            ),
          ),
          const TextField(),
          Button(
            onPressed: () {
              showInfor(message: 'infor');
            },
            style: context.buttonStyles.yellowOutlineButton,
            labelStyle: context.textStyle.textSecondaryFontExtraBold,
            label: "Criar",
          ),
          Button.primary(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 30,
            onPressed: () {
              showSucess(message: 'sucesso');
            },
            label: "Criar",
          ),
          RoundedButton(icon: Icons.add, onPressed: () {})
        ],
      ),
    );
  }
}
