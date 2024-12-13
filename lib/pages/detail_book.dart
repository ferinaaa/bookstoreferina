import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import '../model/books.dart';
import 'detail_transaction.dart';

class BookDetail extends StatefulWidget {

  final Books book;

  BookDetail({required this.book});

  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  bool isTransactionVisible = false;
  int quantity = 0;
  int unitPrice = 0; // Harga satuan
  //late int unitPrice;
  late int totalPrice;
  int pajak = 0;


  // Method untuk memperbarui total harga
  void updateTotalPrice() {
    setState(() {
      totalPrice = quantity * unitPrice;
    });
  }

  @override
  void initState() {
    super.initState();
    // Random harga satuan antara 80.000 hingga 200.000
    //unitPrice = Random().nextInt(200000 - 80000 + 1) + 80000;
    unitPrice = widget.book.price ?? 0;
    totalPrice = unitPrice * quantity;
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [

          Container(
            child: Hero(
              tag: widget.book.title??'Filosofi Teras',
              child: Image.network(
                  widget.book?.image_url??'https://th.bing.com/th/id/OIP.odB1iWEo21aqXeg9D6WXPQHaLD?w=126&h=188&c=7&r=0&o=5&dpr=1.3&pid=1.7',
                  fit: BoxFit.fitWidth
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 48, left: 32,),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 42,
                  width: 42,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.6,
              padding: EdgeInsets.only(top: 64),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right: 32, left: 32, bottom: 16,),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [

                          Text(
                            widget.book?.title??'Filosofi Teras',
                            style: GoogleFonts.catamaran(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              height: 1,
                            ),
                          ),

                          Text(
                            widget.book?.writer?.name??'Fulan',
                            style: GoogleFonts.catamaran(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  color: kPrimaryColor, // Warna latar belakang Card
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    child: Text(
                                      widget.book.genre??'Comedy',
                                      style: GoogleFonts.catamaran(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 100),
                                Text("Rp " +
                                    (widget.book.price ?? 0).toString() + ",-",
                                  //"Rp 100.000,-",
                                  style: GoogleFonts.catamaran(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Column(
                                children: [
                                  Text(
                                    widget.book.description??'ini des',
                                    style: GoogleFonts.catamaran(
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 100)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 32, bottom: (size.height * 0.6) - (75 / 2)),
              child: Card(
                elevation: 4,
                margin: EdgeInsets.all(0),
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.book.writer?.image_url??'https://th.bing.com/th/id/OIP.odB1iWEo21aqXeg9D6WXPQHaLD?w=126&h=188&c=7&r=0&o=5&dpr=1.3&pid=1.7'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          //
          // Align(
          //   alignment: Alignment.bottomLeft,
          //   child: Padding(
          //     padding: EdgeInsets.only(left: 32, bottom: (size.height * 0.5) - (75 / 2)),
          //     child: Card(
          //       elevation: 4,
          //       margin: EdgeInsets.all(0),
          //       clipBehavior: Clip.antiAlias,
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.all(
          //           Radius.circular(15),
          //         ),
          //       ),
          //       child: Container(
          //         width: 75,
          //         height: 75,
          //         decoration: BoxDecoration(
          //           image: DecorationImage(
          //             image: AssetImage(widget.book.author.image),
          //             fit: BoxFit.cover,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),

          if (isTransactionVisible)
            Container(
              color: Colors.black.withOpacity(0.8),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isTransactionVisible = !isTransactionVisible;
                  });
                },
              ),
            ),

          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(bottom: 100),
              child:
              Visibility(
                visible: isTransactionVisible,
                child: Container(
                  height: 150,
                  width: size.width,
                  padding: EdgeInsets.only(
                    top: 16,
                    left: 32,
                    right: 32,
                    //bottom: 32,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.network(
                            widget.book.image_url??'https://th.bing.com/th/id/OIP.odB1iWEo21aqXeg9D6WXPQHaLD?w=126&h=188&c=7&r=0&o=5&dpr=1.3&pid=1.7',
                            height: 100,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.book.title??"Filosofi Teras",
                                style: GoogleFonts.catamaran(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                widget.book.writer?.name??"Fulan",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(width: 129),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (quantity > 0)
                                          quantity--; // Kurangi nilai quantity jika lebih dari 0
                                        updateTotalPrice();
                                      });
                                    },
                                    child: Icon(
                                      Icons.remove_circle,
                                      color: kPrimaryColor,
                                      size: 28,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                    "$quantity", // Tampilkan nilai quantity
                                    style: GoogleFonts.catamaran(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        quantity++; // Tambah nilai quantity
                                        updateTotalPrice();
                                      });
                                    },
                                    child: Icon(
                                      Icons.add_circle,
                                      color: kPrimaryColor,
                                      size: 28,
                                    ),
                                  ),
                                  //SizedBox(width: 30),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomLeft,
            child:
            Container(
              height: 100,
              width: size.width,
              padding: EdgeInsets.only(top: 16, left: 32, right: 32, bottom: 32,),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isTransactionVisible = !isTransactionVisible;
                        });
                      },
                      child: Container(
                        height: 100,
                        width: 320,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),

                          ),
                          boxShadow: [
                            BoxShadow(
                              color: kPrimaryColor.withOpacity(0.4),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child : Center(
                          child: Text(
                            "BUY NOW",
                            style: GoogleFonts.catamaran(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          if (isTransactionVisible)
            Align(
              alignment: Alignment.bottomLeft,
              child:
              Container(
                height: 100,
                width: size.width,
                padding: EdgeInsets.only(top: 16, left: 32, right: 32, bottom: 32,),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          if(quantity != 0){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TransactionDetail(
                                  title: widget.book.title??"Filosofi Teras",
                                  cover: widget.book.image_url??'https://th.bing.com/th/id/OIP.odB1iWEo21aqXeg9D6WXPQHaLD?w=126&h=188&c=7&r=0&o=5&dpr=1.3&pid=1.7',
                                  quantity: quantity,
                                  pajak: (unitPrice * 0.1).toInt(), // pajak 10%
                                  unitPrice: unitPrice,
                                  totalPrice: totalPrice + (unitPrice * 0.1).toInt(),
                                ),
                              ),
                            );
                          } else {
                            // Tampilkan alert ketika quantity == 0
                            showDialog(
                              context: context,
                              barrierDismissible: false, // agar dialog tidak bisa ditutup dengan klik luar
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  //content: Text('Silahkan pilih banyak buku'),
                                  title: Text(
                                    "Error",
                                    style: GoogleFonts.catamaran(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  content: Text(
                                    "Masukkan jumlah buku yang ingin dibeli",
                                    style: GoogleFonts.catamaran(),
                                  ),
                                );
                              },
                            );

                            // Menutup alert setelah 500 milidetik (0.5 detik)
                            Future.delayed(Duration(milliseconds: 2000), () {
                              Navigator.of(context).pop(); // Menutup dialog setelah 500ms
                            });
                          }
                        },
                        child: Container(
                          height: 100,
                          width: 320,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),

                            ),
                            boxShadow: [
                              BoxShadow(
                                color: kPrimaryColor.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child : Center(
                            child: Text(
                              "BUY NOW",
                              style: GoogleFonts.catamaran(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}