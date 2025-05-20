import 'package:flutter/material.dart';
import 'package:clean_aceh/utils/constants.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // Data untuk notifikasi
  final List<Map<String, dynamic>> _notifications = [
    {
      'id': 1,
      'icon': Icons.directions_walk,
      'title': 'Pembersih dalam perjalanan',
      'message': 'Putri Ramadhani sedang dalam perjalanan menuju lokasi Anda. Perkiraan tiba dalam 15 menit.',
      'time': '10:35',
      'date': 'Hari ini',
      'isUnread': true,
      'detailMessage': 'Pembersih Anda, Putri Ramadhani, saat ini sedang dalam perjalanan ke lokasi Anda. Perkiraan waktu tiba adalah dalam 15 menit dari sekarang. Pastikan lokasi Anda mudah ditemukan dan dapat diakses. Jika ada petunjuk tambahan untuk menemukan lokasi Anda, silakan hubungi pembersih melalui fitur chat.',
      'relatedOrderId': '12345',
    },
    {
      'id': 2,
      'icon': Icons.payment,
      'title': 'Pembayaran berhasil',
      'message': 'Pembayaran untuk Pembersihan Umum sebesar Rp175.000 telah berhasil dikonfirmasi.',
      'time': '10:22',
      'date': 'Hari ini',
      'isUnread': true,
      'detailMessage': 'Pembayaran Anda untuk layanan Pembersihan Umum sebesar Rp175.000 telah berhasil dikonfirmasi. Rincian pembayaran:\n\n- Biaya layanan: Rp150.000\n- Biaya platform: Rp10.000\n- Pajak (PPN 11%): Rp15.000\n\nTotal: Rp175.000\n\nMetode pembayaran: DANA\nID Transaksi: TRX123456789\n\nPesanan Anda telah dijadwalkan. Terima kasih telah menggunakan layanan CleanAceh.',
      'relatedOrderId': '12345',
    },
    {
      'id': 3,
      'icon': Icons.notifications_active,
      'title': 'Pengingat jadwal',
      'message': 'Jangan lupa tentang jadwal Pembersihan Dapur besok pukul 15:00.',
      'time': '19 Apr, 10:00',
      'date': 'Kemarin',
      'isUnread': false,
      'detailMessage': 'Ini adalah pengingat untuk jadwal pembersihan Anda besok:\n\nLayanan: Pembersihan Dapur\nTanggal: 20 April 2025\nJam: 15:00 - 17:00\nPembersih: Ganang Setyo Hadi\n\nHarap pastikan ada seseorang di rumah untuk membukakan pintu atau berikan petunjuk akses jika tidak ada orang di rumah. Jika ada perubahan jadwal, silakan beritahu kami minimal 6 jam sebelumnya untuk menghindari biaya pembatalan.',
      'relatedOrderId': '12346',
    },
    {
      'id': 4,
      'icon': Icons.check_circle,
      'title': 'Pesanan selesai',
      'message': 'Pembersihan Dapur telah selesai. Terima kasih telah menggunakan layanan CleanAceh.',
      'time': '20 Apr, 17:22',
      'date': 'Sebelumnya',
      'isUnread': false,
      'detailMessage': 'Layanan Pembersihan Dapur Anda telah selesai dilakukan oleh Rafli Afriza Nugraha.\n\nDetail pesanan:\nID Pesanan: #12346\nTanggal: 20 April 2025\nJam: 15:00 - 17:00\nPembersih: Rafli Afriza Nugraha\nBiaya total: Rp120.000\n\nMohon berikan penilaian dan ulasan untuk pembersih Anda untuk membantu meningkatkan kualitas layanan kami. Terima kasih telah menggunakan layanan CleanAceh.',
      'relatedOrderId': '12346',
    },
    {
      'id': 5,
      'icon': Icons.star,
      'title': 'Beri ulasan',
      'message': 'Bagaimana pengalaman Anda dengan Rafli Afriza Nugraha? Berikan penilaian dan ulasan Anda.',
      'time': '20 Apr, 17:30',
      'date': 'Sebelumnya',
      'isUnread': false,
      'detailMessage': 'Pesanan Pembersihan Dapur Anda dengan Rafli Afriza Nugraha telah selesai. Kami akan sangat menghargai jika Anda dapat memberikan penilaian dan ulasan untuk layanan yang telah diberikan.\n\nUlasan Anda sangat berharga untuk meningkatkan kualitas layanan kami dan juga membantu pengguna lain dalam memilih pembersih. Terima kasih atas waktu Anda.',
      'relatedOrderId': '12346',
    },
    {
      'id': 6,
      'icon': Icons.local_offer,
      'title': 'Promo spesial!',
      'message': 'Dapatkan diskon 20% untuk pembersihan kamar mandi. Berlaku hingga akhir bulan.',
      'time': '18 Apr, 09:15',
      'date': 'Sebelumnya',
      'isUnread': false,
      'detailMessage': 'Promo Spesial untuk Anda!\n\nNikmati diskon 20% untuk layanan Pembersihan Kamar Mandi. Gunakan kode promo CLEANBATH20 saat checkout untuk mendapatkan diskon.\n\nSyarat dan ketentuan:\n- Berlaku hingga 30 April 2025\n- Minimal pemesanan Rp100.000\n- Hanya berlaku untuk layanan Pembersihan Kamar Mandi\n- Tidak dapat digabungkan dengan promo lainnya\n\nSegera pesan sekarang dan nikmati kamar mandi yang bersih dan segar!',
      'relatedOrderId': null,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Hapus Semua Notifikasi'),
                    content: const Text(
                      'Apakah Anda yakin ingin menghapus semua notifikasi?'
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Batal'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _notifications.clear();
                          });
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Semua notifikasi telah dihapus'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Text('Hapus'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: _notifications.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.notifications_off,
                    size: 64,
                    color: AppColors.lightGrey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Tidak ada notifikasi',
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: _getSortedNotifications().length,
              itemBuilder: (context, index) {
                final notifications = _getSortedNotifications();
                final currentDate = index == 0 ? notifications[0]['date'] : notifications[index]['date'];
                final previousDate = index == 0 ? '' : notifications[index - 1]['date'];
                
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (currentDate != previousDate)
                      _buildSectionHeader(currentDate),
                    _buildNotificationItem(notifications[index]),
                  ],
                );
              },
            ),
    );
  }
  
  // Mengurutkan notifikasi berdasarkan kategori tanggal
  List<Map<String, dynamic>> _getSortedNotifications() {
    // Kelompokkan notifikasi berdasarkan tanggal
    final Map<String, List<Map<String, dynamic>>> groupedNotifications = {
      'Hari ini': [],
      'Kemarin': [],
      'Sebelumnya': [],
    };
    
    for (var notification in _notifications) {
      groupedNotifications[notification['date']]?.add(notification);
    }
    
    // Gabungkan kembali dalam urutan yang benar
    List<Map<String, dynamic>> sortedNotifications = [];
    sortedNotifications.addAll(groupedNotifications['Hari ini'] ?? []);
    sortedNotifications.addAll(groupedNotifications['Kemarin'] ?? []);
    sortedNotifications.addAll(groupedNotifications['Sebelumnya'] ?? []);
    
    return sortedNotifications;
  }
  
  Widget _buildSectionHeader(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: AppColors.background,
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: AppColors.grey,
        ),
      ),
    );
  }
  
  Widget _buildNotificationItem(Map<String, dynamic> notification) {
    return GestureDetector(
      onTap: () {
        // Tandai notifikasi sebagai sudah dibaca
        setState(() {
          notification['isUnread'] = false;
        });
        
        // Tampilkan detail notifikasi
        _showNotificationDetail(notification);
      },
      child: Container(
        color: notification['isUnread'] ? AppColors.primary.withOpacity(0.05) : Colors.transparent,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              notification['icon'],
              color: AppColors.primary,
              size: 24,
            ),
          ),
          title: Row(
            children: [
              Expanded(
                child: Text(
                  notification['title'],
                  style: TextStyle(
                    fontWeight: notification['isUnread'] ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
              Text(
                notification['time'],
                style: TextStyle(
                  fontSize: 12,
                  color: notification['isUnread'] ? AppColors.primary : AppColors.grey,
                ),
              ),
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              notification['message'],
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.darkGrey,
              ),
            ),
          ),
          isThreeLine: true,
          trailing: notification['isUnread']
            ? Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              )
            : null,
        ),
      ),
    );
  }
  
  void _showNotificationDetail(Map<String, dynamic> notification) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          // Memastikan bottom sheet tidak terlalu besar
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.7,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      notification['icon'],
                      color: AppColors.primary,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notification['title'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${notification['date']} · ${notification['time']}',
                          style: const TextStyle(
                            color: AppColors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              
              const Divider(height: 30),
              
              // Detail Message
              Flexible(
                child: SingleChildScrollView(
                  child: Text(
                    notification['detailMessage'],
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 20),
              
              // Action Button (jika ada pesanan terkait)
              if (notification['relatedOrderId'] != null)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // Di sini Anda bisa navigasi ke layar detail pesanan
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Menuju ke detail pesanan ${notification['relatedOrderId']}',
                          ),
                        ),
                      );
                    },
                    child: const Text('Lihat Detail Pesanan'),
                  ),
                ),
              
              // Tombol Tutup
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.grey,
                  ),
                  child: const Text('Tutup'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}