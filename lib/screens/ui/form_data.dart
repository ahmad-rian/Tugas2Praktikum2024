import 'package:flutter/material.dart';

class FormData extends StatefulWidget {
  final Function(String, String, int, String, String, int) onSimpan;

  const FormData({Key? key, required this.onSimpan}) : super(key: key);

  @override
  _FormDataState createState() => _FormDataState();
}

class _FormDataState extends State<FormData> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _alamatController = TextEditingController();
  final _prodiController = TextEditingController();
  late int _selectedYear;
  late int _selectedAngkatan;

  @override
  void initState() {
    super.initState();
    _selectedYear = DateTime.now().year - 20;
    _selectedAngkatan = DateTime.now().year;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(
                  labelText: 'Nama',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter a name' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _nimController,
                decoration: InputDecoration(
                  labelText: 'NIM',
                  prefixIcon: Icon(Icons.badge),
                ),
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter a NIM' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _alamatController,
                decoration: InputDecoration(
                  labelText: 'Alamat',
                  prefixIcon: Icon(Icons.home),
                ),
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter an address' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _prodiController,
                decoration: InputDecoration(
                  labelText: 'Prodi',
                  prefixIcon: Icon(Icons.school),
                ),
                validator: (value) => value?.isEmpty ?? true
                    ? 'Please enter a study program'
                    : null,
              ),
              SizedBox(height: 16),
              _buildDropdownMenu(
                label: 'Tahun Kelahiran',
                icon: Icons.calendar_today,
                value: _selectedYear,
                onChanged: (value) => setState(() => _selectedYear = value!),
                items: _generateYearList(),
              ),
              SizedBox(height: 16),
              _buildDropdownMenu(
                label: 'Angkatan',
                icon: Icons.school,
                value: _selectedAngkatan,
                onChanged: (value) =>
                    setState(() => _selectedAngkatan = value!),
                items: _generateAngkatanList(),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitForm,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text('Simpan',
                      style: TextStyle(fontSize: 18, color: Colors.black)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownMenu({
    required String label,
    required IconData icon,
    required int value,
    required void Function(int?) onChanged,
    required List<DropdownMenuEntry<int>> items,
  }) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return DropdownMenu<int>(
          width: constraints.maxWidth,
          initialSelection: value,
          onSelected: onChanged,
          dropdownMenuEntries: items,
          leadingIcon: Icon(icon),
          label: Text(label),
          textStyle: TextStyle(color: Colors.black, fontSize: 16),
          menuStyle: MenuStyle(
            maximumSize: MaterialStateProperty.all(Size.fromHeight(300)),
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
        );
      },
    );
  }

  List<DropdownMenuEntry<int>> _generateYearList() {
    int currentYear = DateTime.now().year;
    return List.generate(100, (index) => currentYear - index)
        .map((year) =>
            DropdownMenuEntry<int>(value: year, label: year.toString()))
        .toList();
  }

  List<DropdownMenuEntry<int>> _generateAngkatanList() {
    int currentYear = DateTime.now().year;
    return List.generate(10, (index) => currentYear - index)
        .map((year) =>
            DropdownMenuEntry<int>(value: year, label: year.toString()))
        .toList();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      widget.onSimpan(
        _namaController.text,
        _nimController.text,
        _selectedYear,
        _alamatController.text,
        _prodiController.text,
        _selectedAngkatan,
      );
    }
  }

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _alamatController.dispose();
    _prodiController.dispose();
    super.dispose();
  }
}
