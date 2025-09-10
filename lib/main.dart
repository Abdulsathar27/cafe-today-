import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/constants/app_texts.dart';
import 'package:cafebooking/models/address_model.dart';
import 'package:cafebooking/models/cart_item.dart';
import 'package:cafebooking/models/menu_item.dart';
import 'package:cafebooking/models/order_item.dart';
import 'package:cafebooking/models/order_model.dart';
import 'package:cafebooking/models/profile_model.dart';
import 'package:cafebooking/screens/loginpage/login.dart';
import 'package:cafebooking/screens/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  //Register adapter 
  Hive.registerAdapter(MenuItemAdapter());
  Hive.registerAdapter(CartItemAdapter());
  Hive.registerAdapter(AddressAdapter());
  Hive.registerAdapter(ProfileAdapter());
  Hive.registerAdapter(OrderItemAdapter());
  Hive.registerAdapter(OrderAdapter());

  // Open your box before using it
  await Hive.openBox<MenuItem>('menuBox');
  await Hive.openBox<CartItem>('cartBox');
  await Hive.openBox<Address>('addressBox');
  await Hive.openBox<Profile>('profileBox'); 
  await Hive.openBox<Order>('ordersBox');



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppTexts.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.backgroundLight,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      home: SplashPage(
        nextPage: CafeLoginPage(), 
        
      ),
    );
  }
}
