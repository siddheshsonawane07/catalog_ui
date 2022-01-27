import 'package:catalog_app/models/catalog.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  // ignore: unnecessary_null_comparison
  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price}",
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.purple),
        ),
      ),
    );
  }
}
