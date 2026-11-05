import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bonus Latihan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.purple, useMaterial3: true),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _indeksAktif = 0;

  final List<Widget> _halaman = const [
    TabBeranda(),
    TabCari(),
    TabProfil(),
  ];

  final List<String> _judul = const ['Beranda', 'Cari', 'Profil'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_judul[_indeksAktif])),
      body: IndexedStack(index: _indeksAktif, children: _halaman),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indeksAktif,
        onTap: (index) => setState(() => _indeksAktif = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Cari'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}

class TabBeranda extends StatelessWidget {
  const TabBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.home, size: 80),
          SizedBox(height: 12),
          Text('Halaman Beranda', style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}

class TabCari extends StatelessWidget {
  const TabCari({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Cari sesuatu...',
              border: OutlineInputBorder(),
            ),
          ),
          Expanded(
            child: Center(
              child: Text('Halaman Cari', style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }
}

class TabProfil extends StatelessWidget {
  const TabProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
          SizedBox(height: 12),
          Text('Halaman Profil', style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}