import 'package:flutter/material.dart';
import 'package:clean_aceh/utils/constants.dart';
import 'package:clean_aceh/screens/payment_screen.dart';

class ServiceDetailScreen extends StatefulWidget {
  final String cleanerName;
  final String cleanerInitial;
  final int jobCount;
  final double price;

  const ServiceDetailScreen({
    Key? key,
    required this.cleanerName,
    required this.cleanerInitial,
    required this.jobCount,
    required this.price,
  }) : super(key: key);

  @override
  State<ServiceDetailScreen> createState() => _ServiceDetailScreenState();
}

class _ServiceDetailScreenState extends State<ServiceDetailScreen> {
  DateTime selectedDate = DateTime.now().add(const Duration(days: 1));
  String selectedTime = '12:00';
  List<String> selectedAreas = ['Dapur', 'Kamar Mandi (1)'];
  double totalPrice = 0;

  @override
  void initState() {
    super.initState();
    totalPrice = widget.price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesan ${widget.cleanerName}'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
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
                  children: [
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
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.cleanerName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${widget.jobCount} pekerjaan',
                          style: const TextStyle(
                            color: AppColors.grey,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: const [
                            Icon(Icons.star, color: Colors.amber, size: 18),
                            SizedBox(width: 5),
                            Text(
                              '4.8 (230 ulasan)',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 20),
              
              const Text(
                'Deskripsi',
                style: AppTextStyles.heading2,
              ),
              const SizedBox(height: 10),
              const Text(
                'Layanan pembersihan profesional dengan peralatan dan bahan pembersih berkualitas. Ahli dalam membersihkan segala area rumah dengan rapi dan efisien.',
                style: AppTextStyles.bodyText,
              ),
              
              const SizedBox(height: 20),
              
              const Text(
                'Area Pembersihan',
                style: AppTextStyles.heading2,
              ),
              const SizedBox(height: 10),
              
              _buildAreaCheckbox('Ruang Tamu', 25000),
              _buildAreaCheckbox('Kamar Tidur (2)', 50000),
              _buildAreaCheckbox('Dapur', 25000, isSelected: true),
              _buildAreaCheckbox('Kamar Mandi (1)', 25000, isSelected: true),
              
              TextButton(
                onPressed: () {},
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add, color: AppColors.primary),
                    SizedBox(width: 5),
                    Text(
                      'Tambah area lain', 
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 20),
              
              const Text(
                'Tanggal & Waktu',
                style: AppTextStyles.heading2,
              ),
              const SizedBox(height: 15),
              
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildDateOption('Senin', '28', 'April', 
                        isSelected: false),
                    _buildDateOption('Selasa', '29', 'April', 
                        isSelected: true),
                    _buildDateOption('Rabu', '30', 'April', 
                        isSelected: false),
                    _buildDateOption('Kamis', '1', 'Mei', 
                        isSelected: false),
                  ],
                ),
              ),
              
              const SizedBox(height: 15),
              
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildTimeOption('08:00'),
                    _buildTimeOption('10:00'),
                    _buildTimeOption('12:00', isSelected: true),
                    _buildTimeOption('14:00'),
                    _buildTimeOption('16:00'),
                    _buildTimeOption('18:00'),
                  ],
                ),
              ),
              
              const SizedBox(height: 20),
              
              const Text(
                'Catatan Tambahan',
                style: AppTextStyles.heading2,
              ),
              const SizedBox(height: 10),
              TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Tambahkan instruksi khusus untuk pembersih...',
                  filled: true,
                  fillColor: AppColors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(15),
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
                const Text(
                  'Total Biaya',
                  style: TextStyle(
                    color: AppColors.grey,
                  ),
                ),
                Text(
                  'Rp${totalPrice.toInt()}',
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentScreen(
                      cleanerName: widget.cleanerName,
                      cleanerInitial: widget.cleanerInitial,
                      totalPrice: totalPrice,
                    ),
                  ),
                );
              },
              child: const Text('Lanjutkan'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAreaCheckbox(String title, double price, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: CheckboxListTile(
        title: Text(title),
        subtitle: Text('+ Rp${price.toInt()}'),
        value: isSelected || selectedAreas.contains(title),
        activeColor: AppColors.primary,
        checkColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onChanged: (bool? value) {
          setState(() {
            if (value == true) {
              if (!selectedAreas.contains(title)) {
                selectedAreas.add(title);
                totalPrice += price;
              }
            } else {
              selectedAreas.remove(title);
              totalPrice -= price;
            }
          });
        },
      ),
    );
  }

  Widget _buildDateOption(String day, String date, String month, {bool isSelected = false}) {
    return GestureDetector(
      onTap: () {
        setState(() {
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              day,
              style: TextStyle(
                color: isSelected ? AppColors.white : AppColors.grey,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              date,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: isSelected ? AppColors.white : AppColors.black,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              month,
              style: TextStyle(
                color: isSelected ? AppColors.white : AppColors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeOption(String time, {bool isSelected = false}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTime = time;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected || selectedTime == time ? AppColors.primary : AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          time,
          style: TextStyle(
            color: isSelected || selectedTime == time ? AppColors.white : AppColors.black,
          ),
        ),
      ),
    );
  }
}