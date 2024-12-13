import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';

class User extends StatelessWidget {
  final String profileImage = 'assets/user/user.jpg';
  final String userName = 'Ferina Putri Soedjono';
  final String userPhone = '+62 812 3456 7890';
  final String userAddress = 'Sidoarjo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile',
          style: GoogleFonts.catamaran(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 1000,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(100),
                ),
              ),
              padding: EdgeInsets.only(top: 20, bottom: 30),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage(profileImage),
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(height: 16),
                  Text(
                    userName,
                    style: GoogleFonts.catamaran(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  // Nomor Telepon
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 3,
                    child: ListTile(
                      leading: Icon(Icons.phone, color: kPrimaryColor),
                      title: Text(
                        userPhone,
                        style: GoogleFonts.catamaran(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Alamat
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 3,
                    child: ListTile(
                      leading: Icon(Icons.home, color: kPrimaryColor),
                      title: Text(
                        userAddress,
                        style: GoogleFonts.catamaran(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                        softWrap: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 32),

                  // Button Logout (opsional)
                  // ElevatedButton(
                  //   onPressed: () {
                  //     // Tindakan logout jika diperlukan
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: kPrimaryColor,
                  //     padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(15),
                  //     ),
                  //   ),
                  //   child: Text(
                  //     'Logout',
                  //     style: GoogleFonts.catamaran(
                  //       fontSize: 16,
                  //       color: Colors.white,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
