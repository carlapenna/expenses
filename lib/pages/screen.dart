import 'package:expenses/components/transaction_form.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:expenses/models/transaction.dart';
import 'package:expenses/components/transaction_list.dart';

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
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

    Navigator.of(context).pop();

  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Despesas Pessoais"),
        actions: [
          IconButton(
            icon: Icon(Icons.add), 
            onPressed: () => _openTransactionFormModal(context),
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Card(
                elevation: 5,
                child: Text("Texto 1"),
              ),
            ),
            TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButton:
          FloatingActionButton(
            child: Icon(Icons.add), 
            onPressed: () => _openTransactionFormModal(context),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
