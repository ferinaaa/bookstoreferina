import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import '/model/transactionHistory.dart';

class TransactionDetail extends StatelessWidget {
  final String title;
  final String cover;
  final int quantity;
  final int pajak;
  final int unitPrice;
  final int totalPrice;

  const TransactionDetail({
    Key? key,
    required this.title,
    required this.cover,
    required this.quantity,
    required this.pajak,
    required this.unitPrice,
    required this.totalPrice,
  }) : super(key: key);

  void addTransaction() {
    transactionHistories.add(TransactionHistory(
      title: title,
      cover: cover,
      totalPrice: totalPrice,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          "Checkout",
          style: GoogleFonts.catamaran(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: kPrimaryColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child:
              Container(
                height: 200,
                width: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(cover),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.catamaran(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  //height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 14),
                      Text(
                        "Detail Transaksi",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.catamaran(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Harga",
                            style: GoogleFonts.catamaran(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Rp $unitPrice",
                            style: GoogleFonts.catamaran(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Kuantitas",
                            style: GoogleFonts.catamaran(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "$quantity",
                            style: GoogleFonts.catamaran(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Pajak (10%)",
                            style: GoogleFonts.catamaran(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Rp $pajak",
                            style: GoogleFonts.catamaran(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      const SizedBox(
                        height: 2, // Tinggi garis
                        width: double.infinity, // Lebar penuh
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.grey), // Warna garis
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Harga",
                            style: GoogleFonts.catamaran(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Rp $totalPrice,-",
                            style: GoogleFonts.catamaran(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                addTransaction();
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      "Transaksi Berhasil",
                      style: GoogleFonts.catamaran(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: Text(
                      "Terima kasih telah membeli!",
                      style: GoogleFonts.catamaran(),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close dialog
                          Navigator.of(context).pop(); // Return to previous screen
                          Navigator.of(context).pop(); // Return to previous screen
                        },
                        child: Text(
                          "Close",
                          style: GoogleFonts.catamaran(
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                "CONFIRM PURCHASE",
                style: GoogleFonts.catamaran(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
