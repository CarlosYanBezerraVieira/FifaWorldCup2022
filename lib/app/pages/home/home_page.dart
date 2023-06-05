import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/routes/routes_app.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
      ),
      body: Center(
        child: Button.primary(
            label: "logout",
            onPressed: () async {
              final sp = await SharedPreferences.getInstance();
              sp.clear();
              // ignore: use_build_context_synchronously
              Navigator.of(context).pushNamedAndRemoveUntil(
                  // ignore: use_build_context_synchronously
                  context.routes.login, (route) => false);
            }),
      ),
    );
  }
}
