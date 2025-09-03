import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:groceries/utils/AppColors.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../ModelClass/Category.dart';
import '../ModelClass/Product.dart';
import '../item_class/CategoryCard.dart';
import '../item_class/ProductGrid.dart';
import '../others/DetailsProduct.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  String _location = "Location fetching...";

  Future<void> _getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check service
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _location = "Location service is disabled!";
      });
      return;
    }

    // Check permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _location = "Location permission denied!";
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _location = "Location permission permanently denied!";
      });
      return;
    }

    // Get coordinates
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Convert to address
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    Placemark place = placemarks[0];

    setState(() {
      _location = "${place.locality}, ${place.country}";
    });
  }

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  final List<String> imgList = const [
    'images/ic_banner.png',
    'images/ic_item1.png',
    'images/ic_item2.png',
  ];



  final List<Product> products = [
    Product(
      name: 'Organic Bananas',
      quantity: '7pcs',
      image: 'images/ic_offer.png',
      price: 1000,
    ),
    Product(
      name: 'Red Apple',
      quantity: '1kg',
      image: 'images/ic_item1.png',
      price: 1000,
    ),

    Product(
      name: 'Red Apple',
      quantity: '1kg',
      image: 'images/ic_item3.png',
      price: 1000,
    ),
    Product(
      name: 'Red Apple',
      quantity: '1kg',
      image: 'images/ic_item2.png',
      price: 1000,
    ),
    // আরও প্রোডাক্ট চাইলে এখানে অ্যাড করো
  ];

  List<Category> categories = [
    Category(name: 'Pulses', imagePath: 'images/ic_offer.png', bgColor: Color(0xFFFFF3E0)),

    Category(name: 'Rice', imagePath: 'images/ic_offer.png', bgColor: Color(0xFFE0F2F1)),
    Category(name: 'Pulses', imagePath: 'images/ic_offer.png', bgColor: Color(0xFFFFF3E0)),
    Category(name: 'Rice', imagePath: 'images/ic_offer.png', bgColor: Color(0xFFE0F2F1)),
    // আরও চাইলে এখানে অ্যাড করো
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        
        child: Scrollbar(
          
            thumbVisibility: false, // scrollbar always invisible
            thickness: 0,

            child: SingleChildScrollView(
            child: Container(

              child: Stack(
                children: [



                  Column(
                    children: [
                      Image.asset(
                        "images/icons/ic_logo.png",
                        height: 50,
                        width: 50,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on, color: Colors.black),
                          SizedBox(width: 10),
                          Text(_location),
                        ],
                      ),
                      SizedBox(height: 10),

                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10.0,
                          left: 16,
                          right: 16,
                        ),
                        child: TextField(
                          onChanged: (value) {
                            print("Searching: $value");
                          },
                          decoration: InputDecoration(
                            hintText: "Search...",
                            prefixIcon: Icon(
                              Icons.search,
                              size: 20,
                            ), // icon o choto
                            isDense: true, // height komate help kore
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 12,
                            ), // aro choto
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                          style: TextStyle(fontSize: 14), // text o choto hobe
                        ),
                      ),

                      SizedBox(height: 10.h),

                      CarouselSlider(
                        options: CarouselOptions(
                          height: 130.0.h,
                          autoPlay: true,
                          enlargeCenterPage: true,
                        ),
                        items: imgList
                            .map(
                              (item) => Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    item,
                                    fit: BoxFit.none,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),

                      SizedBox(height: 20.h),


                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.baseline, // bottom alignment
                          textBaseline: TextBaseline.alphabetic,           // important for baseline
                          children: [
                            Text(
                              "Exclusive Offer",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "See all",
                              style: TextStyle(
                                fontSize: 12.sp,      // slightly smaller than main text
                                fontWeight: FontWeight.bold,
                                color: AppColors.splash_color,  // green color like image
                              ),
                            ),
                          ],
                        ),

                      ),

                      SizedBox(height: 10.h),

                      SizedBox(
                        height: 200, // Horizontal GridView height fixed করতে হবে
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal, // 👉 horizontal scroll
                            itemCount: products.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1, // 👉 একটিই row থাকবে
                              childAspectRatio: 3 / 2, // 👉 item shape adjust (experiment করে ঠিক করো)
                              mainAxisSpacing: 10, // 👉 item গুলোর মাঝে gap
                            ),
                            itemBuilder: (context, index) {
                              final product = products[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsProduct(
                                        product: products[index], // 👉 ক্লিককৃত প্রোডাক্ট পাঠানো হচ্ছে
                                      ),
                                    ),
                                  );
                                },
                                child: ProductCard(
                                  product: products[index],
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      SizedBox(height: 10.h),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.baseline, // bottom alignment
                          textBaseline: TextBaseline.alphabetic,           // important for baseline
                          children: [
                            Text(
                              "Best Selling",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "See all",
                              style: TextStyle(
                                fontSize: 12.sp,      // slightly smaller than main text
                                fontWeight: FontWeight.bold,
                                color: AppColors.splash_color,  // green color like image
                              ),
                            ),
                          ],
                        ),

                      ),

                      SizedBox(height: 10.h),

                      SizedBox(
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: products.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              childAspectRatio: 3 / 2,
                              mainAxisSpacing: 10,
                            ),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsProduct(
                                        product: products[index], // 👉 ক্লিককৃত প্রোডাক্ট পাঠানো হচ্ছে
                                      ),
                                    ),
                                  );
                                },
                                child: ProductCard(
                                  product: products[index],
                                ),
                              );
                            },
                          ),
                        ),
                      ),




                      SizedBox(height: 10.h),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.baseline, // bottom alignment
                          textBaseline: TextBaseline.alphabetic,           // important for baseline
                          children: [
                            Text(
                              "Groceries",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "See all",
                              style: TextStyle(
                                fontSize: 12.sp,      // slightly smaller than main text
                                fontWeight: FontWeight.bold,
                                color: AppColors.splash_color,  // green color like image
                              ),
                            ),
                          ],
                        ),

                      ),

                      SizedBox(height: 10.h),

                      SizedBox(
                        height: 80,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          itemBuilder: (context, index) {
                            //return CategoryCard(category: categories[index]);

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsProduct(
                                      product: products[index], // 👉 ক্লিককৃত প্রোডাক্ট পাঠানো হচ্ছে
                                    ),
                                  ),
                                );
                              },
                              child: CategoryCard(
                                category: categories[index],
                              ),
                            );



                          },
                        ),
                      ),





                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
