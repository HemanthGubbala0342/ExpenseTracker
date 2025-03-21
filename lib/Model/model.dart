import 'package:cloud_firestore/cloud_firestore.dart';

class Expense {
  final String id;
  final String name;
  final String category;
  final int amount;
  final Timestamp date;
  final Timestamp createdAt;

  Expense({
    required this.id,
    required this.name,
    required this.category,
    required this.amount,
    required this.date,
    required this.createdAt,
  });

  factory Expense.fromDocument(DocumentSnapshot doc) {
    return Expense(
      id: doc.id,
      name: doc['name'],
      category: doc['category'],
      amount: doc['amount'],
      date: doc['date'],
      createdAt: doc['createdAt'],
    );
  }
}
