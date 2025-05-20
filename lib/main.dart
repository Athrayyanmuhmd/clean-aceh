import 'package:flutter/material.dart';
import 'package:clean_aceh/screens/home_screen.dart';
import 'package:clean_aceh/screens/service_detail_screen.dart';
import 'package:clean_aceh/screens/cleaner_list_screen.dart';
import 'package:clean_aceh/screens/order_detail_screen.dart';
import 'package:clean_aceh/screens/payment_screen.dart';
import 'package:clean_aceh/screens/profile_screen.dart';
import 'package:clean_aceh/screens/saved_addresses_screen.dart';
import 'package:clean_aceh/screens/add_address_screen.dart';
import 'package:clean_aceh/screens/order_history_screen.dart';
import 'package:clean_aceh/screens/notification_screen.dart';
import 'package:clean_aceh/screens/review_screen.dart';
import 'package:clean_aceh/screens/edit_profile_screen.dart';
import 'package:clean_aceh/screens/payment_methods_screen.dart';
import 'package:clean_aceh/screens/cleaner_detail_screen.dart';
import 'package:clean_aceh/screens/help_screen.dart';
import 'package:clean_aceh/screens/service_booking_screen.dart';
import 'package:clean_aceh/screens/chat_screen.dart';
import 'package:clean_aceh/screens/promo_screen.dart';
import 'package:clean_aceh/screens/reviews_detail_screen.dart';
import 'package:clean_aceh/screens/services_list_screen.dart';
import 'package:clean_aceh/screens/change_password_screen.dart';
import 'package:clean_aceh/screens/about_screen.dart';
import 'package:clean_aceh/utils/constants.dart';
import 'package:clean_aceh/screens/add_payment_method_screen.dart';
import 'package:clean_aceh/screens/add_ewallet_screen.dart';
import 'package:clean_aceh/screens/add_bank_screen.dart';
import 'package:clean_aceh/screens/login_screen.dart';
import 'package:clean_aceh/screens/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CleanAceh',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'Poppins', // Sesuaikan dengan font yang digunakan dalam desain
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: AppColors.black,
          ),
          titleTextStyle: TextStyle(
            color: AppColors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
          ),
        ),
      ),
      home: const LoginScreen(), // Changed from HomeScreen to LoginScreen
    );
  }
}