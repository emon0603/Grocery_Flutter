import 'package:flutter/material.dart';

import '../ModelClass/Category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(

      width: 160, // card width
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: category.bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          Image.asset(
            category.imagePath,
            height: 40,
            width: 40,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              category.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),






    );
  }
}
