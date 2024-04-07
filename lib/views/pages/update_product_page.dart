import 'package:flutter/material.dart';
import 'package:store_app/views/widgets/custom_bottom.dart';
import 'package:store_app/views/widgets/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});
  static String updateProductPageId = 'updateProductPage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? title, description, image;
  int? price;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'Update Product',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),
                CustomTextFormFiled(
                  onChanged: (value) {
                    title = value;
                  },
                  hintText: 'Product Name',
                ),
                const SizedBox(height: 20),
                CustomTextFormFiled(
                  input: TextInputType.number,
                  hintText: 'Product Price',
                  onChanged: (value) {
                    price = int.parse(value);
                  },
                ),
                const SizedBox(height: 20),
                CustomTextFormFiled(
                  hintText: 'Product Description',
                  onChanged: (value) {
                    description = value;
                  },
                ),
                const SizedBox(height: 20),
                CustomTextFormFiled(
                  hintText: 'Product Image',
                  onChanged: (value) {
                    image = value;
                  },
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'Update Product',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ));
  }
}
