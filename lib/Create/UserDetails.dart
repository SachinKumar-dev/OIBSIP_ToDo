import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/UI%20Pages/Show.dart';

class USD extends StatefulWidget {
  const USD({Key? key}) : super(key: key);

  @override
  State<USD> createState() => _USDState();
}

class _USDState extends State<USD> {
  //method to save
  void done() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Notes Saved Successfully!"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        );
      },
    );
    createNotes();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Show()));
    });
  }

  final notes = TextEditingController();
  final title = TextEditingController();

  void createNotes() {
    CollectionReference sachin =
        FirebaseFirestore.instance.collection('sachin');
    sachin.add({"notes": notes.text, "title": title.text});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Show()));
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
              onPressed: () {
                createNotes();
              },
              icon: GestureDetector(
                  onTap: () {
                    done();
                  },
                  child: const Icon(Icons.done)))
        ],
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Stack(children: [
        SafeArea(
          child: Column(
            children: [
              TextField(
                controller: title,
                style: const TextStyle(fontSize: 30, color: Colors.white),
                maxLines: null,
                decoration: const InputDecoration(
                    hintText: "Title",
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    )),
              ),
              TextField(
                controller: notes,
                maxLines: null,
                style: const TextStyle(fontSize: 20, color: Colors.white),
                decoration: const InputDecoration(
                    hintText: "Note",
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
