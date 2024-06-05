import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_app/database.dart';
import 'package:flutter/material.dart';

class ReadPage extends StatefulWidget {
  const ReadPage({super.key});

  @override
  State<ReadPage> createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  String? firstName, lastName, age, id;
  TextEditingController _firstNameController = TextEditingController();
  bool isLoading = false;

  searchUser(String name) async {
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please enter a first name")));
      return;
    }

    setState(() {
      isLoading = true;
      firstName = null;
      lastName = null;
      age = null;
      id = null;
    });

    try {
      QuerySnapshot querySnapshot =
          await DatabaseMethods().getthisUserInfo(name);
      if (querySnapshot.docs.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("No user found with that name")));
      } else {
        firstName = "${querySnapshot.docs[0]["First Name"]}";
        lastName = "${querySnapshot.docs[0]["Last Name"]}";
        age = "${querySnapshot.docs[0]["Age"]}";
        id = querySnapshot.docs[0].id;
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("User found: $lastName")));
      }
    } on FirebaseException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.code.toString())));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 20.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3)),
                  ],
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.blue, Color.fromARGB(255, 57, 129, 255)],
                  ),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Read/Select',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Please fill in your information',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/2_read.png",
                      fit: BoxFit.cover,
                      width: 220,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                                color: const Color.fromARGB(255, 190, 190, 190)
                                    .withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3))
                          ]),
                      child: TextFormField(
                        controller: _firstNameController,
                        style: const TextStyle(fontSize: 16.0),
                        decoration: const InputDecoration(
                          labelText: 'First Name',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 18, 144, 247),
                                  width: 1)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: Colors.grey)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 60.0),
                    Container(
                        width: double.infinity,
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 5))
                            ]),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue),
                            onPressed: () {
                              searchUser(_firstNameController.text.toString());
                            },
                            child: const Text(
                              "Search",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white),
                            ))),
                    const SizedBox(height: 30.0),
                    if (isLoading)
                      const Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      ),
                    if (firstName != null && lastName != null && age != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "First Name: $firstName",
                            style: TextStyle(fontSize: 25),
                          ),
                          Text(
                            "Last Name: $lastName",
                            style: TextStyle(fontSize: 25),
                          ),
                          Text(
                            "Age: $age",
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
