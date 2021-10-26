import 'package:carrinho_compras/app/repositories/api_repository.dart';
import 'package:carrinho_compras/app/shared/auth/auth_controller.dart';
import 'package:carrinho_compras/app/shared/models/products/products_model.dart';
import 'package:carrinho_compras/app/shared/stores/carrinho/carrinho_store.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'compra_controller.g.dart';

class CompraController = _CompraControllerBase with _$CompraController;

abstract class _CompraControllerBase with Store {
  List<ProductModelRoot> filterProd = [];
  List<ProductModelRoot> products = [];
  final CarrinhoStore _carrinhoStore;
  final ProductRepository _repository;

  @observable
  var state = ValueNotifier<HomeState>(HomeState.start);

  _CompraControllerBase(this._carrinhoStore, [ProductRepository? repository])
      : _repository = repository ?? ProductRepository();

  void addProductCarrinho(productModelRoot) {
    _carrinhoStore.addProduct(productModelRoot);
  }

  Future start() async {
    state.value = HomeState.loading;
    try {
      filterProd = await _repository.fetchProducts();
      products = filterProd.where((i) => i.id != 5).toList();
      state.value = HomeState.success;
    } catch (e) {
      state.value = HomeState.error;
      rethrow;
    }
  }

  logoff() {
    Modular.get<AuthController>().logout();
    Modular.to.pushReplacementNamed(Modular.initialRoute);
  }
}

enum HomeState { start, loading, success, error }
