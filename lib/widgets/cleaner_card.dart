import 'package:flutter/material.dart';
import 'package:clean_aceh/utils/constants.dart';

class CleanerCard extends StatelessWidget {
  final String name;
  final int jobCount;
  final double price;
  final String initial;
  final bool available;
  final String? dateInfo;

  const CleanerCard({
    super.key,
    required this.name,
    required this.jobCount,
    required this.price,
    required this.initial,
    required this.available,
    this.dateInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: AppColors.primary,
            child: Text(
              initial,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '$jobCount pekerjaan',
                  style: const TextStyle(
                    color: AppColors.grey,
                    fontSize: 14,
                  ),
                ),
                if (dateInfo != null) ...[
                  const SizedBox(height: 5),
                  Text(
                    dateInfo!,
                    style: TextStyle(
                      color: available ? Colors.green : Colors.red,
                      fontSize: 14,
                    ),
                  ),
                ],
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Rp${price.toInt()}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: available
                    ? () {
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: available ? AppColors.primary : AppColors.lightGrey,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text(
                  available ? 'Pilih' : 'Tidak Tersedia',
                  style: TextStyle(
                    color: available ? AppColors.white : AppColors.grey,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}