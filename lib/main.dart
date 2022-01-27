import 'package:catalog_app/screens/cart_page.dart';
import 'package:catalog_app/screens/home_screen.dart';
import 'package:catalog_app/store/store.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:velocity_x/velocity_x.dart';

void main() async {
  await GetStorage.init();
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      themeMode: ThemeMode.system,
      title: 'Catalog App',
      home: const HomePage(),
      routes: {MyRoutes.cartRoute: (context) => const CartPage()},
    );
  }
}
