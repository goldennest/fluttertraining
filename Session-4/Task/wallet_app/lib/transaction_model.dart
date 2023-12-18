import 'dart:convert';

enum TransactionType { deposit, withdraw }

class Transaction {
  final double amount;
  final DateTime time;
  final TransactionType type;
  Transaction(this.type, {required this.amount, required this.time});

  // Convert Transaction object to a map
  Map<String, dynamic> toMap() {
    return {
      'type': type.name,
      'amount': amount,
      'time': time.toIso8601String(),
    };
  }

  // Create a Transaction object from a map
  factory Transaction.fromMap(Map<String, dynamic> map) {
    final type = TransactionType.values.firstWhere(
      (element) => element.name == map['type'],
    );
    return Transaction(
      type,
      amount: map['amount'],
      time: DateTime.parse(map['time']),
    );
  }

  // Convert Transaction object to a JSON-encoded string
  String toJson() {
    return jsonEncode(toMap());
  }

  // Create a Transaction object from a JSON-encoded string
  factory Transaction.fromJson(String json) {
    return Transaction.fromMap(jsonDecode(json));
  }
}
