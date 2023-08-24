import 'package:flutter/material.dart';
import 'package:expensetrack/widgets/expenses.dart';

void main() {
  runApp(MaterialApp(
    // debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true),
    home: const Expenses(),
  ));
}
