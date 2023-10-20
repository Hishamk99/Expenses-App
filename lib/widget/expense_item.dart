import 'package:expenses_app/constant.dart';
import 'package:expenses_app/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.item});

  final ExpenseModel item;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: paddingLength, vertical: paddingLength),
      child: Column(
        children: [
          Text(item.title , style: Theme.of(context).textTheme.titleLarge,),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(r'$ ' + item.price.toStringAsFixed(2)),
              const Spacer(),
              Row(children: [
                Icon(categoryIcon[item.category]),
                const SizedBox(width: 5,),
                Text(item.formattedData()),
              ],),
            ],
          )
        ],
      ),
    ));
  }
}
