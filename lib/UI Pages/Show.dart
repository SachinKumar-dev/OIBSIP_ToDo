import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/Create/UserDetails.dart';

class Show extends StatefulWidget {
  const Show({Key? key}) : super(key: key);

  @override
  State<Show> createState() => _ShowState();
}

class _ShowState extends State<Show> {
  int _selectedIndex = 0;
  //read data
  List<DocumentSnapshot> documents = [];

  Future<void> getNotes() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('sachin').get();
    setState(() {
      documents = querySnapshot.docs;
    });
  }

  @override
  void initState() {
    getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/back1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My\nNotes',
                style: GoogleFonts.aBeeZee(
                  fontSize: 60,
                  color: Colors.white,
                ),
              ),
              Text(
                'Just take your notes always on your way.',
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Stack(children: [
                Container(
                  width: 250,
                  height: 65,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEB7A53),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(5),
                    ),
                    border: Border.all(width: 2, color: Colors.white),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 5,
                  child: Text(
                    'Find Yours...',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ]),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: MasonryGridView.builder(
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEB7A53),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 2, color: Colors.white),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      documents[index]['title'],
                                      maxLines: null,
                                      style: GoogleFonts.lora(
                                          color: Colors.white, fontSize: 30),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(documents[index]['notes'],
                                        maxLines: null,
                                        style: GoogleFonts.robotoSlab(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ]),
                          )),
                    );
                  },
                ),
              ),
              CurvedNavigationBar(
                  index: _selectedIndex,
                   onTap: (index) {
                    if (index == 1) {
                      SystemNavigator.pop();
                    } else if(index==0) {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const USD()));
                    }
                    else {
                      setState(() {
                        _selectedIndex = index;
                      });
                    }
                  },
                  animationDuration: const Duration(milliseconds: 400),
                  backgroundColor: Colors.black,
                  color: const Color(0xFFF6ECC9),
                  items: const [
                    Icon(Icons.add, color: Colors.deepOrange),
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.deepOrange,
                    ),
                  ])
            ],
          ),
        ),
      ),
    );
  }
}
