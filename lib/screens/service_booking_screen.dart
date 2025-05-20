import 'package:flutter/material.dart';
import 'package:clean_aceh/utils/constants.dart';
import 'package:clean_aceh/screens/payment_screen.dart';

class ServiceBookingScreen extends StatefulWidget {
  final String serviceType;
  final String serviceImage;
  final double basePrice;
  
  const ServiceBookingScreen({
    super.key,
    required this.serviceType,
    required this.serviceImage,
    required this.basePrice,
  });
  
  @override
  State<ServiceBookingScreen> createState() => _ServiceBookingScreenState();
}

class _ServiceBookingScreenState extends State<ServiceBookingScreen> {
  final List<bool> _selectedSizes = [false, true, false];
  final List<String> _sizeLabels = ['Kecil', 'Sedang', 'Besar'];
  final List<double> _sizePrices = [100000, 150000, 200000];
  
  final List<Map<String, dynamic>> _additionalServices = [
    {
      'name': 'Pembersihan dalam lemari',
      'price': 50000,
      'isSelected': false,
    },
    {
      'name': 'Pembersihan jendela',
      'price': 30000,
      'isSelected': false,
    },
    {
      'name': 'Pembersihan perabotan',
      'price': 45000,
      'isSelected': false,
    },
    {
      'name': 'Layanan disinfektan',
      'price': 60000,
      'isSelected': false,
    },
  ];
  
  DateTime _selectedDate = DateTime.now().add(const Duration(days: 1));
  String _selectedTime = '12:00';
  String _selectedCleaner = 'Pilih Pembersih';
  
  final TextEditingController _notesController = TextEditingController();
  
  double _calculateTotalPrice() {
    // Base price for selected size
    double total = 0;
    for (int i = 0; i < _selectedSizes.length; i++) {
      if (_selectedSizes[i]) {
        total = _sizePrices[i];
        break;
      }
    }
    
    // Add price for additional services
    for (var service in _additionalServices) {
      if (service['isSelected']) {
        total += service['price'];
      }
    }
    
    return total;
  }
  
  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesan ${widget.serviceType}'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Service Banner
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primary,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    _getServiceIcon(),
                    color: AppColors.white,
                    size: 80,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.serviceType,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
            
