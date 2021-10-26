import 'package:carrinho_compras/app/shared/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key? key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  ReactionDisposer? disposer;

  void status() {
    disposer = autorun((_) {
      final auth = Modular.get<AuthController>();
      Future.delayed(const Duration(milliseconds: 2000), () {
        auth.status = AuthStatus.logoff;
        if (auth.status == AuthStatus.login) {
          Modular.to.pushReplacementNamed('/compra');
        } else if (auth.status == AuthStatus.logoff) {
          Modular.to.pushReplacementNamed('/login');
        } 
      });
    });
  }

  @override
  void initState() {
    super.initState();
    status();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: const Center(
        child: CircularProgressIndicator(),
      ), /* Observer(
        builder: (context) => Text('${store.counter}'),
      ), */
    );
  }
}
