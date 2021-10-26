import 'package:carrinho_compras/app/modules/carrinho/carrinho_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CarrinhoPage extends StatefulWidget {
  const CarrinhoPage({Key? key}) : super(key: key);

  @override
  State<CarrinhoPage> createState() => _CarrinhoPageState();
}

class _CarrinhoPageState
    extends ModularState<CarrinhoPage, CarrinhoProdutosController> {
  widgetAmount() {
    return controller.listaProdutos.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Ooops! 😓",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Não há nada aqui! Adicione algum produto! 🤗",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              MaterialButton(
                onPressed: () {
                  Modular.to.pushReplacementNamed('/compra');
                },
                height: 45,
                padding: const EdgeInsets.symmetric(horizontal: 50),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.orange.shade400,
                child: Text(
                  "Iniciar compras",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          )
        : Observer(
            builder: (_) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
                border: Border.all(width: 1.0, color: const Color(0xFFF3F3F3)),
              ),
              margin: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Container(
                      height: 60.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Resumo",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Text("Valor Total:  R" +
                              String.fromCharCodes(Runes('\u0024')) +
                              " " +
                              controller.total
                                  .toStringAsFixed(2)
                                  .replaceAll(".", ","))
                        ],
                      ))
                ],
              ),
            ),
          );
  }

  widgetSuccess() {
    return controller.listaProdutos.isEmpty
        ? Container()
        : Observer(
            builder: (_) => ListView.separated(
              shrinkWrap: true,
              itemCount: controller.listaProdutos.length,
              itemBuilder: (_, i) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  border:
                      Border.all(width: 1.0, color: const Color(0xFFF3F3F3)),
                ),
                margin: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, bottom: 15, left: 0, right: 0),
                              child: Image.network(
                                controller.listaProdutos[i].produto.image,
                                height: 60,
                              )),
                          Container(
                            width: 1,
                            color: Colors.black54,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  controller.listaProdutos[i].produto.title
                                          .split(" ")[0] +
                                      " " +
                                      controller.listaProdutos[i].produto.title
                                          .split(" ")[1] +
                                      " " +
                                      controller.listaProdutos[i].produto.title
                                          .split(" ")[2],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                              Text(
                                "R" +
                                    String.fromCharCodes(Runes('\u0024')) +
                                    controller.listaProdutos[i].produto.price
                                        .toStringAsFixed(2),
                                style: const TextStyle(fontSize: 15),
                              ),
                              Observer(
                                builder: (_) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          if (controller.listaProdutos[i]
                                                  .quantidadeItems >=
                                              1) {
                                            controller.listaProdutos[i]
                                                .remove();
                                          } else {
                                            return;
                                          }
                                        },
                                        icon: const Icon(
                                          Icons.remove,
                                          color: Colors.red,
                                        ),
                                      ),
                                      SizedBox(
                                        child: Text(controller
                                            .listaProdutos[i].quantidadeItems
                                            .toString()),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          controller.listaProdutos[i].add();
                                        },
                                        icon: const Icon(Icons.add,
                                            color: Colors.green),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                width: 15,
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carrinho"),
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                Modular.to.pushNamed("/compra");
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Modular.to.pushReplacementNamed("/home");
            },
            icon: const Icon(Icons.exit_to_app_outlined),
          ),
        ],
      ),
      floatingActionButton: controller.listaProdutos.isEmpty
          ? null
          : FloatingActionButton(
              onPressed: () {
                const AlertDialog(
                    semanticLabel: "Compra finalizada com sucesso!");
              },
              child: const Icon(Icons.check),
              backgroundColor: Colors.blue,
            ),
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: [widgetSuccess(), widgetAmount()],
        ),
      )),
    );
  }
}
