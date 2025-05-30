import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Place {
  final String name;
  final String image;
  final String description;

  Place({required this.name, required this.image, required this.description});
}

final List<Place> places = [
  Place(
    name: 'Burabay',
    image: 'assets/burabay.jpg',
    description: "Burabay is known as the 'Kazakh Switzerland' for its beautiful landscapes, pine forests, and serene lakes. It’s perfect for nature lovers, picnics, and light hiking.",
  ),
  Place(
    name: 'Bozzhyra',
    image: 'assets/bozzhyra.jpg',
    description: "Bozzhyra is located in the Mangystau region and features surreal, otherworldly rock formations. A must-see for photographers and adventurers.",
  ),
  Place(
    name: 'Charyn Canyon',
    image: 'assets/charyn.jpg',
    description: "Charyn Canyon, east of Almaty, resembles the Grand Canyon. It features the 'Valley of Castles' and offers hiking trails and viewpoints.",
  ),
  Place(
    name: 'Yasawi Mausoleum',
    image: 'assets/yasawi.jpg',
    description: "This mausoleum is an iconic symbol of Kazakhstan’s spiritual history. Built under Timur’s rule, it’s a masterpiece of Timurid architecture.",
  ),
  Place(
    name: 'Kolsay Lakes',
    image: 'assets/kolsay.jpg',
    description: "The Kolsay Lakes are a trio of alpine lakes ideal for trekking, camping, and horse riding. They are surrounded by the Tian Shan mountains.",
  ),
  Place(
    name: 'Shymbulak',
    image: 'assets/shymbulak.jpg',
    description: "Shymbulak is Central Asia’s top ski resort. Located close to Almaty, it offers slopes, cable cars, and breathtaking mountain views.",
  ),
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Top Places in Kazakhstan',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: PlacesListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Places in Kazakhstan'),
      ),
      body: ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) {
          final place = places[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset(place.image, width: 80, fit: BoxFit.cover),
              title: Text(place.name),
              subtitle: Text(
                place.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlaceDetailScreen(place: place),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class PlaceDetailScreen extends StatelessWidget {
  final Place place;

  PlaceDetailScreen({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(place.image),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                place.description,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}