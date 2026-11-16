import 'package:flutter/material.dart';
import 'package:soal2_profilapp/widgets/info_tile.dart';
import 'package:soal2_profilapp/models/profile.dart';

import 'about_page.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  final ValueChanged<ThemeMode> onThemeChanged;

  const ProfilePage({super.key, required this.onThemeChanged});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Profile profile = Profile(
    nama: 'Mohamad Fauzi',
    nim: '1124160236',
    kelas: 'TI 24 SE SH',
    prodi: 'Teknik Informatika',
    bio: 'Mahasiswa',
    email: 'mohamadfauzi2607@gmail.com',
    phone: '081316528610',
    github: 'Fauzi2607',
    photo: 'assets/profil.jpeg',
  );

  Future<void> _openEditProfile() async {
    final updatedProfile = await Navigator.push<Profile>(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfilePage(profile: profile),
      ),
    );

    if (!mounted) return;

    if (updatedProfile != null) {
      setState(() {
        profile = updatedProfile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _openEditProfile,
            icon: const Icon(Icons.edit),
            tooltip: 'Edit Profil',
          ),
        ],
        backgroundColor: Colors.blue.shade700,
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/profil.jpeg'),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    profile.nama,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Mahasiswa Teknik Informatika',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil Saya'),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About Me'),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
            ),

            const Divider(),

            SwitchListTile(
              secondary: const Icon(Icons.dark_mode),
              title: const Text('Dark Mode'),
              value: Theme.of(context).brightness == Brightness.dark,
              onChanged: (isDark) {
                widget.onThemeChanged(
                  isDark ? ThemeMode.dark : ThemeMode.light,
                );
              },
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openEditProfile,
        icon: const Icon(Icons.edit),
        label: const Text('Edit Profil'),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.blue.shade100,
                  backgroundImage: AssetImage(profile.photo),
                ),

                const SizedBox(height: 16),

                Text(
                  profile.nama,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                Text('NIM : ${profile.nim}'),
                Text('Prodi : ${profile.prodi}'),
                Text('Kelas : ${profile.kelas}'),

                const SizedBox(height: 12),

                Text(profile.bio, textAlign: TextAlign.center),

                const SizedBox(height: 20),

                Card(
                  child: Column(
                    children: [
                      InfoTile(
                        icon: Icons.email_outlined,
                        label: 'E-mail',
                        value: profile.email,
                      ),
                      const Divider(height: 1),
                      InfoTile(
                        icon: Icons.phone,
                        label: 'Phone Number',
                        value: profile.phone,
                      ),
                      const Divider(height: 1),
                      InfoTile(
                        icon: Icons.code,
                        label: 'Github',
                        value: profile.github,
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
