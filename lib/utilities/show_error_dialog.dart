import 'package:flutter/material.dart';

Future<void> showErrorDialog(title, context) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: const Text(
            'Terjadi kesalahan pastikan kembali angka yang dimasukan ke dalam form'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Ok'),
          ),
        ],
      );
    },
  );
}
