import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan 3',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.deepOrange, useMaterial3: true),
      initialRoute: '/',
      routes: {
        '/': (context) => const HalamanSatu(),
        '/dua': (context) => const HalamanDua(),
        '/tiga': (context) => const HalamanTiga(),
      },
    );
  }
}

class HalamanSatu extends StatelessWidget {
  const HalamanSatu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman 1')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Halaman 1', style: TextStyle(fontSize: 22)),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/dua',
                  arguments: 'Halo dari Halaman 1!',
                );
              },
              child: const Text('Ke Halaman 2 (kirim pesan)'),
            ),
          ],
        ),
      ),
    );
  }
}

class HalamanDua extends StatelessWidget {
  const HalamanDua({super.key});

  @override
  Widget build(BuildContext context) {
    final pesan = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: const Text('Halaman 2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Halaman 2', style: TextStyle(fontSize: 22)),
            const SizedBox(height: 12),
            Text('Argumen diterima: $pesan'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/tiga'),
              child: const Text('Ke Halaman 3'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}

class HalamanTiga extends StatelessWidget {
  const HalamanTiga({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman 3')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Halaman 3', style: TextStyle(fontSize: 22)),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.popUntil(
                context,
                ModalRoute.withName('/'),
              ),
              child: const Text('Kembali ke Halaman 1'),
            ),
          ],
        ),
      ),
    );
  }
}