import 'package:flutter/material.dart';
import 'package:wecode_assignment/mock/mock_data.dart';
import 'package:wecode_assignment/src/bio.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme:
              ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent)),
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
                                    PageRouteBuilder(
                                        transitionDuration:
                                            Duration(milliseconds: 500),
                                        reverseTransitionDuration:
                                            Duration(milliseconds: 400),
                                        pageBuilder: (context, animation,
                                                secondaryAnimation) =>
                                            Bio(
                                              imageURL: mockData[index]
                                                      ["imagePlce"]
                                                  .toString(),
                                              name: mockData[index]["name"]
                                                  .toString(),
                                              bio: mockData[index]["bio"]
                                                  .toString(),
                                            ),
                                        transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) {
                                          const begin = Offset(1.0, 0.0);
                                          const end = Offset.zero;
                                          const curve = Curves.easeInToLinear;

                                          var tween = Tween(
                                                  begin: begin, end: end)
                                              .chain(CurveTween(curve: curve));

                                          return SlideTransition(
                                            position: animation.drive(tween),
                                            child: child,
                                          );
                                        }),
                                  );
                                },
                              ),
                              height: 240,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                //text on the image
                                width: 150,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25)),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 3),
                                        color: Colors.grey.shade900,
                                        spreadRadius: 1,
                                        blurRadius: 9,
                                      )
                                    ]),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                          transitionDuration:
                                              Duration(milliseconds: 700),
                                          reverseTransitionDuration:
                                              Duration(milliseconds: 700),
                                          pageBuilder: (context, animation,
                                                  secondaryAnimation) =>
                                              Bio(
                                                imageURL: mockData[index]
                                                        ["imagePlce"]
                                                    .toString(),
                                                name: mockData[index]["name"]
                                                    .toString(),
                                                bio: mockData[index]["bio"]
                                                    .toString(),
                                              ),
                                          transitionsBuilder: (context,
                                              animation,
                                              secondaryAnimation,
                                              child) {
                                            const begin = Offset(1.0, 0.0);
                                            const end = Offset.zero;
                                            const curve = Curves.easeInToLinear;

                                            var tween = Tween(
                                                    begin: begin, end: end)
                                                .chain(
                                                    CurveTween(curve: curve));

                                            return SlideTransition(
                                              position: animation.drive(tween),
                                              child: child,
                                            );
                                          }),
                                    );
                                  },
                                  child: Center(
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
