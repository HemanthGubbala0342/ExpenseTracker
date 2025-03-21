import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expensetracker/Model/model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpenseNotifier extends StateNotifier<List<Expense>> {
  ExpenseNotifier() : super([]);

  final CollectionReference expense =
      FirebaseFirestore.instance.collection("expense_tracker");

  Stream<List<Expense>> getExpense() {
    return expense.orderBy('date', descending: true).snapshots().map(
      (snapshot) {
        return snapshot.docs.map((doc) => Expense.fromDocument(doc)).toList();
      },
    );
  }

  Future<void> addExpense(
    String name,
    String category,
    int amount,
    Timestamp date,
  ) async {
    await expense.add({
      'name': name,
      'category': category,
      'amount': amount,
      'date': date,
      'createdAt': Timestamp.now(),
    });
  }

  Future<void> updateExpense(
    String id,
    String name,
    String category,
    int amount,
    Timestamp date,
  ) async {
    await expense.doc(id).update({
      'name': name,
      'category': category,
      'amount': amount,
      'date': date,
    });
  }

  Future<void> deleteExpense(String id) async {
    await expense.doc(id).delete();
  }
}

final expenseProvider = StateNotifierProvider<ExpenseNotifier, List<Expense>>(
  (ref) {
    return ExpenseNotifier();
  },
);


