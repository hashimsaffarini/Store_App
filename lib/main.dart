import 'package:flutter/material.dart';
import 'package:store_app/views/pages/home_page.dart';
import 'package:store_app/views/pages/update_product_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        HomePage.homePageId: (context) => const HomePage(),
        UpdateProductPage.updateProductPageId: (context) =>
            const UpdateProductPage(),
      },
      initialRoute: HomePage.homePageId,
    );
  }
}
