import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceries/ModelClass/Product.dart';
import 'package:groceries/utils/AppColors.dart';

class DetailsProduct extends StatefulWidget {
  final Product product; // ✅ declare variable

  const DetailsProduct({super.key, required this.product}); // ✅ constructor এ initialize

  @override
  State<DetailsProduct> createState() => _DetailsProductState();
}


class _DetailsProductState extends State<DetailsProduct> {

  int itemCount = 1; // শুরুতে 1 থাকবে
  late double price; // প্রতি item এর দাম
  bool isFavorite = false; // initially not favorite


  final List<String> imgList = const [
    'images/ic_banner.png',
    'images/ic_item1.png',
    'images/ic_item2.png',
  ];



  // Menu items data
  final List<Map<String, dynamic>> menuItems = [
    { "title": "Product Details"},
    { "title": "Nutritions"},
    { "title": "Reviews"},
    { "title": "Similar Products"},

  ];

  @override
  void initState() {
    super.initState();
    price = widget.product.price; // product থেকে price নেওয়া হলো
  }



  @override
  Widget build(BuildContext context) {

    double totalPrice = itemCount * price;


    return Scaffold(



      body: Container(

        child: Stack(

          children: [



            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [


                //todo: image slider
                Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.gray_color,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),  // শুধু নিচের বাম পাশে radius
                        bottomRight: Radius.circular(40), // শুধু নিচের ডান পাশে radius
                      ),
                    ),

                    child: Center(

                      child:
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: CarouselSlider(
                          options: CarouselOptions(
                            height: 250.0.h,
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
                      ),

                    )



                ),


                Padding(
                  padding: const EdgeInsets.only(left:  16.0, right: 16.0, top: 16.0),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [

                      Text("Naturel Red Apply", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      // Favorite Icon
                      IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite; // toggle favorite
                          });
                        },
                      ),
                    ],

                  ),


                ),

                Padding(
                  padding: const EdgeInsets.only(left:  16.0, right: 16.0),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [

                      Text("1kg, Price")
                    ],

                  ),


                ),

                Padding(
                  padding: const EdgeInsets.only(left:  16.0, right: 16.0, top: 16.0),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [

                    Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Minus Button
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (itemCount > 1) {
                              itemCount--; // 1 এর নিচে নামবে না
                            }
                          });
                        },
                      ),

                      SizedBox(width: 10),

                      // Count Show
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          child: Text(
                            itemCount.toString(),
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      SizedBox(width: 10),

                      // Plus Button
                      IconButton(
                        icon: Icon(Icons.add, color: Colors.green),
                        onPressed: () {
                          setState(() {
                            itemCount++;
                          });
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  // Price Show
                  Text(
                    "\$${totalPrice.toStringAsFixed(2)}", // 2 decimal সহ দেখাবে
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )

                    ],

                  ),


                ),

                SizedBox(height: 20,),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                  child: Divider(),
                ),


                Expanded(
                  child: ListView.separated(
                    itemCount: menuItems.length,
                    separatorBuilder: (context, index) =>   Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Divider(),
                    ),
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          menuItems[index]["title"],
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        trailing: const Icon(Icons.keyboard_arrow_down_outlined, size: 25),
                        onTap: () {
                          // Handle menu tap
                        },

                      );
                    },
                  ),
                ),

                // Add Basket Button

                Positioned(

                  bottom: 0,
                  left: 0,
                  right: 0,

                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Log out action
                        },
                        label: Text(
                          "Add To Basket",
                          style: TextStyle(color: Colors.white,  fontSize: 16.sp,),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.splash_color,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                    ),
                  ),
                ),











              ],



            ),





            //todo: back and share icon

            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SafeArea(
                child: Column(


                  children: [


                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              Navigator.pop(context); // 👉 আগের পেজে ফিরে যাবে
                            },
                          ),



                          Image.asset("images/icons/ic_share.png")

                        ],
                      ),
                    )






                  ],








                ),
              ),
            ),





       

            ]



        ),



      ),



    );
  }
}
