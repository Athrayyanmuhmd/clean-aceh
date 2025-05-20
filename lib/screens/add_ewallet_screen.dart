import 'package:flutter/material.dart';
import 'package:clean_aceh/utils/constants.dart';

class AddEWalletScreen extends StatefulWidget {
  const AddEWalletScreen({Key? key}) : super(key: key);

  @override
  State<AddEWalletScreen> createState() => _AddEWalletScreenState();
}

class _AddEWalletScreenState extends State<AddEWalletScreen> {
  final _formKey = GlobalKey<FormState>();
  
  String _selectedEWallet = '';
  final List<Map<String, dynamic>> _ewalletOptions = [
    {
      'name': 'DANA',
      'icon': Icons.account_balance_wallet,
      'color': Colors.blue,
    },
    {
      'name': 'GoPay',
      'icon': Icons.account_balance_wallet,
      'color': Colors.green,
    },
    {
      'name': 'OVO',
      'icon': Icons.account_balance_wallet,
      'color': Colors.purple,
    },
    {
      'name': 'LinkAja',
      'icon': Icons.account_balance_wallet,
      'color': Colors.red,
    },
    {
      'name': 'ShopeePay',
      'icon': Icons.account_balance_wallet,
      'color': Colors.orange,
    },
  ];
  
  final TextEditingController _phoneController = TextEditingController();
  
  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah E-Wallet'),
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
                // E-Wallet Selection
                const Text(
                  'Pilih E-Wallet',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 12),
                
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: _ewalletOptions.map((wallet) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedEWallet = wallet['name'];
                        });
                      },
                      child: Container(
                        width: (MediaQuery.of(context).size.width - 44) / 2,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: _selectedEWallet == wallet['name']
                              ? wallet['color'].withOpacity(0.1)
                              : AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: _selectedEWallet == wallet['name']
                                ? wallet['color']
                                : AppColors.lightGrey,
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: wallet['color'].withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                wallet['icon'],
                                color: wallet['color'],
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                wallet['name'],
                                style: TextStyle(
                                  fontWeight: _selectedEWallet == wallet['name']
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ),
                            if (_selectedEWallet == wallet['name'])
                              Icon(
                                Icons.check_circle,
                                color: wallet['color'],
                                size: 16,
                              ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                
                const SizedBox(height: 24),
                
                // Phone Number
                const Text(
                  'Nomor Telepon',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Masukkan nomor telepon',
                    prefixText: '+62 ',
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
                      return 'Nomor telepon tidak boleh kosong';
                    }
                    if (value.length < 9 || value.length > 12) {
                      return 'Nomor telepon tidak valid';
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
                          'Pastikan nomor telepon yang Anda masukkan terdaftar pada akun e-wallet Anda.',
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
          onPressed: _selectedEWallet.isEmpty
              ? null
              : () {
                  if (_formKey.currentState!.validate()) {
                    // Save e-wallet
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('$_selectedEWallet berhasil ditambahkan'),
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