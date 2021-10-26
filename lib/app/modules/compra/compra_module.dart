import 'package:carrinho_compras/app/modules/carrinho/carrinho_module.dart';
import 'package:carrinho_compras/app/modules/compra/compra_controller.dart';
import 'package:carrinho_compras/app/modules/compra/compra_page.dart';
import 'package:carrinho_compras/app/shared/stores/carrinho/carrinho_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CompraModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => CompraController(i.get<CarrinhoStore>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const CompraPage()),
    ModuleRoute("/carrinho",
        module: CarrinhoModule(), transition: TransitionType.fadeIn),
  ];
}
