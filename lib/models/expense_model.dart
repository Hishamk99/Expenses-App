import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final dateTime = DateFormat.yMd();

enum Category { food, travel, work, leisure }

class ExpenseModel {
  final String id;
  final String title;
  final double price;
  final DateTime date;
  final Category category;

  ExpenseModel(
      {required this.category,
      required this.title,
      required this.price,
      required this.date})
      : id = uuid.v4(); // using uuid package to create id

  String formattedData() {
    return dateTime.format(date);
  }
}

class ExpenseBucket {
  final Category category;
  final List<ExpenseModel> expenseList;

  ExpenseBucket(this.category, this.expenseList);
  ExpenseBucket.forCategory(List<ExpenseModel> allExpenseList, this.category)
      : expenseList = allExpenseList
            .where((element) => element.category == category)
            .toList();

  double get totalExpense {
    double sum = 0;
    for (var element in expenseList) {
      sum += element.price;
    }
    return sum;
  }
}
