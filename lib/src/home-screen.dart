import 'package:flutter/material.dart';
import 'package:wecode_assignment/mock/mock_data.dart';
import 'package:wecode_assignment/src/bio.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key} ) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            "List Assignment",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          elevation: 0,
        ),
        body: Center(
          child: SafeArea(
            child: Container(
              child: ListView.builder(
                  itemCount: mockData.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      child: Card(
                        elevation: 14,
                        shadowColor: Colors.grey.shade900,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                  Ink.image(
                                  image: NetworkImage(
                                      mockData[index]["imagePlce"].toString()),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                            builder: (context) => Bio(
                                              imageURL:mockData[index]["imagePlce"].toString(),
                                              name: mockData[index]["name"].toString(),
                                              bio:mockData[index]["bio"].toString(),
                                            )
                                            ));
                                          },
                                        ),
                                  height: 240,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Container(     //text on the image
                                      width: 150,
                                      height: 40,
                                      decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.only(topLeft:Radius.circular(25) ,bottomRight:Radius.circular(15),topRight: Radius.circular(5) ),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0,3),
                                          color: Colors.grey.shade900,
                                          spreadRadius: 1,
                                          blurRadius: 9,
                                        )
                                      ]
                                    ),
                                      child: GestureDetector(
                                          onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                            builder: (context) => Bio(
                                              imageURL:mockData[index]["imagePlce"].toString(),
                                              name: mockData[index]["name"].toString(),
                                              bio:mockData[index]["bio"].toString(),
                                            )
                                            ));
                                          },
                                          child:  Center(
                                            child: Text(
                                              mockData[index]["name"].toString(),
                                              style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      ),
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
