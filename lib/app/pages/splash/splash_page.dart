import 'package:flutter/material.dart';

import '../../core/styles/button_styles.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
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
        ],
      ),
    );
  }
}
