import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/routes/routes_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';
import 'package:fwc_album_app/app/pages/auth/login/presenter/login_presenter.dart';
import 'package:fwc_album_app/app/pages/auth/login/view/login_view_impl.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  final LoginPresenter presenter;
  const LoginPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends LoginViewImpl {
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.colors.primary,
      body: Form(
          key: formKey,
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
                          (MediaQuery.of(context).size.height > 350
                              ? .30
                              : .25),
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
                      controller: emailEC,
                      validator: Validatorless.multiple([
                        Validatorless.required('Obrigatório'),
                        Validatorless.email("E-mail inválido"),
                      ]),
                      decoration:  InputDecoration(
                          label: const Text('Email'),
                            errorStyle:context.textStyle.labelTextFild.copyWith(color: Colors.white),
                          floatingLabelBehavior: FloatingLabelBehavior.never),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: passwordEC,
                      validator: Validatorless.multiple([
                        Validatorless.required('Obrigatório'),
                        Validatorless.min(
                            6, "Senha deve conter pelo menos 6 caracteres"),
                      ]),
                      decoration:  InputDecoration(
                          label: const Text('Senha'),
                          errorStyle:context.textStyle.labelTextFild.copyWith(color: Colors.white),
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
                            .copyWith(
                                color: context.colors.yellow, fontSize: 14),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Button(
                      width: MediaQuery.of(context).size.width * 0.9,
                      onPressed: () {
                        final valid = formKey.currentState?.validate() ?? false;
                        if (valid) {
                          showLoader();
                          widget.presenter.login(
                            email: emailEC.text,
                            password: passwordEC.text,
                          );
                        }
                      },
                      style: context.buttonStyles.yellowButton,
                      labelStyle: context
                          .textStyle.textSecondaryFontExtraBoldPrimaryColor,
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
                                    .copyWith(color: context.colors.yellow),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigator.of(context)
                                      .pushNamed(context.routes.register))
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
