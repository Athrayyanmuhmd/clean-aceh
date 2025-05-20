import 'package:flutter/material.dart';
import 'package:clean_aceh/utils/constants.dart';
import 'package:clean_aceh/screens/service_booking_screen.dart';

class ServicesListScreen extends StatelessWidget {
  const ServicesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List of available services
    final List<Map<String, dynamic>> services = [
      {
        'title': 'Pembersihan Umum',
        'icon': Icons.cleaning_services,
        'description': 'Layanan pembersihan menyeluruh untuk seluruh rumah atau area tertentu, termasuk menyapu, mengepel, mengelap permukaan, dan membersihkan debu.',
        'price': 150000,
        'rating': 4.9,
        'totalOrders': 1240,
      },
      {
        'title': 'Kamar Mandi',
        'icon': Icons.bathtub,
        'description': 'Layanan pembersihan mendalam untuk kamar mandi, termasuk membersihkan toilet, shower, bathtub, wastafel, cermin, dan lantai.',
        'price': 100000,
        'rating': 4.8,
        'totalOrders': 980,
      },
      {
        'title': 'Dapur',
        'icon': Icons.kitchen,
        'description': 'Layanan pembersihan khusus untuk area dapur, termasuk membersihkan peralatan dapur, kabinet, microwave, oven, kulkas bagian luar, dan wastafel.',
        'price': 120000,
        'rating': 4.7,
        'totalOrders': 850,
      },
      {
        'title': 'Pembersihan Furnitur',
        'icon': Icons.chair,
        'description': 'Layanan pembersihan khusus untuk furnitur rumah seperti sofa, kursi, meja, lemari, dan tempat tidur.',
        'price': 80000,
        'rating': 4.6,
        'totalOrders': 620,
      },
      {
        'title': 'Pembersihan Jendela',
        'icon': Icons.window, // Diganti dengan icon yang sesuai
        'description': 'Layanan pembersihan jendela dan kaca di rumah Anda, termasuk frame dan kusen jendela.',
        'price': 90000,
        'rating': 4.5,
        'totalOrders': 480,
      },
      {
        'title': 'Pembersihan Karpet',
        'icon': Icons.terrain, // Diganti dengan icon yang sesuai
        'description': 'Layanan pembersihan dan penyedotan karpet untuk menghilangkan debu, kotoran, dan noda.',
        'price': 130000,
        'rating': 4.7,
        'totalOrders': 350,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Semua Layanan'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Pilih Layanan',
                style: AppTextStyles.heading1,
              ),
              const SizedBox(height: 8),
              const Text(
                'Kami menawarkan berbagai layanan pembersihan untuk kebutuhan rumah Anda',
                style: TextStyle(
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(height: 24),
              
              // Services Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  return _buildServiceCard(
                    context,
                    title: services[index]['title'],
                    icon: services[index]['icon'],
                    price: services[index]['price'],
                    rating: services[index]['rating'],
                    totalOrders: services[index]['totalOrders'],
                    description: services[index]['description'],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildServiceCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required double price,
    required double rating,
    required int totalOrders,
    required String description,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ServiceBookingScreen(
              serviceType: title,
              serviceImage: '',
              basePrice: price,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with icon
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    icon,
                    color: AppColors.primary,
                    size: 32,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 14,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          rating.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            // Content
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${totalOrders.toString()} pemesanan',
                    style: const TextStyle(
                      color: AppColors.grey,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Rp${price.toInt()}',
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}