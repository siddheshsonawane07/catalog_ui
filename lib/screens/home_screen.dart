import 'dart:convert';
import 'package:catalog_app/models/cart.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/store/store.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:catalog_app/widgets/home_widgets/catalog_header.dart';
import 'package:catalog_app/widgets/home_widgets/catalog_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
          mutations: const {AddMutation, RemoveMutation},
          builder: (BuildContext context, store, VxStatus? status) =>
              FloatingActionButton(
                backgroundColor:
                    context.theme.floatingActionButtonTheme.backgroundColor,
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.cartRoute);
                },
                child: const Icon(
                  CupertinoIcons.cart,
                  color: Colors.white,
                ),
              ).badge(
                  color: Vx.red500,
                  size: 22,
                  count: _cart.items.length,
                  textStyle: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold))),
      body: Vx.isWeb
          ? Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CatalogHeader(),
                  if (CatalogModel.items != null &&
                      CatalogModel.items!.isNotEmpty)
                    const CatalogList().py16().expand()
                  else
                    const CircularProgressIndicator().centered().expand(),
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CatalogHeader(),
                  if (CatalogModel.items != null &&
                      CatalogModel.items!.isNotEmpty)
                    const CatalogList().py16().expand()
                  else
                    const CircularProgressIndicator().centered().expand(),
                ],
              ),
            ),
    );
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    // await Future.delayed(Duration(seconds: 10));
    // final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
    //api call exhausted
    // final response = await http.get(Uri.parse(url));
    // final catalogJson = response.body;
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }
}
