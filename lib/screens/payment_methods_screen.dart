import 'package:flutter/material.dart';
import 'package:clean_aceh/utils/constants.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  final List<Map<String, dynamic>> _paymentMethods = [
    {
      'type': 'E-Wallet',
      'name': 'DANA',
      'number': '0812****9706',
      'icon': Icons.account_balance_wallet,
      'isConnected': true,
    },
    {
      'type': 'E-Wallet',
      'name': 'GoPay',
      'number': '0812****9706',
      'icon': Icons.account_balance_wallet,
      'isConnected': true,
    },
    {
      'type': 'Bank',
      'name': 'Bank BCA',
      'number': '****9706',
      'icon': Icons.account_balance,
      'isConnected': true,
    },
    {
      'type': 'Bank',
      'name': 'Bank BSI',
      'number': null,
      'icon': Icons.account_balance,
      'isConnected': false,
    },
    {
      'type': 'E-Wallet',
      'name': 'OVO',
      'number': null,
      'icon': Icons.account_balance_wallet,
      'isConnected': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Metode Pembayaran'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'E-Wallet',
              style: AppTextStyles.heading2,
            ),
            const SizedBox(height: 16),
            ...buildPaymentMethodsByType('E-Wallet'),
            
            const SizedBox(height: 24),
            
            const Text(
              'Bank',
              style: AppTextStyles.heading2,
            ),
            const SizedBox(height: 16),
            ...buildPaymentMethodsByType('Bank'),
            
            const SizedBox(height: 24),
            
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  _showAddPaymentMethodDialog(context);
                },
                icon: const Icon(Icons.add),
                label: const Text('Tambah Metode Pembayaran'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.white,
                  foregroundColor: AppColors.primary,
                  elevation: 0,
                  side: const BorderSide(color: AppColors.primary),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  List<Widget> buildPaymentMethodsByType(String type) {
    List<Widget> widgets = [];
    
    for (var method in _paymentMethods) {
      if (method['type'] == type) {
        widgets.add(
          _buildPaymentMethodCard(
            icon: method['icon'],
            name: method['name'],
            number: method['number'],
            isConnected: method['isConnected'],
          ),
        );
        widgets.add(const SizedBox(height: 12));
      }
    }
    
    return widgets;
  }
  
  Widget _buildPaymentMethodCard({
    required IconData icon,
    required String name,
    String? number,
    required bool isConnected,
  }) {
    return Container(
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
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: AppColors.primary,
              size: 24,
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
                if (number != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    number,
                    style: const TextStyle(
                      color: AppColors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (isConnected)
            PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'edit',
                  child: Text('Edit'),
                ),
                const PopupMenuItem(
                  value: 'delete',
                  child: Text('Hapus'),
                ),
              ],
              onSelected: (value) {
                if (value == 'delete') {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Hapus Metode Pembayaran'),
                      content: Text('Yakin ingin menghapus $name dari metode pembayaran Anda?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Batal'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            setState(() {
                              _paymentMethods.removeWhere((element) => 
                                element['name'] == name && element['type'] == (icon == Icons.account_balance ? 'Bank' : 'E-Wallet'));
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('$name telah dihapus'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: const Text('Hapus'),
                        ),
                      ],
                    ),
                  );
                }
              },
            )
          else
            TextButton(
              onPressed: () {
                setState(() {
                  for (int i = 0; i < _paymentMethods.length; i++) {
                    if (_paymentMethods[i]['name'] == name) {
                      _paymentMethods[i]['isConnected'] = true;
                      _paymentMethods[i]['number'] = '****' + (1000 + i).toString();
                      break;
                    }
                  }
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$name berhasil dihubungkan'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              child: const Text(
                'Hubungkan',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
  
  void _showAddPaymentMethodDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tambah Metode Pembayaran',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              _buildAddPaymentMethodOption(
                context: context,
                icon: Icons.account_balance_wallet,
                title: 'E-Wallet',
                description: 'DANA, GoPay, OVO, dll',
              ),
              const SizedBox(height: 16),
              _buildAddPaymentMethodOption(
                context: context,
                icon: Icons.account_balance,
                title: 'Bank',
                description: 'BCA, BNI, Mandiri, BSI, dll',
              ),
            ],
          ),
        );
      },
    );
  }
  
  Widget _buildAddPaymentMethodOption({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String description,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Tambah $title'),
          ),
        );
      },
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
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: AppColors.primary,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
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
                    description,
                    style: const TextStyle(
                      color: AppColors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.grey,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}