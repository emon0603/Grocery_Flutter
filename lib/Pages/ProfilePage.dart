import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/AppColors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  // Menu items data
  final List<Map<String, dynamic>> menuItems = [
    {"icon": Icons.inventory, "title": "Orders"},
    {"icon": Icons.person, "title": "My Details"},
    {"icon": Icons.location_on, "title": "Delivery Address"},
    {"icon": Icons.payment, "title": "Payment Methods"},
    {"icon": Icons.card_giftcard, "title": "Promo Code"},
    {"icon": Icons.notifications, "title": "Notifications"},
    {"icon": Icons.help_outline, "title": "Help"},
    {"icon": Icons.info_outline, "title": "About"},
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Scrollbar(

        child: Column(
          children: [

            ///todo: Profile Image and name
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center, // Image + Text vertically centered
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: 80, // CircleAvatar diameter (radius * 2)
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black, // Border color
                          width: 2,            // Border width
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("images/ic_profile.jpg"),
                        backgroundColor: Colors.white,
                      ),
                    ),

                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Text left aligned
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Emon Hossain",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Icon(Icons.edit, color: AppColors.splash_color),
                          ],
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "emon@gmail.com",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ///todo: Profile Image and name ------------ finish

            Divider(),


            Expanded(
              child: ListView.separated(
                itemCount: menuItems.length,
                separatorBuilder: (context, index) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(menuItems[index]["icon"], color: Colors.black),
                    title: Text(
                      menuItems[index]["title"],
                      style: const TextStyle(fontSize: 16),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // Handle menu tap
                    },

                  );
                },
              ),
            ),



            // Log Out Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Log out action
                  },
                  icon: const Icon(Icons.logout, color: Colors.green),
                  label: const Text(
                    "Log Out",
                    style: TextStyle(color: Colors.green),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

