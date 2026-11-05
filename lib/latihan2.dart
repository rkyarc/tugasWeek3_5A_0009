import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class Produk {
  final String nama;
  final int harga;

  const Produk({required this.nama, required this.harga});
}

const List<Produk> daftarProduk = [
  Produk(nama: 'Laptop', harga: 8500000),
  Produk(nama: 'Smartphone', harga: 4200000),
  Produk(nama: 'Headphone', harga: 750000),
];

String formatRupiah(int angka) {
  final s = angka.toString();
  final buffer = StringBuffer();
  for (int i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) buffer.write('.');
    buffer.write(s[i]);
  }
  return 'Rp $buffer';
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan 2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.teal, useMaterial3: true),
      home: const DaftarProdukPage(),
    );
  }
}

class DaftarProdukPage extends StatelessWidget {
  const DaftarProdukPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Produk')),
      body: ListView.builder(
        itemCount: daftarProduk.length,
        itemBuilder: (context, index) {
          final produk = daftarProduk[index];
          return ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: Text(produk.nama),
            subtitle: Text(formatRupiah(produk.harga)),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailProdukPage(produk: produk),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailProdukPage extends StatelessWidget {
  final Produk produk;

  const DetailProdukPage({super.key, required this.produk});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Produk')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(child: Icon(Icons.shopping_bag, size: 100)),
            const SizedBox(height: 24),
            const Text('Nama Produk', style: TextStyle(color: Colors.grey)),
            Text(
              produk.nama,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text('Harga', style: TextStyle(color: Colors.grey)),
            Text(
              formatRupiah(produk.harga),
              style: const TextStyle(fontSize: 22),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Kembali'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}