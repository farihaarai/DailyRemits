import 'package:expensetrack/widgets/expenses_list/expenses_list.dart';
import 'package:expensetrack/models/expense.dart';
import 'package:expensetrack/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 9.99,
      date: DateTime.now(),
      category: Category.leisure,
    )
  ];

  void _openAppExpenseOverlay() {
    showModalBottomSheet(
        context: context, builder: (ctx) => const NewExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expense Tracker'), actions: [
        IconButton(
          onPressed: _openAppExpenseOverlay,
          icon: const Icon(
            Icons.add,
            //color: Colors.black,
          ),
        )
      ]),
      body: Column(children: [
        const Text('The chart'),
        Expanded(
          child: ExpensesList(expenses: _registeredExpenses),
        )
      ]),
    );
  }
}
