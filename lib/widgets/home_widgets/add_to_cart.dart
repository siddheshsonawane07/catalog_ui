import 'package:catalog_app/models/cart.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/store/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddtoCart extends StatelessWidget {
  Item catalog;
  AddtoCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;

    bool isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            AddMutation(catalog);
          }
        },
        style: context.theme.elevatedButtonTheme.style,
        child: isInCart
            ? const Icon(Icons.done)
            : const Icon(CupertinoIcons.cart_badge_plus));
  }
}
