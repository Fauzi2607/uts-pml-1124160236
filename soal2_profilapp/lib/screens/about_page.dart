
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Me'),
        backgroundColor: Colors.red,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Tentang Saya',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          const Text(
            'Hobi',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const ListTile(
            leading: Icon(Icons.sports_football),
            title: Text('SepakBola'),
          ),

          const ListTile(
            leading: Icon(Icons.gamepad),
            title: Text('Game'),
          ),

          const Divider(),

          const Text(
            'Riwayat Pendidikan',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const ListTile(
            leading: Icon(Icons.school),
            title: Text(
              'Institut Teknologi dan Bisnis Bina Sarana Global',
            ),
            subtitle: Text('Program Studi Teknik Informatika'),
          ),

          const Divider(),

          const Text(
            'Pengalaman Kerja',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const ListTile(
            leading: Icon(Icons.work),
            title: Text('PT Angkasa Aviasi Servis'),
            subtitle: Text('2025 - Sekarang'),
          ),

          const ListTile(
            leading: Icon(Icons.work),
            title: Text('PT Mitsuba Indonesia'),
            subtitle: Text('2022 - 2024'),
          ),

          const ListTile(
            leading: Icon(Icons.work),
            title: Text('PT Selamat Sempurna Tbk'),
            subtitle: Text('2021 - 2022'),
          ),
        ],
      ),
    );
  }
}
