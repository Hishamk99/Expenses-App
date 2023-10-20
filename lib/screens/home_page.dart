import 'package:expenses_app/models/expense_model.dart';
import 'package:expenses_app/widget/chart/chart.dart';
import 'package:expenses_app/widget/expense_builder.dart';
import 'package:expenses_app/widget/new_expenses.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ExpenseModel> expensesList = [
    ExpenseModel(
        category: Category.work,
        title: 'Flutter course',
        price: 98.4,
        date: DateTime.now()),
    ExpenseModel(
        category: Category.leisure,
        title: 'Cenima',
        price: 55.4,
        date: DateTime.now()),
    ExpenseModel(
        category: Category.food,
        title: 'Breakfast',
        price: 32.4,
        date: DateTime.now()),
    ExpenseModel(
        category: Category.food,
        title: 'Breakfast',
        price: 32.4,
        date: DateTime.now()),
  ];

  void addExpense(ExpenseModel expense) {
    setState(() {
      expensesList.add(expense);
    });
  }

  void removeExpense(ExpenseModel expense) {
    setState(() {
      expensesList.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Flutter ExpenseTracker',
            //style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          //backgroundColor: Colors.transparent,
          //elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      context: context,
                      builder: (context) {
                        return NewExpenses(
                          addExpense: addExpense,
                        );
                      });
                },
                icon: const Icon(
                  Icons.add,
                  //color: Colors.black,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Chart(
              expenses: expensesList,
            ),
            Expanded(
              child: ExpensesBuilder(
                expensesList: expensesList,
                removeExpense: removeExpense,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
