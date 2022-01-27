import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 12),
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            AddtoCart(catalog: catalog).wh(130, 50)
          ],
        ).pOnly(right: 6.0),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h32(context),
            Expanded(
              child: VxArc(
                edge: VxEdge.TOP,
                height: 30.0,
                arcType: VxArcType.CONVEY,
                child: Container(
                  width: context.screenWidth,
                  color: context.cardColor,
                  child: Column(
                    children: [
                      catalog.name.text.xl4
                          .color(context.theme.secondaryHeaderColor)
                          .bold
                          .make(),
                      catalog.desc.text.xl.caption(context).make(),
                      Expanded(
                          child:
                              "Amet etTakimata kasd ipsum consetetur clita et diam, amet eirmod amet amet sit ut amet clita at lorem. Diam lorem sed. adsafdff dfa fd afsdfdsa"
                                  .text
                                  .bodyText2(context)
                                  .make()
                                  .p16()),
                    ],
                  ).py64(),
                ),
              ),
            ),
          ],
        ).p16(),
      ),
    );
  }
}
