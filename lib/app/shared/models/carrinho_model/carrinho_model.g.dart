// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carrinho_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CarrinhoModel on _CarrinhoModelBase, Store {
  Computed<int>? _$quantidadeItemsComputed;

  @override
  int get quantidadeItems =>
      (_$quantidadeItemsComputed ??= Computed<int>(() => super.quantidadeItems,
              name: '_CarrinhoModelBase.quantidadeItems'))
          .value;

  final _$_quantidadeAtom = Atom(name: '_CarrinhoModelBase._quantidade');

  @override
  int get _quantidade {
    _$_quantidadeAtom.reportRead();
    return super._quantidade;
  }

  @override
  set _quantidade(int value) {
    _$_quantidadeAtom.reportWrite(value, super._quantidade, () {
      super._quantidade = value;
    });
  }

  final _$_CarrinhoModelBaseActionController =
      ActionController(name: '_CarrinhoModelBase');

  @override
  void add() {
    final _$actionInfo = _$_CarrinhoModelBaseActionController.startAction(
        name: '_CarrinhoModelBase.add');
    try {
      return super.add();
    } finally {
      _$_CarrinhoModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove() {
    final _$actionInfo = _$_CarrinhoModelBaseActionController.startAction(
        name: '_CarrinhoModelBase.remove');
    try {
      return super.remove();
    } finally {
      _$_CarrinhoModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
quantidadeItems: ${quantidadeItems}
    ''';
  }
}
