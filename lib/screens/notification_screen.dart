import 'package:flutter/material.dart';
import 'package:clean_aceh/utils/constants.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

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
      body: ListView(
        children: [
          _buildSectionHeader('Hari ini'),
          _buildNotificationItem(
            icon: Icons.directions_walk,
            title: 'Pembersih dalam perjalanan',
            message: 'Putri Ramadhani sedang dalam perjalanan menuju lokasi Anda. Perkiraan tiba dalam 15 menit.',
            time: '10:35',
            isUnread: true,
          ),
          _buildNotificationItem(
            icon: Icons.payment,
            title: 'Pembayaran berhasil',
            message: 'Pembayaran untuk Pembersihan Umum sebesar Rp175.000 telah berhasil dikonfirmasi.',
            time: '10:22',
            isUnread: true,
          ),
          
          _buildSectionHeader('Kemarin'),
          _buildNotificationItem(
            icon: Icons.notifications_active,
            title: 'Pengingat jadwal',
            message: 'Jangan lupa tentang jadwal Pembersihan Dapur besok pukul 15:00.',
            time: '19 Apr, 10:00',
            isUnread: false,
          ),
          
          _buildSectionHeader('Sebelumnya'),
          _buildNotificationItem(
            icon: Icons.check_circle,
            title: 'Pesanan selesai',
            message: 'Pembersihan Dapur telah selesai. Terima kasih telah menggunakan layanan CleanAceh.',
            time: '20 Apr, 17:22',
            isUnread: false,
          ),
          _buildNotificationItem(
            icon: Icons.star,
            title: 'Beri ulasan',
            message: 'Bagaimana pengalaman Anda dengan Rafli Afriza Nugraha? Berikan penilaian dan ulasan Anda.',
            time: '20 Apr, 17:30',
            isUnread: false,
          ),
          _buildNotificationItem(
            icon: Icons.local_offer,
            title: 'Promo spesial!',
            message: 'Dapatkan diskon 20% untuk pembersihan kamar mandi. Berlaku hingga akhir bulan.',
            time: '18 Apr, 09:15',
            isUnread: false,
          ),
        ],
      ),
    );
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
  
  Widget _buildNotificationItem({
    required IconData icon,
    required String title,
    required String message,
    required String time,
    required bool isUnread,
  }) {
    return Container(
      color: isUnread ? AppColors.primary.withOpacity(0.05) : Colors.transparent,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: AppColors.primary,
            size: 24,
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: isUnread ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            Text(
              time,
              style: TextStyle(
                fontSize: 12,
                color: isUnread ? AppColors.primary : AppColors.grey,
              ),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            message,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.darkGrey,
            ),
          ),
        ),
        isThreeLine: true,
        trailing: isUnread
          ? Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
            )
          : null,
        onTap: () {
        },
      ),
    );
  }
}