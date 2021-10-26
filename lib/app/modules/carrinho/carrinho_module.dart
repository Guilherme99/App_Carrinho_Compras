import 'package:carrinho_compras/app/modules/carrinho/carrinho_controller.dart';
import 'package:carrinho_compras/app/modules/carrinho/carrinho_page.dart';
import 'package:carrinho_compras/app/shared/stores/carrinho/carrinho_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CarrinhoModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => CarrinhoProdutosController(i.get<CarrinhoStore>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const CarrinhoPage()),
  ];
}
