import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:groceries/item_class/FindProduct.dart';

import '../ModelClass/Category.dart';
import '../ModelClass/Product.dart';
import '../item_class/ProductGrid.dart';
import '../others/DetailsProduct.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}



class _ExploreState extends State<Explore> {


  List<Category> categories = [
    Category(name: 'Pulses', imagePath: 'images/ic_offer.png', bgColor: Color(0xFFFFF3E0)),
    Category(name: 'Rice', imagePath: 'images/ic_offer.png', bgColor: Color(0xFFE0F2F1)),
    Category(name: 'Pulses', imagePath: 'images/ic_offer.png', bgColor: Color(0xFFFFF3E0)),
    Category(name: 'Rice', imagePath: 'images/ic_offer.png', bgColor: Color(0xFFE0F2F1)),
    Category(name: 'Pulses', imagePath: 'images/ic_offer.png', bgColor: Color(0xFFFFF3E0)),
    Category(name: 'Rice', imagePath: 'images/ic_offer.png', bgColor: Color(0xFFE0F2F1)),
    Category(name: 'Pulses', imagePath: 'images/ic_offer.png', bgColor: Color(0xFFFFF3E0)),
    Category(name: 'Rice', imagePath: 'images/ic_offer.png', bgColor: Color(0xFFE0F2F1)),
    // আরও চাইলে এখানে অ্যাড করো
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Find Products", style: TextStyle(color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.bold)),
        centerTitle: true,
        automaticallyImplyLeading: false, // ✅ back arrow remove
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Column(
            children: [
              // ✅ Search bar
              TextField(
                onChanged: (value) {
                  print("Searching: $value");
                },
                decoration: InputDecoration(
                  hintText: "Search...",
                  prefixIcon: Icon(
                    Icons.search,
                    size: 20,
                  ),
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 12,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                style: TextStyle(fontSize: 14),
              ),

              const SizedBox(height: 10), // search bar & grid এর মধ্যে gap

              // ✅ GridView নিচে
              Expanded(
                child: GridView.builder(
                  itemCount: categories.length, // use categories list
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 8 / 9,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return GestureDetector(
                      onTap: () {
                        // Navigate to a category page
                       /* Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryDetails(
                              category: category,
                            ),
                          ),
                        );*/
                      },
                      child: FindProduct(
                        category: category, // pass Category here
                      ),
                    );
                  },
                ),

              ),
            ],
          ),
        ),
      ),



    );

  }
}
