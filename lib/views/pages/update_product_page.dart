import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/views/widgets/custom_bottom.dart';
import 'package:store_app/views/widgets/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});
  static String updateProductPageId = 'updateProductPage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  bool isLoading = false;
  String? title, description, image;
  int? price;
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as ProductModel;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
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
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        await updateProductMethod(product);
                        print('Product Updated Successfully');
                      } catch (e) {
                        print(e.toString());
                      }
                      setState(() {
                        isLoading = false;
                      });
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Future<void> updateProductMethod(ProductModel product) async {
    await UpdateProduct().updateProduct(
      id: product.id,
      title: title == null ? product.title : title!,
      description: description == null ? product.description : description!,
      image: image == null ? product.imgUrl : image!,
      price: price == null ? product.price.toString() : price!.toString(),
      category: product.category,
    );
  }
}
