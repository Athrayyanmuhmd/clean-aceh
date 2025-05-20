import 'package:flutter/material.dart';
import 'package:clean_aceh/utils/constants.dart';
import 'package:clean_aceh/screens/add_address_screen.dart';

class SavedAddressesScreen extends StatelessWidget {
  const SavedAddressesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alamat Tersimpan'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            _buildAddressItem(
              label: 'Rumah',
              address: 'Jl. Teuku Umar No. 24, Banda Aceh',
              note: 'Rumah Warna Putih Pagar Hitam',
              isMain: true,
            ),
            _buildAddressItem(
              label: 'Kantor',
              address: 'Jl. Iskandar Muda No. 15, Banda Aceh',
              note: 'Lantai 3, Gedung Permata',
              isMain: false,
            ),
            _buildAddressItem(
              label: 'Apartemen',
              address: 'Apartment Grand Aceh, Unit 128, Banda Aceh',
              note: 'Kode akses: 2580',
              isMain: false,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddAddressScreen(),
            ),
          );
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildAddressItem({
    required String label,
    required String address,
    String? note,
    required bool isMain,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
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
          ListTile(
            title: Row(
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 10),
                if (isMain)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'Utama',
                      style: TextStyle(
                        fontSize: 10,
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Text(address),
                if (note != null) ...[
                  const SizedBox(height: 5),
                  Text(
                    note,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ],
            ),
            trailing: PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'edit',
                  child: Text('Edit'),
                ),
                if (!isMain)
                  const PopupMenuItem(
                    value: 'set_main',
                    child: Text('Jadikan Utama'),
                  ),
                const PopupMenuItem(
                  value: 'delete',
                  child: Text('Hapus'),
                ),
              ],
              onSelected: (value) {
              },
            ),
          ),
        ],
      ),
    );
  }
}