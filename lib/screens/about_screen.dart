import 'package:flutter/material.dart';
import 'package:clean_aceh/utils/constants.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang CleanAceh'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Logo and Version
            Container(
              padding: const EdgeInsets.all(24),
              width: double.infinity,
              color: AppColors.primary,
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 80,
                        height: 80,
                        // Fallback if logo not available
                        errorBuilder: (context, error, stackTrace) => const Text(
                          'CA',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'CleanAceh',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Versi 1.0.0',
                    style: TextStyle(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
            
            // About Company
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tentang Kami',
                    style: AppTextStyles.heading2,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'CleanAceh adalah aplikasi pemesanan jasa pembersih rumah yang berbasis di Banda Aceh. Kami berkomitmen untuk menyediakan layanan pembersihan berkualitas tinggi yang dapat diandalkan dan terjangkau untuk semua pengguna.\n\nDidirikan pada tahun 2023, CleanAceh bertujuan untuk menghubungkan para profesional pembersih dengan pelanggan yang membutuhkan layanan pembersihan rumah. Semua pembersih kami telah melalui proses seleksi ketat dan terlatih untuk memberikan pelayanan terbaik sesuai standar kami.',
                    style: TextStyle(
                      height: 1.5,
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Mission and Vision
                  const Text(
                    'Misi & Visi',
                    style: AppTextStyles.heading2,
                  ),
                  const SizedBox(height: 12),
                  _buildPointItem(
                    title: 'Misi',
                    content: 'Menyediakan layanan pembersihan rumah yang berkualitas, terjangkau, dan mudah diakses oleh semua orang di Aceh.',
                  ),
                  const SizedBox(height: 12),
                  _buildPointItem(
                    title: 'Visi',
                    content: 'Menjadi platform terdepan dalam bidang jasa pembersihan rumah di Aceh dan memberikan pengalaman pembersihan yang memuaskan bagi setiap pelanggan.',
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Contact Information
                  const Text(
                    'Kontak Kami',
                    style: AppTextStyles.heading2,
                  ),
                  const SizedBox(height: 12),
                  _buildContactItem(
                    icon: Icons.email,
                    title: 'Email',
                    content: 'info@cleanaceh.com',
                  ),
                  const SizedBox(height: 8),
                  _buildContactItem(
                    icon: Icons.phone,
                    title: 'Telepon',
                    content: '+62 811-2345-6789',
                  ),
                  const SizedBox(height: 8),
                  _buildContactItem(
                    icon: Icons.location_on,
                    title: 'Alamat',
                    content: 'Jl. Teuku Umar No. 50, Banda Aceh, Indonesia',
                  ),
                  const SizedBox(height: 8),
                  _buildContactItem(
                    icon: Icons.access_time,
                    title: 'Jam Kerja',
                    content: 'Senin - Sabtu, 08:00 - 18:00 WIB',
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Social Media
                  const Text(
                    'Ikuti Kami',
                    style: AppTextStyles.heading2,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialButton(Icons.facebook, Colors.blue, () {}),
                      const SizedBox(width: 16),
                      _buildSocialButton(Icons.access_time_sharp, Colors.pink, () {}),
                      const SizedBox(width: 16),
                      _buildSocialButton(Icons.camera_alt, Colors.purple, () {}),
                      const SizedBox(width: 16),
                      _buildSocialButton(Icons.link, Colors.teal, () {}),
                    ],
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Legal
                  const Text(
                    'Informasi Legal',
                    style: AppTextStyles.heading2,
                  ),
                  const SizedBox(height: 12),
                  _buildLegalButton('Syarat & Ketentuan', () {}),
                  const SizedBox(height: 8),
                  _buildLegalButton('Kebijakan Privasi', () {}),
                  const SizedBox(height: 8),
                  _buildLegalButton('Kebijakan Pengembalian Dana', () {}),
                  
                  const SizedBox(height: 40),
                  
                  // Copyright
                  const Center(
                    child: Text(
                      '© 2023-2025 CleanAceh. Seluruh Hak Dilindungi.',
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildPointItem({
    required String title,
    required String content,
  }) {
    return Column(
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
          content,
          style: const TextStyle(
            height: 1.5,
          ),
        ),
      ],
    );
  }
  
  Widget _buildContactItem({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: AppColors.primary,
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                content,
                style: const TextStyle(
                  color: AppColors.darkGrey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  
  Widget _buildSocialButton(IconData icon, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: color,
          size: 24,
        ),
      ),
    );
  }
  
  Widget _buildLegalButton(String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.lightGrey,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.grey,
            ),
          ],
        ),
      ),
    );
  }
}