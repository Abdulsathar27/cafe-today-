import 'package:cafebooking/models/products.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final Product product;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onDelete;

  const CartItemWidget({
    super.key,
    required this.product,
    required this.onIncrease,
    required this.onDecrease,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            product.image,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          product.name,
          style: TextStyle(fontWeight: FontWeight.bold,),
          
        ),
        subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(icon: Icon(Icons.remove), onPressed: onDecrease),
            Text(product.quantity.toString()),
            IconButton(icon: Icon(Icons.add), onPressed: onIncrease),
            IconButton(onPressed: onDelete, icon: Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
