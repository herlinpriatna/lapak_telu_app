import 'package:flutter/material.dart';
import 'package:lapak_telu_app/screen/edit_profil_page.dart';
import 'package:lapak_telu_app/screen/login_page.dart';
import 'package:lapak_telu_app/screen/toko_page.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("Profil",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold))),
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage:
                          AssetImage('assets/images/logo_lapak.png'),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Muhammad Zulfadly'),
                        Text('Buah Batu'),
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    // Navigasi ke halaman edit profil ketika ikon edit diklik
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfilPage()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.edit, color: Colors.blue),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Navigasi ke halaman detail produk ketika produk diklik
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TokoPage(),
                  ),
                );
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.logout, color: Colors.blue),
                      SizedBox(width: 10),
                      Text('Lihat Toko Anda'),
                      Spacer(),
                      Icon(Icons.arrow_forward, color: Colors.blue),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10), // Menambahkan jarak vertikal antara kotak
            Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.settings,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 10),
                    Text('Pengaturan Aplikasi'),
                    Spacer(),
                    Icon(Icons.arrow_forward, color: Colors.blue),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (Route<dynamic> route) =>
                      false, // hapus semua rute di atas halaman login
                );
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.logout, color: Colors.blue),
                      SizedBox(width: 10),
                      Text('Keluar Akun'),
                      Spacer(),
                      Icon(Icons.arrow_forward, color: Colors.blue),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
