// place_detail_page.dart
import 'package:flutter/material.dart';

class PlaceDetailPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const PlaceDetailPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: Colors.blue),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(imagePath),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(description, style: TextStyle(fontSize: 16)),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
