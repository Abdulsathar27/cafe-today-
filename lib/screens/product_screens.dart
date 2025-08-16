import 'package:cafebooking/data/cart_data.dart';
import 'package:cafebooking/models/products.dart';
import 'package:cafebooking/widgets/productswidgets/add_to_cart_button.dart';
import 'package:cafebooking/widgets/productswidgets/product_description.dart';
import 'package:cafebooking/widgets/productswidgets/product_image.dart';
import 'package:cafebooking/widgets/productswidgets/product_quantity_selector.dart';
import 'package:flutter/material.dart';


class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    double totalPrice = widget.product.price * quantity;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                ProductImage(imagePath: widget.product.image),
                const SizedBox(height: 20),
                ProductQuantitySelector(
                  quantity: quantity,
                  onIncrease: () => setState(() => quantity++),
                  onDecrease: () {
                    if (quantity > 1) {
                      setState(() => quantity--);
                    }
                  },
                ),
                const SizedBox(height: 10),
                ProductDescription(
                  name: widget.product.name,
                  totalPrice: totalPrice,
                  description:
                      "Brewing up your order… just a click away from yum!",
                ),
              ],
            ),
          ),
          AddToCartButton(
            onPressed: () {
              cartItems.add(
                Product(
                  name: widget.product.name,
                  price: widget.product.price,
                  image: widget.product.image,
                  quantity: quantity,
                ),
              );
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
