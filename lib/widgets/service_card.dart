import 'package:flutter/material.dart';
import 'package:clean_aceh/utils/constants.dart';
import 'package:clean_aceh/screens/service_booking_screen.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final IconData iconData;
  final double basePrice;

  const ServiceCard({
    Key? key,
    required this.title,
    required this.iconData,
    this.basePrice = 150000,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to service booking screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ServiceBookingScreen(
              serviceType: title,
              serviceImage: '',
              basePrice: basePrice,
            ),
          ),
        );
      },
      child: Container(
        width: 120,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(
              iconData,
              color: AppColors.primary,
              size: 40,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}