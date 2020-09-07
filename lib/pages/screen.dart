import 'package:expenses/components/transaction_user.dart';
import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Despesas Pessoais"),
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
            TransactionUser(),
          ],
        ),
      ),
    );
  }
}
