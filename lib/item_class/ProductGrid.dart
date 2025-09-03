import 'package:flutter/material.dart';

import '../ModelClass/Product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(product.image, fit: BoxFit.contain),
            ),
          ),
          SizedBox(height: 8),
          Text(product.name, style: TextStyle(fontWeight: FontWeight.bold)),
          Text('${product.quantity}, Priceg', style: TextStyle(color: Colors.grey)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$${product.price.toStringAsFixed(2)}',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              CircleAvatar(

                backgroundColor: Colors.green,
                child: Icon(Icons.add, color: Colors.white),
              )
            ],
          ),
        ],
      ),
    );
  }
}