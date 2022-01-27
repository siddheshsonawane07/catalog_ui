import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/screens/home_detail_page.dart';
import 'package:catalog_app/widgets/home_widgets/add_to_cart.dart';
import 'package:catalog_app/widgets/home_widgets/catalog_image.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Vx.isWeb
        ? GridView.builder(
            shrinkWrap: true,
            itemCount: CatalogModel.items?.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items![index];
              return InkWell(
                child: CatalogItem(catalog: catalog),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeDetailPage(catalog: catalog),
                    )),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20.0),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: CatalogModel.items?.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items![index];
              return InkWell(
                child: CatalogItem(catalog: catalog).py0(),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeDetailPage(catalog: catalog),
                    )),
              );
            }).p(0);
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children2 = [
      Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImage(image: catalog.image)),
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          catalog.name.text.lg
              .color(context.theme.secondaryHeaderColor)
              .bold
              .make(),
          catalog.desc.text.make(),
          10.heightBox,
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$${catalog.price}".text.bold.xl.make(),
              AddtoCart(
                catalog: catalog,
              )
            ],
          )
        ],
      ).p(context.isMobile ? 5 : 16))
    ];
    return VxBox(
            child: context.isMobile
                ? Row(
                    children: children2,
                  )
                : Column(
                    children: children2,
                  ))
        .color(context.cardColor)
        .rounded
        .square(150)
        .make()
        .py12();
  }
}