            // Service Description
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Deskripsi',
                    style: AppTextStyles.heading2,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _getServiceDescription(),
                    style: const TextStyle(
                      color: AppColors.darkGrey,
                      height: 1.5,
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Size Selection
                  const Text(
                    'Ukuran Area',
                    style: AppTextStyles.heading2,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: List.generate(_sizeLabels.length, (index) {
                        return Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                for (int i = 0; i < _selectedSizes.length; i++) {
                                  _selectedSizes[i] = (i == index);
                                }
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: _selectedSizes[index] ? AppColors.white : Colors.transparent,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: _selectedSizes[index] ? [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                  ),
                                ] : null,
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    _sizeLabels[index],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: _selectedSizes[index] ? FontWeight.bold : FontWeight.normal,
                                      color: _selectedSizes[index] ? AppColors.primary : AppColors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Rp${_sizePrices[index].toInt()}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: _selectedSizes[index] ? AppColors.primary : AppColors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Additional Services
                  const Text(
                    'Layanan Tambahan',
                    style: AppTextStyles.heading2,
                  ),
                  const SizedBox(height: 8),
                  Column(
                    children: _additionalServices.map((service) {
                      return CheckboxListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(service['name']),
                            Text(
                              '+ Rp${service['price'].toInt()}',
                              style: TextStyle(
                                color: service['isSelected'] ? AppColors.primary : AppColors.grey,
                                fontWeight: service['isSelected'] ? FontWeight.bold : FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        value: service['isSelected'],
                        activeColor: AppColors.primary,
                        onChanged: (bool? value) {
                          setState(() {
                            service['isSelected'] = value!;
                          });
                        },
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                      );
                    }).toList(),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Date Selection
                  const Text(
                    'Tanggal',
                    style: AppTextStyles.heading2,
                  ),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: _selectedDate,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 30)),
                      );
                      if (pickedDate != null && pickedDate != _selectedDate) {
                        setState(() {
                          _selectedDate = pickedDate;
                        });
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.lightGrey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Icon(
                            Icons.calendar_today,
                            color: AppColors.primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Time Selection
                  const Text(
                    'Waktu',
                    style: AppTextStyles.heading2,
                  ),
                  const SizedBox(height: 8),
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
                  
                  const SizedBox(height: 24),
                  
                  // Cleaner Selection
                  const Text(
                    'Pembersih',
                    style: AppTextStyles.heading2,
                  ),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: () {
                      _showCleanerSelectionDialog(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.lightGrey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _selectedCleaner,
                            style: TextStyle(
                              fontWeight: _selectedCleaner != 'Pilih Pembersih' ? FontWeight.bold : FontWeight.normal,
                              color: _selectedCleaner != 'Pilih Pembersih' ? AppColors.black : AppColors.grey,
                            ),
                          ),
                          const Icon(
                            Icons.person_search,
                            color: AppColors.primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Additional Notes
                  const Text(
                    'Catatan Tambahan',
                    style: AppTextStyles.heading2,
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _notesController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Tambahkan instruksi khusus untuk pembersih...',
                      filled: true,
                      fillColor: AppColors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
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
                const Text(
                  'Total',
                  style: TextStyle(
                    color: AppColors.grey,
                  ),
                ),
                Text(
                  'Rp${_calculateTotalPrice().toInt()}',
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
                if (_selectedCleaner == 'Pilih Pembersih') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Silakan pilih pembersih terlebih dahulu'),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }
                
                // Navigate to payment screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentScreen(
                      cleanerName: _selectedCleaner,
                      cleanerInitial: _getCleanerInitial(_selectedCleaner),
                      totalPrice: _calculateTotalPrice(),
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
              child: const Text('Lanjutkan'),
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
          _selectedTime = time;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: time == _selectedTime ? AppColors.primary : AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: time == _selectedTime ? Colors.transparent : AppColors.lightGrey,
          ),
        ),
        child: Text(
          time,
          style: TextStyle(
            color: time == _selectedTime ? AppColors.white : AppColors.black,
          ),
        ),
      ),
    );
  }
  
  void _showCleanerSelectionDialog(BuildContext context) {
    final cleaners = [
      {'name': 'Ganang Setyo Hadi', 'rating': 4.9, 'jobs': 124},
      {'name': 'Rafli Afriza Nugraha', 'rating': 4.7, 'jobs': 44},
      {'name': 'Fadlul Ihsan', 'rating': 4.8, 'jobs': 1087},
      {'name': 'Putri Ramadhani', 'rating': 4.6, 'jobs': 78},
      {'name': 'Ahmad Dani', 'rating': 4.5, 'jobs': 56},
    ];
    
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Pilih Pembersih',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: cleaners.length,
                  itemBuilder: (context, index) {
                    final cleaner = cleaners[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppColors.primary,
                        child: Text(
                          _getCleanerInitial(cleaner['name'] as String),
                          style: const TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        cleaner['name'] as String,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '${cleaner['jobs']} pekerjaan • ${cleaner['rating']} ★',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _selectedCleaner = cleaner['name'] as String;
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
  
  IconData _getServiceIcon() {
    switch (widget.serviceType) {
      case 'Pembersihan Umum':
        return Icons.cleaning_services;
      case 'Pembersihan Dapur':
        return Icons.kitchen;
      case 'Pembersihan Kamar Mandi':
        return Icons.bathtub;
      case 'Pembersihan Furnitur':
        return Icons.chair;
      default:
        return Icons.home;
    }
  }
  
  String _getServiceDescription() {
    switch (widget.serviceType) {
      case 'Pembersihan Umum':
        return 'Layanan pembersihan menyeluruh untuk seluruh rumah atau area tertentu, termasuk menyapu, mengepel, mengelap permukaan, dan membersihkan debu. Cocok untuk pembersihan rutin agar rumah tetap bersih dan nyaman.';
      case 'Pembersihan Dapur':
        return 'Layanan pembersihan khusus untuk area dapur, termasuk membersihkan peralatan dapur, kabinet, microwave, oven, kulkas bagian luar, dan wastafel. Pembersihan menyeluruh untuk menjaga kebersihan dan higienitas dapur Anda.';
      case 'Pembersihan Kamar Mandi':
        return 'Layanan pembersihan mendalam untuk kamar mandi, termasuk membersihkan toilet, shower, bathtub, wastafel, cermin, dan lantai. Dilengkapi dengan disinfektan untuk memastikan kebersihan dan kesehatan.';
      case 'Pembersihan Furnitur':
        return 'Layanan pembersihan khusus untuk furnitur rumah seperti sofa, kursi, meja, lemari, dan tempat tidur. Menggunakan teknik dan bahan yang sesuai untuk berbagai jenis material furnitur.';
      default:
        return 'Layanan pembersihan profesional dengan tenaga terlatih dan bahan berkualitas untuk memastikan kepuasan pelanggan.';
    }
  }
  
  String _getCleanerInitial(String name) {
    final nameParts = name.split(' ');
    if (nameParts.length > 1) {
      return '${nameParts[0][0]}${nameParts[1][0]}';
    } else if (nameParts.isNotEmpty) {
      return nameParts[0][0];
    }
    return '';
  }
}