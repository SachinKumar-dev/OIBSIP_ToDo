import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/Create/UserDetails.dart';
import 'package:notes/UI%20Pages/Show.dart';


class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          FractionallySizedBox(
              heightFactor: 0.7,
              child: Image.asset(
                'assets/images/notes.png',
              )),
          Positioned(
            top: 530,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Write Everything...",
                      style: GoogleFonts.aBeeZee(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                  const SizedBox(height: 10,),
                  Text("Within Snap.",
                      style: GoogleFonts.aBeeZee(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "People can be clever as high as the sky,but\n as long as they don't write,they gets lost\n in society and from history.",
                      style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 17),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 730,
            left: 160,
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white)),
            ),
          ),
          Positioned(
              top: 747,
              left: 180,
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Show()));
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 35,
                  )))
        ],
      ),
    );
  }
}
