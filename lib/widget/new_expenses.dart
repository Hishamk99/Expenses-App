import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expenses_app/models/expense_model.dart';

class NewExpenses extends StatefulWidget {
  const NewExpenses({super.key, required this.addExpense});
  final void Function(ExpenseModel expense) addExpense;
  @override
  State<NewExpenses> createState() => _NewExpensesState();
}

class _NewExpensesState extends State<NewExpenses> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  DateTime? selectedDate;
  final format = DateFormat.yMd();
  Category selectedCategory = Category.food;

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    priceController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          TextField(
            controller: titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$',
                    label: Text('Price'),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        style: const TextStyle(fontSize: 16),
                        selectedDate == null
                            ? 'No Date'
                            : format.format(selectedDate!),
                      ),
                      IconButton(
                        iconSize: 30,
                        onPressed: () async {
                          final now = DateTime.now();
                          final firstDate =
                              DateTime(now.year - 1, now.month, now.day);
                          final DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: now,
                              firstDate: firstDate,
                              lastDate: now);
                          setState(() {
                            selectedDate = pickedDate;
                          });
                        },
                        icon: const Icon(
                          Icons.calendar_month,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              DropdownButton(
                value: selectedCategory,
                iconDisabledColor: Colors.blue,
                iconSize: 35,
                items: Category.values
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.name),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    if (value == null) {
                      return;
                    }
                    selectedCategory = value;
                  });
                },
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  final enteredTitle = titleController.text;
                  final double? enteredPrice =
                      double.tryParse(priceController.text);
                  final bool invalidPrice =
                      enteredPrice == null || enteredPrice <= 0;
                  // using trim for spaces
                  if (enteredTitle.trim().isEmpty ||
                      selectedDate == null ||
                      invalidPrice) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('OK'),
                            ),
                          ],
                          title: const Center(
                            child: Text('Invalid Input'),
                          ),
                        );
                      },
                    );
                  } else {
                    widget.addExpense(
                      ExpenseModel(
                          category: selectedCategory,
                          title: titleController.text,
                          price: double.parse(priceController.text),
                          date: selectedDate!),
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text('Save' , style: TextStyle(color: Colors.black),),
              ),
              const SizedBox(
                width: 15,
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel' , style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
