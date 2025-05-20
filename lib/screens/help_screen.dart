import 'package:flutter/material.dart';
import 'package:clean_aceh/utils/constants.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final TextEditingController _searchController = TextEditingController();
  
  final List<Map<String, dynamic>> _categories = [
    {
      'icon': Icons.cleaning_services,
      'title': 'Layanan',
      'questions': [
        {
          'question': 'Apa saja jenis layanan yang tersedia di CleanAceh?',
          'answer': 'CleanAceh menyediakan berbagai layanan pembersihan seperti: Pembersihan Umum, Pembersihan Kamar Mandi, Pembersihan Dapur, Pembersihan Furnitur, dan lainnya. Setiap layanan memiliki harga yang berbeda tergantung pada area yang dibersihkan dan waktu yang dibutuhkan.',
          'isExpanded': false,
        },
        {
          'question': 'Apakah pembersih membawa peralatan sendiri?',
          'answer': 'Ya, semua pembersih CleanAceh akan membawa peralatan dan bahan pembersih sendiri. Anda tidak perlu menyediakan apapun. Namun, jika Anda memiliki preferensi untuk penggunaan produk pembersih tertentu, Anda bisa memberitahu pembersih saat mereka tiba.',
          'isExpanded': false,
        },
        {
          'question': 'Berapa lama waktu yang dibutuhkan untuk pembersihan?',
          'answer': 'Waktu pembersihan bervariasi tergantung pada jenis layanan dan ukuran area yang akan dibersihkan. Secara umum, pembersihan umum untuk rumah dengan 2 kamar tidur membutuhkan waktu sekitar 2-4 jam. Anda akan mendapatkan estimasi waktu saat memesan layanan.',
          'isExpanded': false,
        },
      ],
    },
    {
      'icon': Icons.payment,
      'title': 'Pembayaran',
      'questions': [
        {
          'question': 'Metode pembayaran apa saja yang tersedia?',
          'answer': 'CleanAceh menerima pembayaran melalui berbagai metode seperti e-wallet (DANA, GoPay, OVO) dan transfer bank (BCA, BNI, Mandiri, BSI). Anda dapat memilih metode pembayaran yang paling nyaman untuk Anda saat proses checkout.',
          'isExpanded': false,
        },
        {
          'question': 'Apakah ada biaya tambahan selain harga layanan?',
          'answer': 'Selain harga layanan, terdapat biaya platform sebesar Rp10.000 dan pajak (PPN 11%) yang akan ditambahkan pada total pembayaran. Semua biaya ini akan ditampilkan secara transparan pada halaman pembayaran sebelum Anda menyelesaikan pesanan.',
          'isExpanded': false,
        },
        {
          'question': 'Bagaimana kebijakan pembatalan dan pengembalian dana?',
          'answer': 'Anda dapat membatalkan pesanan hingga 12 jam sebelum jadwal yang ditentukan untuk mendapatkan pengembalian dana penuh. Pembatalan yang dilakukan kurang dari 12 jam akan dikenakan biaya pembatalan sebesar 25% dari total pembayaran. Jika pembersih tidak datang, Anda berhak mendapatkan pengembalian dana penuh.',
          'isExpanded': false,
        },
      ],
    },
    {
      'icon': Icons.person,
      'title': 'Pembersih',
      'questions': [
        {
          'question': 'Bagaimana CleanAceh memilih pembersih?',
          'answer': 'Semua pembersih di CleanAceh melewati proses seleksi ketat termasuk verifikasi identitas, wawancara, dan pelatihan standar. Kami juga melakukan pemeriksaan latar belakang untuk memastikan keamanan pengguna kami. Setiap pembersih dinilai berdasarkan kinerja dan ulasan dari pelanggan.',
          'isExpanded': false,
        },
        {
          'question': 'Apakah saya bisa memilih pembersih yang sama untuk pesanan berikutnya?',
          'answer': 'Ya, Anda dapat memilih pembersih favorit Anda untuk pesanan berikutnya. Setelah layanan selesai, Anda dapat menambahkan pembersih ke daftar favorit Anda atau langsung memilih mereka saat membuat pesanan baru. Ketersediaan pembersih tergantung pada jadwal mereka.',
          'isExpanded': false,
        },
        {
          'question': 'Apa yang harus dilakukan jika saya tidak puas dengan hasil pembersihan?',
          'answer': 'Kepuasan Anda adalah prioritas kami. Jika Anda tidak puas dengan hasil pembersihan, harap laporkan masalah ini melalui aplikasi dalam waktu 24 jam setelah layanan selesai. Kami akan mengirim pembersih kembali untuk memperbaiki area yang tidak memuaskan tanpa biaya tambahan atau memberikan pengembalian dana sebagian.',
          'isExpanded': false,
        },
      ],
    },
    {
      'icon': Icons.security,
      'title': 'Keamanan',
      'questions': [
        {
          'question': 'Bagaimana CleanAceh menjamin keamanan di rumah saya?',
          'answer': 'Keamanan adalah prioritas utama kami. Semua pembersih CleanAceh telah melewati pemeriksaan latar belakang yang ketat. Kami juga memiliki asuransi yang mencakup kerusakan atau kehilangan yang mungkin terjadi selama proses pembersihan. Kami menyarankan untuk menyimpan barang berharga di tempat yang aman sebelum pembersihan dimulai.',
          'isExpanded': false,
        },
        {
          'question': 'Apakah saya harus ada di rumah saat pembersihan?',
          'answer': 'Tidak, Anda tidak harus berada di rumah saat pembersihan berlangsung. Anda dapat memberikan instruksi khusus untuk akses ke rumah Anda, seperti memberi tahu kode akses atau menyerahkan kunci kepada pembersih. Namun, jika ini adalah pesanan pertama Anda, kami sarankan untuk hadir saat pembersihan dimulai untuk memberikan arahan spesifik jika diperlukan.',
          'isExpanded': false,
        },
        {
          'question': 'Apakah CleanAceh menyediakan asuransi?',
          'answer': 'Ya, CleanAceh memiliki asuransi yang melindungi properti Anda selama proses pembersihan. Asuransi kami mencakup kerusakan yang mungkin terjadi akibat kesalahan pembersih. Jika terjadi kerusakan, harap laporkan dalam waktu 48 jam dengan foto dan deskripsi kerusakan untuk proses klaim.',
          'isExpanded': false,
        },
      ],
    },
  ];
  
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bantuan & FAQ'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Cari pertanyaan...',
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
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Aksi Cepat',
                  style: AppTextStyles.heading2,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildQuickActionButton(
                        icon: Icons.headset_mic,
                        title: 'Hubungi CS',
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Hubungi Customer Service'),
                              content: const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.phone, color: AppColors.primary),
                                    title: Text('+62 811-2345-6789'),
                                    subtitle: Text('Senin - Sabtu, 08:00 - 20:00'),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.email, color: AppColors.primary),
                                    title: Text('cs@cleanaceh.com'),
                                    subtitle: Text('Respon dalam 24 jam'),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.chat, color: AppColors.primary),
                                    title: Text('Live Chat'),
                                    subtitle: Text('Respon instan'),
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Tutup'),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildQuickActionButton(
                        icon: Icons.report_problem,
                        title: 'Laporkan Masalah',
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Mengarahkan ke form laporan masalah...'),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 20),
          
          Expanded(
            child: _searchController.text.isEmpty
                ? _buildFAQCategories()
                : _buildSearchResults(),
          ),
        ],
      ),
    );
  }
  
  Widget _buildQuickActionButton({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
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
        child: Column(
          children: [
            Icon(
              icon,
              color: AppColors.primary,
              size: 32,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildFAQCategories() {
    return ListView.builder(
      itemCount: _categories.length,
      itemBuilder: (context, index) {
        final category = _categories[index];
        return ExpansionTile(
          leading: Icon(
            category['icon'] as IconData,
            color: AppColors.primary,
          ),
          title: Text(
            category['title'] as String,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: (category['questions'] as List).length,
              itemBuilder: (context, qIndex) {
                final question = (category['questions'] as List)[qIndex];
                return ExpansionTile(
                  title: Text(
                    question['question'] as String,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  onExpansionChanged: (expanded) {
                    setState(() {
                      question['isExpanded'] = expanded;
                    });
                  },
                  initiallyExpanded: question['isExpanded'] as bool,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: Text(
                        question['answer'] as String,
                        style: const TextStyle(
                          color: AppColors.darkGrey,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        );
      },
    );
  }
  
  Widget _buildSearchResults() {
    final String searchQuery = _searchController.text.toLowerCase();
    List<Map<String, dynamic>> searchResults = [];
    
    for (var category in _categories) {
      for (var question in category['questions'] as List) {
        if ((question['question'] as String).toLowerCase().contains(searchQuery) ||
            (question['answer'] as String).toLowerCase().contains(searchQuery)) {
          searchResults.add({
            'category': category['title'],
            'question': question['question'],
            'answer': question['answer'],
            'isExpanded': false,
          });
        }
      }
    }
    
    if (searchResults.isEmpty) {
      return const Center(
        child: Text(
          'Tidak ada hasil ditemukan',
          style: TextStyle(
            color: AppColors.grey,
          ),
        ),
      );
    }
    
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final result = searchResults[index];
        return Column(
          children: [
            ExpansionTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    result['category'] as String,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    result['question'] as String,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
              onExpansionChanged: (expanded) {
                setState(() {
                  result['isExpanded'] = expanded;
                });
              },
              initiallyExpanded: result['isExpanded'] as bool,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Text(
                    result['answer'] as String,
                    style: const TextStyle(
                      color: AppColors.darkGrey,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 1),
          ],
        );
      },
    );
  }
}