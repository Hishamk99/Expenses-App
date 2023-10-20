import 'package:expenses_app/models/expense_model.dart';
import 'package:expenses_app/widget/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesBuilder extends StatelessWidget {
  const ExpensesBuilder(
      {super.key, required this.expensesList, required this.removeExpense});

  final List<ExpenseModel> expensesList;
  final void Function(ExpenseModel expense) removeExpense;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 22),
      child: ListView.builder(
        itemCount: expensesList.length,
        itemBuilder: (context, index) {
          return Dismissible(
            background: Container(
              color: Theme.of(context).colorScheme.error.withOpacity(.7),
              margin: Theme.of(context).cardTheme.margin,
              
            ),
            key: ValueKey(expensesList[index]),
            onDismissed: (direction) => removeExpense(expensesList[index]),
            child: ExpenseItem(
              item: expensesList[index],
            ),
          );
        },
      ),
    );
  }
}
