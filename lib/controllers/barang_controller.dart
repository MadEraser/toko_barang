import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/barang_model.dart';

class BarangController {
  Future<List<BarangModel>> ambilBarang() async {
    final String teks =
        await rootBundle.loadString('assets/data/barang.json');
    final List data = jsonDecode(teks);
    return data.map((e) => BarangModel.fromJson(e)).toList();
  }
}