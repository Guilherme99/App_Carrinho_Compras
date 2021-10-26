import 'package:carrinho_compras/app/shared/models/products/products_model.dart';
import 'package:mobx/mobx.dart';
part 'carrinho_model.g.dart';

class CarrinhoModel = _CarrinhoModelBase with _$CarrinhoModel;

abstract class _CarrinhoModelBase with Store {
  final ProductModelRoot produto;
  static int qtdItems = 1;

  _CarrinhoModelBase(this.produto);

  @observable
  int _quantidade = qtdItems;

  @action
  void add() {
    _quantidade++;
  }

  @action
  void remove() {
    _quantidade--;
  }

  @computed
  int get quantidadeItems => _quantidade;
}
