import 'package:flutter/material.dart';
import 'package:frisidea_test/provider/calculator_provider.dart';
import 'package:frisidea_test/screens/frisidea_calculator_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<CalculatorProvider>(
            create: (context) => CalculatorProvider(),
          )
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Frisidea Calculator',
          home: FrisdeaCalculator(),
        ),
      ),
    );
