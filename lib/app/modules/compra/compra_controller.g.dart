// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compra_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CompraController on _CompraControllerBase, Store {
  final _$stateAtom = Atom(name: '_CompraControllerBase.state');

  @override
  ValueNotifier<HomeState> get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ValueNotifier<HomeState> value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
