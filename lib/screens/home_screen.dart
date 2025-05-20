import 'package:flutter/material.dart';
import 'package:clean_aceh/utils/constants.dart';
import 'package:clean_aceh/widgets/service_card.dart';
import 'package:clean_aceh/widgets/cleaner_card.dart';
import 'package:clean_aceh/screens/cleaner_list_screen.dart';
import 'package:clean_aceh/screens/profile_screen.dart';
import 'package:clean_aceh/screens/order_history_screen.dart';
import 'package:clean_aceh/screens/promo_screen.dart';
import 'package:clean_aceh/screens/services_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedLocation = 'Kota Banda Aceh';
  final List<String> _availableLocations = [
    'Kota Banda Aceh',
    'Sabang',
    'Aceh Besar',
    'Sigli',
    'Bireun',
    'Lhokseumawe',
  ];
  
  void _showLocationPicker() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Pilih Lokasi',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _availableLocations.length,
                  itemBuilder: (context, index) {
                    final location = _availableLocations[index];
                    final isSelected = location == _selectedLocation;
                    
                    return ListTile(
                      title: Text(location),
                      trailing: isSelected 
                        ? const Icon(Icons.check, color: AppColors.primary)
                        : null,
                      onTap: () {
                        setState(() {
                          _selectedLocation = location;
                        });
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Section
              Container(
                padding: const EdgeInsets.all(20),
                color: AppColors.primary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          height: 40,
                          // Gunakan placeholder jika logo belum tersedia
                          errorBuilder: (context, error, stackTrace) => 
                              const Text('CleanAceh', style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold, fontSize: 22)),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.local_offer, color: AppColors.white),
                              onPressed: () {
                                // Navigate to Promo Screen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const PromoScreen(),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(width: 8),
                            CircleAvatar(
                              backgroundColor: AppColors.white,
                              radius: 20,
                              child: Text(
                                'MJ',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Rumah Bersih, Hidup Nyaman',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Layanan pembersihan profesional untuk rumah Anda',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CleanerListScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        foregroundColor: AppColors.primary,
                      ),
                      child: const Text('Pesan Sekarang'),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              
              // Lokasi Anda
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Lokasi Anda',
                      style: AppTextStyles.heading2,
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: _showLocationPicker,
                      child: Container(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.location_on, color: AppColors.primary),
                                const SizedBox(width: 10),
                                Text(
                                  _selectedLocation,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Layanan Kami
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Layanan Kami',
                          style: AppTextStyles.heading2,
                        ),
                        TextButton(
                          onPressed: () {
                            // Navigate to Services List Screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ServicesListScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Lihat Semua',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: const [
                          ServiceCard(
                            title: 'Pembersihan Umum',
                            iconData: Icons.cleaning_services,
                            basePrice: 150000,
                          ),
                          SizedBox(width: 15),
                          ServiceCard(
                            title: 'Kamar Mandi',
                            iconData: Icons.bathtub,
                            basePrice: 100000,
                          ),
                          SizedBox(width: 15),
                          ServiceCard(
                            title: 'Dapur',
                            iconData: Icons.kitchen,
                            basePrice: 120000,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              // Pembersih Teratas
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Pembersih Teratas',
                          style: AppTextStyles.heading2,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CleanerListScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Lihat Semua',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const CleanerCard(
                      name: 'Ganang Setyo Hadi',
                      jobCount: 124,
                      price: 175000,
                      initial: 'GS',
                      available: true,
                    ),
                    const SizedBox(height: 15),
                    const CleanerCard(
                      name: 'Rafli Afriza Nugraha',
                      jobCount: 44,
                      price: 170000,
                      initial: 'RA',
                      available: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Pesanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        onTap: (index) {
          if (index == 2) {
            // Navigate to Profile Screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileScreen(),
              ),
            );
          } else if (index == 1) {
            // Navigate to Order History Screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const OrderHistoryScreen(),
              ),
            );
          }
        },
      ),
    );
  }
}