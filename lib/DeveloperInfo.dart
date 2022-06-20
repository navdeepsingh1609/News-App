import 'package:flutter/material.dart';
import 'dart:ui';

class DevInfo extends StatelessWidget {
  const DevInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Image.asset(
        "images/bckground.jpg",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Scaffold(
          appBar: AppBar(
            title: const Text("Developer Info",
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            backgroundColor: Colors.transparent,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(0.6)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '''
Name: Navdeep Singh                  
Roll No: 101916021
Batch: CS9''',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(0.6)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '''
Name: Siya Dutta                          
Roll No: 101916026
Batch: CS9''',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(0.6)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '''
Name: Nihar Wadhwa                  
Roll No: 101903461
Batch: COE18''',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(0.6)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '''
Name: Paras Arora                      
Roll No: 101916115
Batch: CS10''',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black.withOpacity(0.6)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '''
Name: Dhruv Mehta                     
Roll No: 101903420
Batch: COE16''',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(0.6)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '''
Name: Ekamjoth Singh               
Roll No: 101916019
Batch: CS9''',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.transparent)
    ]);
  }
}
