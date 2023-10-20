import 'package:expenses_app/constant.dart';
import 'package:expenses_app/models/expense_model.dart';
import 'package:flutter/material.dart';

import 'chart-bar.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});
  final List<ExpenseModel> expenses;
  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(expenses, Category.food),
      ExpenseBucket.forCategory(expenses, Category.leisure),
      ExpenseBucket.forCategory(expenses, Category.travel),
      ExpenseBucket.forCategory(expenses, Category.work),
    ];
  }

  get maxTotalExpense {
    double maxTotalExpense = 0;
    for (var element in buckets) {
      if (element.totalExpense > maxTotalExpense) {
        maxTotalExpense = element.totalExpense;
      }
    }
    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 175,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(.3),
            Theme.of(context).colorScheme.primary.withOpacity(0),
          ],
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final e in buckets)
                  ChartBar(
                    fill: e.totalExpense == 0
                        ? 0
                        : e.totalExpense / maxTotalExpense,
                  ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
              children: buckets
                  .map(
                    (e) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Icon(
                          categoryIcon[e.category],
                          color: isDark
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(.7),
                        ),
                      ),
                    ),
                  )
                  .toList()),
        ],
      ),
    );
  }
}
