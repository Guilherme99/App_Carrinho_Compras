import 'package:carrinho_compras/app/modules/compra/compra_controller.dart';
import 'package:carrinho_compras/app/modules/produto/produto_page.dart';
import 'package:carrinho_compras/app/shared/models/products/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CompraPage extends StatefulWidget {
  const CompraPage({Key? key, this.productModelRoot}) : super(key: key);
  final ProductModelRoot? productModelRoot;

  @override
  State<CompraPage> createState() => _CompraPageState();
}

class _CompraPageState extends ModularState<CompraPage, CompraController> {
  _success() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0, bottom: 0.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  "Aproveite nossas ofertas..",
                  style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      color: Colors.black87),
                ),
              ],
            ),
          ),
          Container(
            height: 300,
            padding: const EdgeInsets.only(left: 10.0, top: 30.0, bottom: 40.0),
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: controller.products.length,
              itemBuilder: (_, i) => GestureDetector(
                onTap: () {
                  Modular.to.pushNamed(
                    "/produto/${controller.products[i].id}",
                    arguments: ProductModelRoot(
                        title: controller.products[i].title,
                        price: controller.products[i].price,
                        image: controller.products[i].image,
                        id: controller.products[i].id,
                        category: controller.products[i].category,
                        description: controller.products[i].description),
                  );
                },
                child: Container(
                  width: 160.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    border:
                        Border.all(width: 2.0, color: const Color(0xFFF3F3F3)),
                    /* boxShadow: const [
                                BoxShadow(
                                  color: Colors.blue,
                                  blurRadius: 2.0,
                                  offset: Offset(2.0,2.0)
                                )
                                ]   */
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(15),
                          child: Image.network(
                            controller.products[i].image.toString(),
                            height: 60,
                          )),
                      Text(
                        controller.products[i].title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("R" +
                          String.fromCharCodes(Runes('\u0024')) +
                          " " +
                          controller.products[i].price.toStringAsFixed(2)),
                      ElevatedButton(
                          onPressed: () {
                            controller
                                .addProductCarrinho(controller.products[i]);
                            Modular.to.pushReplacementNamed("/carrinho");
                          },
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(140, 20),
                              primary: Colors.blue),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text("Adicionar"),
                              Icon(Icons.add),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                width: 15,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0.0, bottom: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  "+ Ofertas pra você..",
                  style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      color: Colors.black87),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              border: Border.all(width: 1.0, color: const Color(0xFFF3F3F3)),
              /* boxShadow: const [
                  BoxShadow(
                    color: Colors.blue,
                    blurRadius: 2.0,
                    offset: Offset(2.0,2.0)
                  )
                  ]   */
            ),
            margin: const EdgeInsets.all(10.0),
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: List.generate(controller.products.length, (i) {
                return Center(
                  child: GestureDetector(
                    onTap: () {
                      Modular.to.pushNamed(
                        "/produto/${controller.products[i].id}",
                        arguments: ProductModelRoot(
                            title: controller.products[i].title,
                            price: controller.products[i].price,
                            image: controller.products[i].image,
                            id: controller.products[i].id,
                            category: controller.products[i].category,
                            description: controller.products[i].description),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      width: 200,
                      height: 200.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(15),
                              child: Image.network(
                                controller.products[i].image.toString(),
                                height: 60,
                              )),
                          Text(
                            controller.products[i].title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text("R" +
                              String.fromCharCodes(Runes('\u0024')) +
                              " " +
                              controller.products[i].price.toStringAsFixed(2)),
                          ElevatedButton(
                              onPressed: () {
                                controller
                                    .addProductCarrinho(controller.products[i]);
                                Modular.to.pushReplacementNamed("/carrinho");
                              },
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(140, 20),
                                  primary: Colors.blue),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text("Adicionar"),
                                  Icon(Icons.add),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  _error() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          controller.start();
        },
        child: Text('Tentar Novamente'),
      ),
    );
  }

  _start() {
    return Container();
  }

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.start:
        return _start();
      case HomeState.error:
        return _error();
      case HomeState.loading:
        return _loading();
      case HomeState.success:
        return _success();
      default:
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App de compras"),
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
      body: AnimatedBuilder(
        animation: controller.state,
        builder: (_, Widget? child) => stateManagement(controller.state.value),
      ),
    );
  }
}
