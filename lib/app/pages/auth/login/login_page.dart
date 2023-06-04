import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.colors.primary,
      body: Form(
          child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            'assets/images/background_login.png',
          ),
          fit: BoxFit.cover,
        )),
        child: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate.fixed(
              [
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      (MediaQuery.of(context).size.height > 350 ? .30 : .25),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Center(
                    child: Text(
                      'Login',
                      style: context.textStyle.titleWhite,
                    ),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      label: Text('Email'),
                      floatingLabelBehavior: FloatingLabelBehavior.never),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      label: Text('Senha'),
                      floatingLabelBehavior: FloatingLabelBehavior.never),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Text(
                    'Esqueceu a senha ?',
                    style: context.textStyle.textSecondaryFontMedium
                        .copyWith(color: context.colors.yellow, fontSize: 14),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Button(
                  width: MediaQuery.of(context).size.width * 0.9,
                  onPressed: () {},
                  style: context.buttonStyles.yellowButton,
                  labelStyle:
                      context.textStyle.textSecondaryFontExtraBoldPrimaryColor,
                  label: 'Entrar',
                ),
              ],
            )),
            SliverFillRemaining(
              fillOverscroll: false,
              child: Column(
                children: [
                  const Spacer(),
                  Text.rich(TextSpan(
                      text: 'Não possui uam conta? ',
                      style: context.textStyle.textSecondaryFontMedium
                          .copyWith(color: Colors.white),
                      children: [
                        TextSpan(
                            text: 'Cadastre-se',
                            style: context.textStyle.textSecondaryFontMedium
                                .copyWith(color: context.colors.yellow))
                      ]))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
