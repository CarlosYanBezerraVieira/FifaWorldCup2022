import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';
import 'package:fwc_album_app/app/pages/auth/register/presenter/register_presenter.dart';
import 'package:fwc_album_app/app/pages/auth/register/view/register_view_impl.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  final RegisterPresenter presenter;
  const RegisterPage({super.key, required this.presenter});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends RegisterViewImpl {
  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final confirmPasswordEC = TextEditingController();

  @override
  void dispose() {
    nameEC.dispose();
    emailEC.dispose();
    passwordEC.dispose();
    confirmPasswordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 106.82,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/bola.png'))),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Cadastrar Usuário',
                  style: context.textStyle.titleBlack,
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameEC,
                        validator: Validatorless.required("Obrigatório"),
                        decoration: const InputDecoration(
                            label: Text('Nome Completo*')),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: emailEC,
                        validator: Validatorless.multiple([
                          Validatorless.required("Obrigatório"),
                          Validatorless.email('E-mail inválido')
                        ]),
                        decoration:
                            const InputDecoration(label: Text('Email*')),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: passwordEC,
                        obscureText: true,
                        validator: Validatorless.multiple([
                          Validatorless.required("Obrigatório"),
                          Validatorless.min(
                              6, "Senha deve conter pelo menos 6 caracteres")
                        ]),
                        decoration:
                            const InputDecoration(label: Text('Senha*')),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: confirmPasswordEC,
                        obscureText: true,
                        validator: Validatorless.multiple([
                          Validatorless.required("Obrigatório"),
                          Validatorless.min(
                              6, "Senha deve conter pelo menos 6 caracteres"),
                          Validatorless.compare(
                              passwordEC, 'As senhas não coincidem'),
                        ]),
                        decoration: const InputDecoration(
                            label: Text('Confirmar senha*')),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Button.primary(
                        onPressed: () {
                          final formValid =
                              formKey.currentState?.validate() ?? false;
                          if (formValid) {
                            showLoader();
                            widget.presenter.register(
                              name: nameEC.text,
                              email: emailEC.text,
                              password: passwordEC.text,
                              confirmPassword: confirmPasswordEC.text,
                            );
                          }
                        },
                        width: MediaQuery.of(context).size.width * 0.9,
                        label: 'Cadastrar',
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
