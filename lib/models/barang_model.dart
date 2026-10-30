

class BarangModel {
  final int id;
  final String nama;
  final int harga;
  final int stok;

  BarangModel ({
    required this.id,
    required this.nama,
    required this.harga,
    required this.stok
  });

  factory BarangModel.fromJson(Map<String, dynamic> json) {
    return BarangModel(id: json['id'], nama: json['nama'], harga: json['harga'], stok: json['stok']);
  }
}