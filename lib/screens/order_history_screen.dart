import 'package:flutter/material.dart';
import 'package:clean_aceh/utils/constants.dart';
import 'package:clean_aceh/screens/order_detail_screen.dart';
import 'package:clean_aceh/screens/review_screen.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> with SingleTickerProviderStateMixin {
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
      appBar: AppBar(
        title: const Text('Riwayat Pesanan'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.primary,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.grey,
          tabs: const [
            Tab(text: 'Aktif'),
            Tab(text: 'Selesai'),
            Tab(text: 'Dibatalkan'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildActiveOrdersTab(),
          
          _buildCompletedOrdersTab(),
          
          _buildCanceledOrdersTab(),
        ],
      ),
    );
  }
  
  Widget _buildActiveOrdersTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildOrderCard(
            initial: 'RA',
            name: 'Rafli Afriza Nugraha',
            service: 'Pembersihan Umum',
            date: '29 April 2025',
            time: '12:00 - 14:00',
            status: 'Dalam Perjalanan',
            statusColor: Colors.blue,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OrderDetailScreen(),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          _buildOrderCard(
            initial: 'GS',
            name: 'Ganang Setyo Hadi',
            service: 'Pembersihan Dapur',
            date: '30 April 2025',
            time: '14:00 - 16:00',
            status: 'Dijadwalkan',
            statusColor: Colors.orange,
            onTap: () {
            },
          ),
        ],
      ),
    );
  }
  
  Widget _buildCompletedOrdersTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildOrderCard(
            initial: 'FI',
            name: 'Fadlul Ihsan',
            service: 'Pembersihan Kamar Mandi',
            date: '25 April 2025',
            time: '10:00 - 12:00',
            status: 'Selesai',
            statusColor: Colors.green,
            showReviewButton: true,
            onTap: () {
            },
            onReview: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReviewScreen(
                    cleanerName: 'Fadlul Ihsan',
                    cleanerInitial: 'FI',
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          _buildOrderCard(
            initial: 'RA',
            name: 'Rafli Afriza Nugraha',
            service: 'Pembersihan Umum',
            date: '20 April 2025',
            time: '14:00 - 16:00',
            status: 'Selesai',
            statusColor: Colors.green,
            isReviewed: true,
            onTap: () {
            },
          ),
        ],
      ),
    );
  }
  
  Widget _buildCanceledOrdersTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildOrderCard(
            initial: 'GS',
            name: 'Ganang Setyo Hadi',
            service: 'Pembersihan Umum',
            date: '15 April 2025',
            time: '09:00 - 11:00',
            status: 'Dibatalkan',
            statusColor: Colors.red,
            onTap: () {
            },
          ),
        ],
      ),
    );
  }
  
  Widget _buildOrderCard({
    required String initial,
    required String name,
    required String service,
    required String date,
    required String time,
    required String status,
    required Color statusColor,
    bool showReviewButton = false,
    bool isReviewed = false,
    required VoidCallback onTap,
    VoidCallback? onReview,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
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
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.primary,
                  child: Text(
                    initial,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        service,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  size: 16,
                  color: AppColors.grey,
                ),
                const SizedBox(width: 8),
                Text(
                  date,
                  style: const TextStyle(
                    color: AppColors.grey,
                  ),
                ),
                const SizedBox(width: 16),
                const Icon(
                  Icons.access_time,
                  size: 16,
                  color: AppColors.grey,
                ),
                const SizedBox(width: 8),
                Text(
                  time,
                  style: const TextStyle(
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
            if (showReviewButton || isReviewed) ...[
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 8),
              isReviewed
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Sudah Direview',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 16,
                          );
                        }),
                      ),
                    ],
                  )
                : TextButton(
                    onPressed: onReview,
                    child: const Text(
                      'Beri Ulasan',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
            ],
          ],
        ),
      ),
    );
  }
}