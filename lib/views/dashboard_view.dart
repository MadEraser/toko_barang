import  'package:flutter/material.dart';
import 'package:toko_barang/models/user_model.dart';
import 'package:toko_barang/views/login_view.dart';
import '../controllers/auth_controller.dart';
import 'barang_view.dart';
import 'login_view.dart';

class DashboardView extends StatelessWidget{
  final UserModel user;
  const DashboardView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon : const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginView()));
            },
          )
        ],
      ),

      body:  Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: const Icon(Icons.person, size: 40,),
                title: Text('Halo, ${user.nama}'),
                subtitle: Text('Username ${user.username}'),
              ),
            ),
            const SizedBox(height:  16,),
            SizedBox(
              height: 52,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.inventory) ,
                label: const Text('Lihat data barang'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BarangView())
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}