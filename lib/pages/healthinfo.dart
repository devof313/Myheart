import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:ffi';

class MyInfo extends StatefulWidget {
  const MyInfo({Key? key}) : super(key: key);

  @override
  State<MyInfo> createState() => _MyInfoState();
}

class _MyInfoState extends State<MyInfo> {
  final _HighBloodController = TextEditingController();
  final _SmokingController = TextEditingController();
  final _CholesterolController = TextEditingController();
  final _diabetesController = TextEditingController();

  @override
  void dispose() {
    _HighBloodController.dispose();
    _SmokingController.dispose();
    _CholesterolController.dispose();
    _diabetesController.dispose();
    super.dispose();
  }

  // ignore: non_constant_identifier_names
  Future SaveInfo() async {
    //add user details
    addUserInfoDetails(
      _HighBloodController.text.trim(),
      _SmokingController.text.trim(),
      _CholesterolController.text.trim(),
      _diabetesController.text.trim(),
    );
  }

  Future addUserInfoDetails(
      String firstName, String lastName, String age, String gender) async {
    await FirebaseFirestore.instance.collection('HeartData').add({
      'High Blood Pressure': firstName,
      'Smoking': lastName,
      'high blood cholesterol': age,
      'diabetes': gender,
    });
  }

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

                //hello again

                Text(
                  'Answer only with yes or no ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 20),
                // high blood pressure textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _HighBloodController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'History of high blood pressure?',
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                //smoking textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _SmokingController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Do you Smoke ?',
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),
                //cholesterol textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _CholesterolController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'History high cholesterol?',
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                //diabetes textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _diabetesController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Do you have diabetes?',
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 50),

                //SAVE button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 120.0),
                  child: GestureDetector(
                    onTap: SaveInfo,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child: Center(
                        child: Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
