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
      isScrollControlled: true,
      // shape: const RoundedRectangleBorder(
      //   borderRadius: BorderRadius.vertical(
      //     top: Radius.circular(25.0),
      //   ),
      // ),
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("Expense Deleted"),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        )));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text("No expenses found!! Start Adding Some..."),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
          expenses: _registeredExpenses, onRemoveExpense: _removeExpense);
    }
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
          child: mainContent,
        )
      ]),
    );
  }
}
