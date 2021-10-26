import 'package:carrinho_compras/app/shared/models/carrinho_model/carrinho_model.dart';
import 'package:carrinho_compras/app/shared/models/products/products_model.dart';
import 'package:mobx/mobx.dart';
part 'carrinho_store.g.dart';

class CarrinhoStore = _CarrinhoStoreBase with _$CarrinhoStore;

abstract class _CarrinhoStoreBase with Store {
  var produtosCarrinho = ObservableList<CarrinhoModel>();

  void addProduct(ProductModelRoot product) {
    var index = produtosCarrinho
        .indexWhere((carrinhoModel) => carrinhoModel.produto.id == product.id);

    if (index >= 0) {
      produtosCarrinho.elementAt(index).add();
    } else {
      produtosCarrinho.add(CarrinhoModel(product));
    }
  }

  @computed
  double get total => produtosCarrinho
      .map((item) => item.produto.price * item.quantidadeItems)
      .reduce((value, element) => value + element);
}
