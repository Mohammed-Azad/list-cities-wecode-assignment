import 'package:flutter/material.dart';
import 'package:wecode_assignment/src/home-screen.dart';
import 'package:wecode_assignment/mock/mock_data.dart';

class Bio extends StatelessWidget {
  final String imageURL;
  final String name;
  final String bio;
  const Bio({Key? key,
    required this.imageURL,
    required this.name,
    required this.bio}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: BackButton(
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(10.0),
          children: [
            Expanded(
              child: Container(
                height: 250.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                  child: Image.network(imageURL ,
                  fit: BoxFit.fitWidth,),
                ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade900,
                    offset: Offset(0,3),
                    blurRadius: 9,
                    spreadRadius: 3,
                  ),
                ]
              ),
              ),
            ),
            Container(
              height: 10.0,
            ), //space between image ain Erbil text
            Container(
              height: 50.0,
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              child: Text(
                bio,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
