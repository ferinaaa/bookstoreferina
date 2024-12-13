import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '/model/transactionHistory.dart';


class TransactionHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transaction History",
          style: GoogleFonts.catamaran(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: transactionHistories.isEmpty ?
      const Center(
        child: Text(
          "Belum ada transaksi",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      )
          : ListView.builder(
        itemCount: transactionHistories.length,
        itemBuilder: (context, index) {
          //nampilin transaksi terbaru
          final reversedIndex = transactionHistories.length - 1 - index;
          final transaction = transactionHistories[reversedIndex];

          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: Image.network(
                transaction.cover,
                height: 100,
                width: 50,
                fit: BoxFit.cover,
              ),
              title: Text(transaction.title,
                style: GoogleFonts.catamaran(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text("Total: Rp ${transaction.totalPrice},-",
                style: GoogleFonts.catamaran(
                  fontSize: 16,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
