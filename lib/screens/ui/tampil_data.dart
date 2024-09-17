import 'package:flutter/material.dart';

class TampilData extends StatelessWidget {
  final String nama;
  final String nim;
  final int tahun;
  final String alamat;
  final String prodi;
  final int angkatan;

  const TampilData({
    Key? key,
    required this.nama,
    required this.nim,
    required this.tahun,
    required this.alamat,
    required this.prodi,
    required this.angkatan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int umur = DateTime.now().year - tahun;
    return Center(
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Perkenalan",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                ),
                SizedBox(height: 24),
                _buildInfoRow(context, 'Nama', nama),
                SizedBox(height: 8),
                _buildInfoRow(context, 'NIM', nim),
                SizedBox(height: 8),
                _buildInfoRow(context, 'Umur', '$umur tahun'),
                SizedBox(height: 8),
                _buildInfoRow(context, 'Alamat', alamat),
                SizedBox(height: 8),
                _buildInfoRow(context, 'Prodi', prodi),
                SizedBox(height: 8),
                _buildInfoRow(context, 'Angkatan', angkatan.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
