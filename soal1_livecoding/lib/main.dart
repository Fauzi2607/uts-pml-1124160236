import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Mohamad Fauzi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      home: ProfilPage(),
    );
  }
}

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        centerTitle: true,

        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Halaman pengaturan profil')),
              );
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.deepPurple,
                  child: Icon(Icons.person, size: 70, color: Colors.white),
                ),
                SizedBox(height: 5),
                Text(
                  'Mohamad Fauzi',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(height: 5),
                Text(
                  '1124160236',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 5),
                Text(
                  'Teknik Informatika',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),

                SizedBox(height: 5),
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Kontak'),
                      InfoTile(
                        icon: Icons.email,
                        label: 'Email',
                        value: 'mohamadfauzi2607.com',
                      ),
                      InfoTile(
                        icon: Icons.phone,
                        label: 'No HP: ',
                        value: '081316528610',
                      ),
                      InfoTile(
                        icon: Icons.school,
                        label: 'Kelas : ',
                        value: 'TI SE 24 SH',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Card(
                  child: Column(
                    children: [
                      Text('Pengalaman'),
                      InfoTile(
                        icon: Icons.work,
                        label: 'Pengalaman 3 (2024 - sekarang)',
                        value: 'PT Angkasa Aviasi Servis',
                      ),
                      InfoTile(
                        icon: Icons.work,
                        label: 'Pengalaman 2 (2022 - 2024)',
                        value: 'PT Mitsuba indonesia',
                      ),
                      InfoTile(
                        icon: Icons.work,
                        label: 'Pengalaman 1 (2021 - 2022)',
                        value: 'PT Selamat Sempurna Tbk',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  const InfoTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      subtitle: Text(value),
    );
  }
}
