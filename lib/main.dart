import 'package:cafebooking/models/cafe_order.dart';
import 'package:flutter/material.dart';
import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/constants/app_texts.dart';
import 'package:cafebooking/models/address_model.dart';
import 'package:cafebooking/models/cart_item.dart';
import 'package:cafebooking/models/menu_item.dart';
import 'package:cafebooking/models/order_item.dart';
import 'package:cafebooking/models/order_model.dart';
import 'package:cafebooking/models/profile_model.dart';
import 'package:cafebooking/screens/splash/splash_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Initialize Hive
  await Hive.initFlutter();

  // ✅ Register adapters (each model must have a unique typeId)
  Hive.registerAdapter(MenuItemAdapter());
  Hive.registerAdapter(CartItemAdapter());
  Hive.registerAdapter(AddressAdapter());
  Hive.registerAdapter(ProfileAdapter());
  Hive.registerAdapter(OrderItemAdapter());
  Hive.registerAdapter(OrderAdapter());
  Hive.registerAdapter(CafeOrderAdapter());

  // ✅ Open Hive boxes safely
  await _openHiveBox<MenuItem>('menuBox');
  await _openHiveBox<CartItem>('cartBox');
  await _openHiveBox<Address>('addressBox');
  await _openHiveBox<Profile>('profileBox');
  await _openHiveBox<Order>('ordersBox');
  await _openHiveBox<Order>('cafeorder');

  runApp(const MyApp());
}

/// Helper: Opens a Hive box safely without crashing app
Future<void> _openHiveBox<T>(String name) async {
  try {
    await Hive.openBox<T>(name);
  } catch (e) {
    debugPrint("⚠️ Error opening $name: $e → deleting and recreating");
    try {
      await Hive.deleteBoxFromDisk(name);
    } catch (deleteError) {
      debugPrint("⚠️ Could not delete $name: $deleteError");
    }
    await Hive.openBox<T>(name);
  }
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
      home: const SplashPage(),
    );
  }
}
