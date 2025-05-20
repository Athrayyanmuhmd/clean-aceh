import 'package:flutter/material.dart';
import 'package:clean_aceh/utils/constants.dart';

class AddBankScreen extends StatefulWidget {
  const AddBankScreen({Key? key}) : super(key: key);

  @override
  State<AddBankScreen> createState() => _AddBankScreenState();
}

class _AddBankScreenState extends State<AddBankScreen> {
  final _formKey = GlobalKey<FormState>();
  
  String _selectedBank = '';
  final List<Map<String, dynamic>> _bankOptions = [
    {
      'name': 'BCA',
      'icon': Icons.account_balance,
      'color': Colors.blue,
    },
    {
      'name': 'BNI',
      'icon': Icons.account_balance,
      'color': Colors.orange,
    },
    {
      'name': 'Mandiri',
      'icon': Icons.account_balance,
      'color': Colors.blue.shade800,
    },
    {
      'name': 'BSI',
      'icon': Icons.account_balance,
      'color': Colors.green,
    },
    {
      'name': 'BRI',
      'icon': Icons.account_balance,
      'color': Colors.blue.shade300,
    },
    {
      'name': 'CIMB Niaga',
      'icon': Icons.account_balance,
      'color': Colors.red,
    },
  ];
  
  final TextEditingController _accountNumberController = TextEditingController();
  final TextEditingController _accountNameController = TextEditingController();
  
  @override
  void dispose() {
    _accountNumberController.dispose();
    _accountNameController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Rekening Bank'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Bank Selection
                const Text(
                  'Pilih Bank',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 12),
                
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: _bankOptions.map((bank) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedBank = bank['name'];
                        });
                      },
                      child: Container(
                        width: (MediaQuery.of(context).size.width - 44) / 2,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: _selectedBank == bank['name']
                              ? bank['color'].withOpacity(0.1)
                              : AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: _selectedBank == bank['name']
                                ? bank['color']
                                : AppColors.lightGrey,
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: bank['color'].withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                bank['icon'],
                                color: bank['color'],
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                bank['name'],
                                style: TextStyle(
                                  fontWeight: _selectedBank == bank['name']
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ),
                            if (_selectedBank == bank['name'])
                              Icon(
                                Icons.check_circle,
                                color: bank['color'],
                                size: 16,
                              ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                
                const SizedBox(height: 24),
                
                // Account Number
                const Text(
                  'Nomor Rekening',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _accountNumberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Masukkan nomor rekening',
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
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColors.primary),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nomor rekening tidak boleh kosong';
                    }
                    if (value.length < 8 || value.length > 20) {
                      return 'Nomor rekening tidak valid';
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: 16),
                
                // Account Name
                const Text(
                  'Nama Pemilik Rekening',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _accountNameController,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    hintText: 'Masukkan nama pemilik rekening',
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
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColors.primary),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama pemilik rekening tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: 16),
                
                // Info Message
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.info,
                        color: Colors.blue,
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Pastikan nomor rekening dan nama pemilik rekening yang Anda masukkan sudah benar untuk menghindari kegagalan transaksi.',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Added for spacing at the bottom
                const SizedBox(height: 100),
              ],
            ),
          ),
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
        child: ElevatedButton(
          onPressed: _selectedBank.isEmpty
              ? null
              : () {
                  if (_formKey.currentState!.validate()) {
                    // Save bank account
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Rekening $_selectedBank berhasil ditambahkan'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    Navigator.pop(context);
                    Navigator.pop(context); // Return to payment methods screen
                  }
                },
          style: ElevatedButton.styleFrom(
            disabledBackgroundColor: AppColors.lightGrey,
          ),
          child: const Text('Hubungkan'),
        ),
      ),
    );
  }
}