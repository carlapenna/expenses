import 'dart:math';
import 'package:flutter/material.dart';
import 'package:expenses/models/transaction.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {

  final _transactions = [
    Transaction(
      id: 'T1',
      title: 'Novo aparelho celular',
      value: 2000.50,
      time: DateTime.now(),
    ),
    Transaction(
      id: 'T2',
      title: 'Novo tênis',
      value: 399.99,
      time: DateTime.now(),
    ),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(), 
      title: title, 
      value: value, 
      time: DateTime.now(),
      );

      setState(() {
        _transactions.add(newTransaction);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(_addTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}