import 'package:flutter/material.dart';
import 'package:clean_aceh/utils/constants.dart';

class ReviewsDetailScreen extends StatefulWidget {
  final String cleanerName;
  final String cleanerInitial;
  final double rating;
  final int reviewCount;

  const ReviewsDetailScreen({
    super.key,
    required this.cleanerName,
    required this.cleanerInitial,
    required this.rating,
    required this.reviewCount,
  });

  @override
  State<ReviewsDetailScreen> createState() => _ReviewsDetailScreenState();
}

class _ReviewsDetailScreenState extends State<ReviewsDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _filterRating = 'Semua';

  final List<Map<String, dynamic>> _reviews = [
    {
      'name': 'Ahmad Dhani',
      'initial': 'AD',
      'rating': 5,
      'date': '15 April 2025',
      'comment':
          'Sangat puas dengan hasil bersih-bersihnya. Rumah saya seperti baru lagi. Pekerjaannya rapi dan teliti. Akan menggunakan jasanya lagi.',
      'service': 'Pembersihan Umum',
      'hasImage': true,
    },
    {
      'name': 'Siti Nurhaliza',
      'initial': 'SN',
      'rating': 4,
      'date': '10 April 2025',
      'comment':
          'Hasil bersihnya bagus, hanya saja datang agak terlambat dari waktu yang dijadwalkan. Tapi secara keseluruhan puas.',
      'service': 'Pembersihan Dapur',
      'hasImage': false,
    },
    {
      'name': 'Raisa Andriana',
      'initial': 'RA',
      'rating': 5,
      'date': '5 April 2025',
      'comment':
          'Pembersih yang sangat ramah dan profesional. Bersih-bersihnya memuaskan dan cepat selesai. Akan pesan lagi.',
      'service': 'Pembersihan Kamar Mandi',
      'hasImage': true,
    },
    {
      'name': 'Reza Rahadian',
      'initial': 'RR',
      'rating': 3,
      'date': '1 April 2025',
      'comment':
          'Hasil pembersihan cukup baik, tapi masih ada beberapa area yang kurang bersih. Komunikasi dengan pembersih lancar.',
      'service': 'Pembersihan Umum',
      'hasImage': false,
    },
    {
      'name': 'Dian Sastro',
      'initial': 'DS',
      'rating': 5,
      'date': '28 Maret 2025',
      'comment':
          'Sangat profesional dan hasil pembersihan sangat memuaskan! Ruangan jadi segar dan bersih. Terima kasih CleanAceh!',
      'service': 'Pembersihan Umum',
      'hasImage': true,
    },
    {
      'name': 'Nicholas Saputra',
      'initial': 'NS',
      'rating': 4,
      'date': '25 Maret 2025',
      'comment':
          'Pembersihan dilakukan dengan baik, tepat waktu, dan hasilnya memuaskan. Pembersih ramah dan profesional.',
      'service': 'Pembersihan Furnitur',
      'hasImage': false,
    },
    {
      'name': 'Cut Mini',
      'initial': 'CM',
      'rating': 2,
      'date': '20 Maret 2025',
      'comment':
          'Kurang puas dengan hasilnya. Masih ada area yang kotor dan pembersih terlambat datang.',
      'service': 'Pembersihan Kamar Mandi',
      'hasImage': false,
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
        title: Text('Ulasan ${widget.cleanerName}'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Rating Summary
          Container(
            color: AppColors.white,
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                // Cleaner Info
                CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.primary,
                  child: Text(
                    widget.cleanerInitial,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.cleanerName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 18),
                        const SizedBox(width: 4),
                        Text(
                          widget.rating.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '(${widget.reviewCount} ulasan)',
                          style: const TextStyle(
                            color: AppColors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Tabs
          Container(
            color: AppColors.white,
            child: TabBar(
              controller: _tabController,
              indicatorColor: AppColors.primary,
              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.grey,
              tabs: const [Tab(text: 'Semua Ulasan'), Tab(text: 'Dengan Foto')],
            ),
          ),

          // Rating Filter
          Container(
            color: AppColors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildRatingFilter('Semua'),
                  _buildRatingFilter('5'),
                  _buildRatingFilter('4'),
                  _buildRatingFilter('3'),
                  _buildRatingFilter('2'),
                  _buildRatingFilter('1'),
                ],
              ),
            ),
          ),

          // Reviews
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // All Reviews Tab
                _buildReviewsList(false),

                // With Photos Tab
                _buildReviewsList(true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingFilter(String rating) {
    final isSelected = _filterRating == rating;

    return GestureDetector(
      onTap: () {
        setState(() {
          _filterRating = rating;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.lightGrey,
          ),
        ),
        child: Text(
          rating == 'Semua' ? rating : '$rating ★',
          style: TextStyle(
            color: isSelected ? AppColors.white : AppColors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildReviewsList(bool onlyWithPhotos) {
    // Filter reviews based on rating and photos
    List<Map<String, dynamic>> filteredReviews =
        _reviews.where((review) {
          bool matchesRating =
              _filterRating == 'Semua' ||
              review['rating'].toString() == _filterRating;
          bool matchesPhotoFilter =
              !onlyWithPhotos || review['hasImage'] == true;

          return matchesRating && matchesPhotoFilter;
        }).toList();

    if (filteredReviews.isEmpty) {
      return const Center(
        child: Text(
          'Tidak ada ulasan yang sesuai dengan filter',
          style: TextStyle(color: AppColors.grey),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: filteredReviews.length,
      separatorBuilder: (context, index) => const Divider(height: 32),
      itemBuilder: (context, index) {
        final review = filteredReviews[index];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Reviewer Info
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blueGrey.withOpacity(0.2),
                  child: Text(
                    review['initial'] as String,
                    style: const TextStyle(
                      color: Colors.blueGrey,
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
                        review['name'] as String,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Layanan: ${review['service']}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: List.generate(5, (starIndex) {
                        return Icon(
                          starIndex < (review['rating'] as int)
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.amber,
                          size: 16,
                        );
                      }),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      review['date'] as String,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Review Comment
            Text(
              review['comment'] as String,
              style: const TextStyle(height: 1.5),
            ),

            // Review Images (if any)
            if (review['hasImage'] as bool) ...[
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(3, (imgIndex) {
                    return Container(
                      margin: const EdgeInsets.only(right: 8),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.image,
                          color: AppColors.grey,
                          size: 32,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],

            const SizedBox(height: 8),

            // Helpful Button
            Row(
              children: [
                TextButton.icon(
                  onPressed: () {
                    // Mark as helpful
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Ulasan ditandai sebagai membantu'),
                      ),
                    );
                  },
                  icon: const Icon(Icons.thumb_up_alt_outlined, size: 16),
                  label: const Text('Membantu'),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.grey,
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(50, 30),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
                const SizedBox(width: 16),
                TextButton.icon(
                  onPressed: () {
                    // Report inappropriate review
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Ulasan dilaporkan')),
                    );
                  },
                  icon: const Icon(Icons.flag_outlined, size: 16),
                  label: const Text('Laporkan'),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.grey,
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(50, 30),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
