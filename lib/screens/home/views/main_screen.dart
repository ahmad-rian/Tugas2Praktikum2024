import 'package:flutter/material.dart';
import 'package:tugas_2/screens/ui/form_data.dart';
import 'package:tugas_2/screens/ui/tampil_data.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  String nama = '';
  String nim = '';
  int tahun = DateTime.now().year;
  String alamat = '';
  String prodi = '';
  int angkatan = DateTime.now().year;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onSimpan(String newNama, String newNim, int newTahun, String newAlamat,
      String newProdi, int newAngkatan) {
    setState(() {
      nama = newNama;
      nim = newNim;
      tahun = newTahun;
      alamat = newAlamat;
      prodi = newProdi;
      angkatan = newAngkatan;
      _selectedIndex = 1; // Switch to TampilData screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Mahasiswa',
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
        backgroundColor: Color(0xFFB6CBDE), // Blue from the palette
      ),
      body: Container(
        color: Color(0xFFE3EDF7), // Light blue background
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            FormData(onSimpan: _onSimpan),
            TampilData(
              nama: nama,
              nim: nim,
              tahun: tahun,
              alamat: alamat,
              prodi: prodi,
              angkatan: angkatan,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Input Data',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perkenalan',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
