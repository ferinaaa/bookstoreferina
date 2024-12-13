import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import 'detail_book.dart';
import '/model/books.dart';
import '/service/api_service.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Books>> books;
  String searchQuery = '';
  ApiService api = ApiService();

  @override
  void initState() {
    books = api.getBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor.withOpacity(0.03),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 130,
            padding: EdgeInsets.only(top: 60, left: 16, right: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 8,
                  blurRadius: 12,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Discover books",
                  style: GoogleFonts.catamaran(
                    fontWeight: FontWeight.w900,
                    fontSize: 40,
                    height: 1,
                  ),
                ),
                //SizedBox(height: 50),
                // Search Bar
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 16),
                //   decoration: BoxDecoration(
                //     color: Colors.grey[100],
                //     borderRadius: BorderRadius.circular(30),
                //   ),
                //   child: TextField(
                //     onChanged: (value) {
                //       setState(() {
                //         searchQuery = value.toLowerCase();
                //       });
                //     },
                //     decoration: InputDecoration(
                //       hintText: 'Search books...',
                //       border: InputBorder.none,
                //       icon: Icon(Icons.search, color: Colors.grey),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          //SizedBox(height: 30),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: FutureBuilder<List<Books>>(
                  future: books,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text("Error: ${snapshot.error}"));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text("No books available"));
                    }
                    final buku = snapshot.data!;
                    // return GridView.count(
                    //   physics: BouncingScrollPhysics(),
                    //   crossAxisCount: 2, // Jumlah item per baris
                    //   crossAxisSpacing: 16, // Jarak horizontal antar item
                    //   mainAxisSpacing: 16, // Jarak vertikal antar item
                    //   childAspectRatio:
                    //       0.7, // Rasio aspek untuk mengatur tinggi dan lebar item
                    //   children: buildBook(),
                    // );
                    return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.6
                      ),
                      physics: const BouncingScrollPhysics(),
                      itemCount: buku.length,
                      padding: const EdgeInsets.only(top : 16, bottom: 16),
                      itemBuilder: (context, index) {
                        return buildBook(buku[index]);
                      },
                    );
                  }),

            ),
          ),
          //SizedBox(height: 30)
        ],
      ),
    );
  }

  // Menampilkan buku berdasarkan pencarian
  // List<Widget> buildBooks() {
  //   List<Widget> list = [];
  //
  //   for (var book in books) {
  //     if (book.title.toLowerCase().contains(searchQuery)) {
  //       list.add(buildBook(book));
  //     }
  //   }
  //   return list;
  // }

  Widget buildBook(Books book) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BookDetail(book: book)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Hero(
                  tag: book.title ?? 'Filosofi Teras',
                  child: Image.network(
                    book.image_url ??
                        'https://th.bing.com/th/id/OIP.odB1iWEo21aqXeg9D6WXPQHaLD?w=126&h=188&c=7&r=0&o=5&dpr=1.3&pid=1.7',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title ?? 'Filosofi Teras',
                    style: GoogleFonts.catamaran(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    book.writer?.name ?? 'Fulan',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
