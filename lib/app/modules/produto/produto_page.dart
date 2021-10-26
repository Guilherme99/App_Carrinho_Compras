import 'package:carrinho_compras/app/modules/compra/compra_controller.dart';
import 'package:carrinho_compras/app/shared/models/products/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProdutoPage extends StatefulWidget {
  final String? id;
  final ProductModelRoot product;
  const ProdutoPage({Key? key, required this.id, required this.product})
      : super(key: key);

  @override
  State<ProdutoPage> createState() => _ProdutoPageState();
}

class _ProdutoPageState extends ModularState<ProdutoPage, CompraController> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Produto"),
          leading: Row(
            children: [
              IconButton(
                onPressed: () {
                  Modular.to.pushReplacementNamed("/compra");
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                controller.logoff();
              },
              icon: const Icon(Icons.exit_to_app_outlined),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Modular.to.pushReplacementNamed('/carrinho');
          },
          child: const Icon(Icons.add_shopping_cart_outlined),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
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
                      height: 380.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(15),
                              child: Image.network(
                                widget.product.image,
                                height: 160,
                              )),
                          Container(
                            height: 1,
                            color: Colors.black54,
                          ),
                          Text(
                            widget.product.title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          Text(
                            "R" +
                                String.fromCharCodes(Runes('\u0024')) +
                                " " +
                                widget.product.price.toStringAsFixed(2),
                            style: const TextStyle(fontSize: 18),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                controller.addProductCarrinho(widget.product);
                                Modular.to.pushNamed("/carrinho");
                              },
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(250, 40),
                                  primary: Colors.blue),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Adicionar Produto ",
                                  ),
                                  Icon(Icons.add),
                                ],
                              ))
                        ],
                      ),
                    ),
                    Container(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.all(10.0),
                color: Colors.white,
                height: 280.0,
                width: MediaQuery.of(context).size.width / 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Descrição:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          textBaseline: TextBaseline.alphabetic),
                    ),
                    Container(
                      height: 10,
                    ),
                    Text(
                      widget.product.description,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                    Container(
                      height: 20,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
