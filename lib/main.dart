import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:syrian_recipes/admin_page.dart';
import 'package:syrian_recipes/screens/BottomNavBar.dart';
import 'package:syrian_recipes/screens/Home_Screen.dart';
import 'package:syrian_recipes/screens/Login_Screen.dart';
import 'package:syrian_recipes/screens/Registration_Screen.dart';
import 'package:syrian_recipes/screens/SideDrawer.dart';
import 'package:syrian_recipes/screens/Welcome_screen.dart';
import 'package:syrian_recipes/screens/Home_Screen.dart';
import 'package:syrian_recipes/screens/SideDrawer.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SyrianRecipes());
}
class SyrianRecipes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        SideDrawer.id: (context) => SideDrawer(),
        BottomNavBar.id: (context) => BottomNavBar(),
        adminPage.id: (context) => adminPage(),


      },
    );
  }
}
