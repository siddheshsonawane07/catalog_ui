import 'package:catalog_app/models/cart.dart';
import 'package:catalog_app/store/store.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        title: "Cart".text.bold.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          const Divider(),
          const _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            VxBuilder(
              builder: (BuildContext context, store, VxStatus? status) {
                return "\$${_cart.totalPrice}"
                    .text
                    .xl5
                    .color(context.theme.secondaryHeaderColor)
                    .make();
              },
              mutations: const {RemoveMutation},
            ),
            30.widthBox,
            ElevatedButton(
              style: context.theme.elevatedButtonTheme.style,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Buying not supported yet !"),
                  duration: Duration(seconds: 1),
                ));
              },
              child: "Buy".text.xl2.make(),
            ).wh(100, 50)
          ],
        ).p(20));
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    if (_cart.items.isEmpty) {
      return "Nothing to show".text.xl.makeCentered();
    } else {
      return ListView.builder(
        itemCount: _cart.items.length,
        itemBuilder: (context, index) => ListTile(
          leading: const Icon(Icons.done),
          trailing: IconButton(
            onPressed: () {
              RemoveMutation(_cart.items[index]);
            },
            icon: const Icon(Icons.remove_circle_outline),
          ),
          title: _cart.items[index].name.text.make(),
        ),
      );
    }
  }
}
