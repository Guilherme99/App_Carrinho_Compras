// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carrinho_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CarrinhoProdutosController on _CarrinhoProdutosControllerBase, Store {
  Computed<ObservableList<CarrinhoModel>>? _$listaProdutosComputed;

  @override
  ObservableList<CarrinhoModel> get listaProdutos =>
      (_$listaProdutosComputed ??= Computed<ObservableList<CarrinhoModel>>(
              () => super.listaProdutos,
              name: '_CarrinhoProdutosControllerBase.listaProdutos'))
          .value;
  Computed<double>? _$totalComputed;

  @override
  double get total => (_$totalComputed ??= Computed<double>(() => super.total,
          name: '_CarrinhoProdutosControllerBase.total'))
      .value;

  @override
  String toString() {
    return '''
listaProdutos: ${listaProdutos},
total: ${total}
    ''';
  }
}
