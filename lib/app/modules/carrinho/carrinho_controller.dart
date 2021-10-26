import 'package:carrinho_compras/app/shared/auth/auth_controller.dart';
import 'package:carrinho_compras/app/shared/models/carrinho_model/carrinho_model.dart';
import 'package:carrinho_compras/app/shared/stores/carrinho/carrinho_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'carrinho_controller.g.dart';

class CarrinhoProdutosController = _CarrinhoProdutosControllerBase
    with _$CarrinhoProdutosController;

abstract class _CarrinhoProdutosControllerBase with Store {
  final CarrinhoStore _carrinhoStore;

  _CarrinhoProdutosControllerBase(this._carrinhoStore);

  @computed
  ObservableList<CarrinhoModel> get listaProdutos =>
      _carrinhoStore.produtosCarrinho;

  @computed
  double get total => _carrinhoStore.total;

  logoff() {
    Modular.get<AuthController>().logout();
    Modular.to.pushReplacementNamed(Modular.initialRoute);
  }
}
