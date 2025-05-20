import 'package:flutter/material.dart';
import 'package:clean_aceh/utils/constants.dart';
import 'package:clean_aceh/widgets/cleaner_card.dart';
import 'package:clean_aceh/screens/service_detail_screen.dart';
import 'package:clean_aceh/screens/cleaner_detail_screen.dart';

class CleanerListScreen extends StatelessWidget {
  const CleanerListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Pembersih'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search Section
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari berdasarkan nama...',
                prefixIcon: const Icon(Icons.search, color: AppColors.grey),
                filled: true,
                fillColor: AppColors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColors.primary),
                ),
              ),
            ),
          ),
          
          // Recommendations Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Rekomendasi untuk Anda',
                  style: AppTextStyles.heading2,
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CleanerDetailScreen(
                          name: 'Ganang Setyo Hadi',
                          initial: 'GS',
                          jobCount: 124,
                          price: 175000,
                        ),
                      ),
                    );
                  },
                  child: const CleanerCard(
                    name: 'Ganang Setyo Hadi',
                    jobCount: 124,
                    price: 175000,
                    initial: 'GS',
                    available: true,
                    dateInfo: 'Tersedia pada 29 April',
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CleanerDetailScreen(
                          name: 'Rafli Afriza Nugraha',
                          initial: 'RA',
                          jobCount: 44,
                          price: 170000,
                        ),
                      ),
                    );
                  },
                  child: const CleanerCard(
                    name: 'Rafli Afriza Nugraha',
                    jobCount: 44,
                    price: 170000,
                    initial: 'RA',
                    available: false,
                    dateInfo: 'Tidak tersedia pada 29 April',
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CleanerDetailScreen(
                          name: 'Fadlul Ihsan',
                          initial: 'FI',
                          jobCount: 1087,
                          price: 70000,
                        ),
                      ),
                    );
                  },
                  child: const CleanerCard(
                    name: 'Fadlul Ihsan',
                    jobCount: 1087,
                    price: 70000,
                    initial: 'FI',
                    available: true,
                    dateInfo: 'Tersedia pada 29 April',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}