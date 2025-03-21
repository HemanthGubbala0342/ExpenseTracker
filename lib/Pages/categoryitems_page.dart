import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expensetracker/Model/model.dart';
import 'package:expensetracker/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CategoryitemsPage extends StatelessWidget {
  final String category;
  final List<Expense> expenses;
  const CategoryitemsPage({
    super.key,
    required this.category,
    required this.expenses,
  });

  String formatTimestamp(Timestamp timestamp) {
    final DateTime dateTime = timestamp.toDate();
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: expenses.length,
          itemBuilder: (context, index) {
            final expense = expenses[index];
            return Container(
              margin: const EdgeInsets.only(
                bottom: 5,
                top: 10,
                right: 15,
                left: 15,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(t.name),
                        Text(
                          " : ${expense.name}",
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text(t.amount),
                        Text(
                          " : ${expense.amount}",
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text(t.payment_date),
                        Text(
                          " : ${formatTimestamp(expense.date)}",
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text(t.created_at),
                        Text(
                          " : ${formatTimestamp(expense.createdAt)}",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
