import 'package:carrinho_compras/app/shared/models/carrinho_model/carrinho_model.dart';
import 'package:carrinho_compras/app/shared/stores/carrinho/carrinho_store.dart';
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
}
