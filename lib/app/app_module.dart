import 'package:carrinho_compras/app/app_controller.dart';
import 'package:carrinho_compras/app/modules/carrinho/carrinho_module.dart';
import 'package:carrinho_compras/app/modules/compra/compra_controller.dart';
import 'package:carrinho_compras/app/modules/login/login_module.dart';
import 'package:carrinho_compras/app/modules/produto/produto_page.dart';
import 'package:carrinho_compras/app/shared/auth/auth_controller.dart';
import 'package:carrinho_compras/app/shared/auth/repositories/auth_repository.dart';
import 'package:carrinho_compras/app/shared/stores/carrinho/carrinho_store.dart';
import 'package:carrinho_compras/app/splash/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:carrinho_compras/app/modules/compra/compra_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => AppController()),
    Bind<AuthRepository>((I) => AuthRepository()),
    Bind((i) => AuthController()),
    Bind((i) => CompraController(i.get<CarrinhoStore>())),
    Bind((i) => CarrinhoStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SplashPage()),
    ChildRoute(
      "/produto/:id",
      child: (_, args) => ProdutoPage(
        id: args.params['id'],
        product: args.data,
      ),
    ),
    ModuleRoute('/login',
        module: LoginModule(), transition: TransitionType.fadeIn),
    ModuleRoute('/compra',
        module: CompraModule(), transition: TransitionType.fadeIn),
    ModuleRoute('/carrinho',
        module: CarrinhoModule(), transition: TransitionType.fadeIn),
  ];
}
