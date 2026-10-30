import 'package:flutter/material.dart';
import '../controllers/barang_controller.dart';

class BarangView extends StatelessWidget{
  BarangView({super.key});

  final BarangController controller = BarangController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title : const Text('Data Barang')),
      body: FutureBuilder(future: controller.ambilBarang(),
      builder: (context, snapshot) {
        if(snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator(),);
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error : ${snapshot.error}'));
        }
        final barang = snapshot.data!;
        return ListView.builder(
          itemCount: barang.length,
          itemBuilder: (context, i) {
            final b = barang[i];
            return Card(
              margin:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                leading: CircleAvatar(child: Text('$b.id'),),
                title: Text(b.nama),
                subtitle: Text('Harga: Rp ${b.harga}'),
                trailing: Text('Stok: ${b.stok}'),
              ),
            );
          },
        );
      },),
    );
  }
}