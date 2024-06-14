
import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:shop_app/screens/init_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'components/profile_menu.dart';
import 'components/profile_pic.dart';
import 'package:firebase_database/firebase_database.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  
  const ProfileScreen({super.key});
  
  
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 20),
            Text(FirebaseAuth.instance.currentUser?.displayName ?? "",style: TextStyle(color: Colors.white)),
            const SizedBox(height: 20),
            ProfileMenu(
              text: "My Account",
              icon: "assets/icons/User Icon.svg",
              press: () => {Navigator.pushNamed(context, CompleteProfileScreen.routeName)},
            ),

            ProfileMenu(
              text: "Log Out",
              icon: "assets/icons/Log out.svg",
              press: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, SplashScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }



  

}
