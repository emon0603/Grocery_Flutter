import 'dart:math';
import 'package:flutter/material.dart';
import 'package:groceries/ModelClass/Category.dart';

// Define your predefined colors list
final List<Color> predefinedColors = [
  Colors.lightBlue.shade100,
  Colors.greenAccent.shade100,
  Colors.orange.shade100,
  Colors.pink.shade100,
  Colors.purple.shade100,
  Colors.teal.shade100,
  Colors.amber.shade100,
  Colors.cyan.shade100,
  Colors.deepOrange.shade100,
  Colors.indigo.shade100,
  Colors.lime.shade100,
  Colors.red.shade100,
  Colors.blueGrey.shade100,
  Colors.lightGreen.shade100,
  Colors.deepPurple.shade100,
  Colors.yellow.shade100,
  Colors.brown.shade100,
  Colors.blue.shade100,
];


class FindProduct extends StatelessWidget {
  final Category category;

  const FindProduct({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Random _random = Random();

    // Function to get a random predefined color
    Color getRandomPredefinedColor() {
      return predefinedColors[_random.nextInt(predefinedColors.length)];
    }

    return Container(
      width: 180,
      height: 160,
      decoration: BoxDecoration(
        color: getRandomPredefinedColor(), // Use random color here
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey),
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              category.imagePath,
              fit: BoxFit.contain,
            ),
          ),
          Text(
            category.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
