import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

//the first question
class Q1 extends StatefulWidget {
  const Q1({Key? key}) : super(key: key);

  @override
  State<Q1> createState() => _Q1State();
}

class _Q1State extends State<Q1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 107, 198, 165),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://cdn-icons-png.flaticon.com/512/1533/1533907.png"),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 60),
                //hello again
                Text(
                  'All Set',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 52,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
