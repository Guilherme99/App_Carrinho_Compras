import 'package:carrinho_compras/app/modules/compra/compra_controller.dart';
import 'package:carrinho_compras/app/shared/stores/carrinho/carrinho_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProdutoModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => CompraController(i.get<CarrinhoStore>())),
  ];

  @override
  final List<ModularRoute> routes = [];
}
