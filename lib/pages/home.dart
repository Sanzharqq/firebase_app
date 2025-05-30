import 'package:firebase_auther/pages/top_places.dart';
import 'package:firebase_auther/weather/weather_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auther/pages/map_routes_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  "images/mountain4ik.jpg",
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.5,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40.0,
                    right: 20.0,
                    left: 20.0,
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TopPlaces(),
                            ),
                          );
                        },
                        child: Material(
                          elevation: 3.0,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.public,
                              color: Colors.blue,
                              size: 30.0,
                            ),
                          ),
                        ),
                      ),

                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WeatherPage(),
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(12),
                        splashColor: Colors.blue.withOpacity(
                          0.2,
                        ), // эффект нажатия
                        child: Material(
                          color: Colors.white,
                          elevation: 4,
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.cloud,
                              color: Colors.blue,
                              size: 30,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 10.0),

                      Material(
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(60),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Image.asset(
                            "images/profile.jpg",
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 140.0, left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sapar",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Lato',
                          fontSize: 60.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Travel Community",
                        style: TextStyle(
                          color: const Color.fromARGB(210, 255, 255, 255),
                          fontFamily: 'Lato',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 30,
                    right: 30.0,
                    top: MediaQuery.of(context).size.height / 2.7,
                  ),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.only(left: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1.5),
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search your destination",
                          suffixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.0),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30.0),

              child: Material(
                elevation: 3.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 10.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                "images/profile.jpg",
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 15.0),
                            Text(
                              "Sanzhar Salem",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Image.asset(
                        "images/sh.jpg",
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 5.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.blue),
                            Text(
                              "Lake, Shchuchye, Kokshetay",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Shchuchye Lake is a serene, deep lake nestled in the pine forests of Burabay National Park. Known for its clear waters and peaceful atmosphere, it's perfect for relaxation and fishing. The area offers cozy resorts and stunning natural views.",
                          style: TextStyle(
                            color: Color.fromARGB(179, 0, 0, 0),
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Icon(
                              Icons.favorite_outline,
                              color: const Color.fromARGB(137, 255, 0, 0),
                              size: 30.0,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              "Like",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 30.0),
                            Icon(
                              Icons.comment_outlined,
                              color: const Color.fromARGB(136, 0, 83, 207),
                              size: 28.0,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              "Comment",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 40.0),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30.0),

              child: Material(
                elevation: 3.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 10.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                "lib/images/ava1.jpg",
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 15.0),
                            Text(
                              "Nuredil Yesdaulet",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Image.asset(
                        "images/bayan.jpg",
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 5.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.blue),
                            Text(
                              "Mountain reserve, Pavlodar",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Bayanaul National Park, established in 1985, is Kazakhstan's first national park, located in the Pavlodar region. It features scenic lakes like Jasybay and Sabyndykol, surrounded by pine forests and granite mountains. The park is renowned for its unique rock formations and diverse wildlife, including argali sheep and golden eagles.",
                          style: TextStyle(
                            color: Color.fromARGB(179, 0, 0, 0),
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Icon(
                              Icons.favorite_outline,
                              color: const Color.fromARGB(137, 255, 0, 0),
                              size: 30.0,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              "Like",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 30.0),
                            Icon(
                              Icons.comment_outlined,
                              color: const Color.fromARGB(136, 0, 83, 207),
                              size: 28.0,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              "Comment",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 40.0),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30.0),

              child: Material(
                elevation: 3.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 10.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                "lib/images/ava2.jpg",
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 15.0),
                            Text(
                              "Ali Kultai",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Image.asset(
                        "images/ak.jpg",
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 5.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.blue),
                            Text(
                              "Ak-Mechet, cave, Kyzylorda",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Ak-Mosque Cave is a massive limestone cavern in southern Kazakhstan, known for its natural beauty and spiritual significance. Despite being underground, it hosts living trees and a unique microclimate. The cave is considered a sacred place believed to bring peace and healing.",
                          style: TextStyle(
                            color: Color.fromARGB(179, 0, 0, 0),
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Icon(
                              Icons.favorite_outline,
                              color: const Color.fromARGB(137, 255, 0, 0),
                              size: 30.0,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              "Like",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 30.0),
                            Icon(
                              Icons.comment_outlined,
                              color: const Color.fromARGB(136, 0, 83, 207),
                              size: 28.0,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              "Comment",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 50.0),
          ],
        ),
      ),

      // footer
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MapRoutesPage()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
        ],
      ),
    );
  }
}
