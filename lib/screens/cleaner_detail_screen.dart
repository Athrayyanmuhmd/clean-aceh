import 'package:flutter/material.dart';
import 'package:clean_aceh/utils/constants.dart';
import 'package:clean_aceh/screens/service_detail_screen.dart';
import 'package:clean_aceh/screens/reviews_detail_screen.dart';

class CleanerDetailScreen extends StatefulWidget {
  final String name;
  final String initial;
  final int jobCount;
  final double price;
  final double rating;
  final int reviewCount;

  const CleanerDetailScreen({
    super.key,
    required this.name,
    required this.initial,
    required this.jobCount,
    required this.price,
    this.rating = 4.8,
    this.reviewCount = 230,
  });

  @override
  State<CleanerDetailScreen> createState() => _CleanerDetailScreenState();
}

class _CleanerDetailScreenState extends State<CleanerDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App bar with profile
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            backgroundColor: AppColors.primary,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.white),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.share, color: AppColors.white),
                onPressed: () {
                  // Share profile
                },
              ),
              IconButton(
                icon: const Icon(Icons.favorite_border, color: AppColors.white),
                onPressed: () {
                  // Add to favorites
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Ditambahkan ke favorit')),
                  );
                },
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: AppColors.primary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColors.white,
                      child: Text(
                        widget.initial,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${widget.jobCount} pekerjaan',
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Rating and tabs
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  // Rating section
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.star, color: Colors.amber),
                        const SizedBox(width: 5),
                        Text(
                          '${widget.rating}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '(${widget.reviewCount} ulasan)',
                          style: const TextStyle(color: AppColors.grey),
                        ),
                      ],
                    ),
                  ),

                  // Tabs
                  TabBar(
                    controller: _tabController,
                    indicatorColor: AppColors.primary,
                    labelColor: AppColors.primary,
                    unselectedLabelColor: AppColors.grey,
                    tabs: const [
                      Tab(text: 'Tentang'),
                      Tab(text: 'Keahlian'),
                      Tab(text: 'Ulasan'),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Tab content
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: [
                // About tab
                _buildAboutTab(),

                // Skills tab
                _buildSkillsTab(),

                // Reviews tab
                _buildReviewsTab(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Harga', style: TextStyle(color: AppColors.grey)),
                Text(
                  'Rp${widget.price.toInt()}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to service detail screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => ServiceDetailScreen(
                          cleanerName: widget.name,
                          cleanerInitial: widget.initial,
                          jobCount: widget.jobCount,
                          price: widget.price,
                        ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
              ),
              child: const Text('Pesan Sekarang'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Tentang', style: AppTextStyles.heading2),
          const SizedBox(height: 10),
          const Text(
            'Saya adalah seorang pembersih profesional dengan pengalaman lebih dari 5 tahun. Saya mengutamakan kepuasan pelanggan dan hasil yang bersih, rapi, serta higienis. Saya menggunakan bahan pembersih berkualitas yang aman untuk lingkungan dan keluarga Anda.',
            style: TextStyle(height: 1.5),
          ),
          const SizedBox(height: 20),
          const Text('Area Layanan', style: AppTextStyles.heading2),
          const SizedBox(height: 10),
          _buildAreaItem('Banda Aceh', isAvailable: true),
          _buildAreaItem('Sabang', isAvailable: true),
          _buildAreaItem('Aceh Besar', isAvailable: true),
          _buildAreaItem('Sigli', isAvailable: false),
          const SizedBox(height: 20),
          const Text('Jadwal Kerja', style: AppTextStyles.heading2),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: _buildDaySchedule('Senin', '08:00 - 18:00')),
              Expanded(child: _buildDaySchedule('Selasa', '08:00 - 18:00')),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: _buildDaySchedule('Rabu', '08:00 - 18:00')),
              Expanded(child: _buildDaySchedule('Kamis', '08:00 - 18:00')),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: _buildDaySchedule('Jumat', '08:00 - 18:00')),
              Expanded(child: _buildDaySchedule('Sabtu', '08:00 - 16:00')),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _buildDaySchedule('Minggu', 'Libur', isAvailable: false),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildSkillsTab() {
    final skills = [
      {'name': 'Pembersihan Umum', 'price': 150000, 'rating': 4.9},
      {'name': 'Pembersihan Dapur', 'price': 120000, 'rating': 4.8},
      {'name': 'Pembersihan Kamar Mandi', 'price': 100000, 'rating': 4.7},
      {'name': 'Pembersihan Furnitur', 'price': 80000, 'rating': 4.6},
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Layanan Tersedia', style: AppTextStyles.heading2),
          const SizedBox(height: 16),
          ...skills.map(
            (skill) => _buildSkillItem(
              name: skill['name'] as String,
              price: skill['price'] as int,
              rating: skill['rating'] as double,
            ),
          ),
          const SizedBox(height: 20),

          const Text('Peralatan', style: AppTextStyles.heading2),
          const SizedBox(height: 16),
          _buildEquipmentList(),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildReviewsTab() {
    final reviews = [
      {
        'name': 'Ahmad Dhani',
        'initial': 'AD',
        'rating': 5,
        'date': '15 April 2025',
        'comment':
            'Sangat puas dengan hasil bersih-bersihnya. Rumah saya seperti baru lagi. Pekerjaannya rapi dan teliti.',
      },
      {
        'name': 'Siti Nurhaliza',
        'initial': 'SN',
        'rating': 4,
        'date': '10 April 2025',
        'comment':
            'Hasil bersihnya bagus, hanya saja datang agak terlambat dari waktu yang dijadwalkan. Tapi secara keseluruhan puas.',
      },
      {
        'name': 'Raisa Andriana',
        'initial': 'RA',
        'rating': 5,
        'date': '5 April 2025',
        'comment':
            'Pembersih yang sangat ramah dan profesional. Bersih-bersihnya memuaskan dan cepat selesai. Akan pesan lagi.',
      },
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Ulasan Pelanggan', style: AppTextStyles.heading2),
          const SizedBox(height: 16),
          ...reviews.map(
            (review) => _buildReviewItem(
              name: review['name'] as String,
              initial: review['initial'] as String,
              rating: review['rating'] as int,
              date: review['date'] as String,
              comment: review['comment'] as String,
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: TextButton(
              onPressed: () {
                // Navigate to reviews detail
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => ReviewsDetailScreen(
                          cleanerName: widget.name,
                          cleanerInitial: widget.initial,
                          rating: widget.rating,
                          reviewCount: widget.reviewCount,
                        ),
                  ),
                );
              },
              child: const Text(
                'Lihat Semua Ulasan',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildAreaItem(String area, {bool isAvailable = true}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(
            isAvailable ? Icons.check_circle : Icons.cancel,
            color: isAvailable ? Colors.green : Colors.red,
            size: 18,
          ),
          const SizedBox(width: 8),
          Text(
            area,
            style: TextStyle(
              color: isAvailable ? AppColors.black : AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDaySchedule(
    String day,
    String hours, {
    bool isAvailable = true,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
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
          Text(day, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(
            hours,
            style: TextStyle(
              color: isAvailable ? AppColors.black : Colors.red,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillItem({
    required String name,
    required int price,
    required double rating,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(
                'Rp$price',
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 16),
              const SizedBox(width: 4),
              Text(
                rating.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEquipmentList() {
    final equipment = [
      'Vacuum cleaner',
      'Mop & ember',
      'Kemoceng & sapu',
      'Sikat pembersih',
      'Cairan pembersih lantai',
      'Pembersih kaca',
      'Disinfektan',
      'Sarung tangan & masker',
    ];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children:
          equipment
              .map(
                (item) => Chip(
                  label: Text(item),
                  backgroundColor: AppColors.primary.withOpacity(0.1),
                  labelStyle: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 12,
                  ),
                ),
              )
              .toList(),
    );
  }

  Widget _buildReviewItem({
    required String name,
    required String initial,
    required int rating,
    required String date,
    required String comment,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
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
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.primary.withOpacity(0.1),
                child: Text(
                  initial,
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      date,
                      style: const TextStyle(
                        color: AppColors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    index < rating ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                    size: 16,
                  );
                }),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(comment, style: const TextStyle(height: 1.4)),
        ],
      ),
    );
  }
}
