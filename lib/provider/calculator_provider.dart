import 'package:flutter/material.dart';

class AngkaAkhirHarusLebihBesar implements Exception {}

class CalculatorProvider extends ChangeNotifier {
  List<int> listPrima = [];

  void hitungPrima({
    required int awal,
    required int akhir,
  }) {
    listPrima.clear();
    if (awal > akhir) {
      throw AngkaAkhirHarusLebihBesar();
    }
    for (int i = awal; i <= akhir; i++) {
      int counterPrime = 0;

      if (i <= 1) {
        continue; // asumsi bilangan prima dimulai dari angka 2 (syarat prima: dibagi 1 dan bukan dirinya)
      }
      for (int j = 1; j <= i; j++) {
        if (i % j == 0) {
          counterPrime++;
        }
      }
      // dibagi 1 dan dirinya sendiri
      if (counterPrime == 2) {
        listPrima.add(i);
      }
    }
    notifyListeners();
  }
}
