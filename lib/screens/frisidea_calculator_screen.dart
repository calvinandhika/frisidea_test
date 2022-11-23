import 'package:flutter/material.dart';
import 'package:frisidea_test/provider/calculator_provider.dart';
import 'package:frisidea_test/screens/profile_screen.dart';
import 'package:frisidea_test/utilities/show_error_dialog.dart';
import 'package:provider/provider.dart';

class FrisdeaCalculator extends StatefulWidget {
  const FrisdeaCalculator({Key? key}) : super(key: key);

  @override
  State<FrisdeaCalculator> createState() => _FrisdeaCalculatorState();
}

class _FrisdeaCalculatorState extends State<FrisdeaCalculator> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _numController1 = TextEditingController();
  final TextEditingController _numController2 = TextEditingController();

  @override
  void dispose() {
    _numController1.dispose();
    _numController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
            icon: const Icon(Icons.person),
          )
        ],
        title: const Text('Frisidea Calculator'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _numController1,
                decoration: const InputDecoration(
                  hintText: 'Masukan angka awal',
                ),
              ),
              TextFormField(
                controller: _numController2,
                decoration: const InputDecoration(
                  hintText: 'Masukan angka akhir',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  try {
                    context.read<CalculatorProvider>().hitungPrima(
                          awal: int.parse(_numController1.text),
                          akhir: int.parse(_numController2.text),
                        );
                  } on FormatException catch (_) {
                    showErrorDialog('Hanya Masukan Angka integer', context);
                  } on AngkaAkhirHarusLebihBesar catch (_) {
                    showErrorDialog('Angka akhir harus lebih besar', context);
                  }
                },
                child: const Text('Cari Bilangan Prima'),
              ),
              Consumer<CalculatorProvider>(
                builder: (context, value, child) {
                  if (value.listPrima.isNotEmpty) {
                    return Text(
                        'List bilangan Prima: ${value.listPrima.toString()}');
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
