import 'package:firebase_auther/firebase_options.dart';
import 'package:firebase_auther/pages/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const AuthPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  LoginPage({super.key});

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return;

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await _auth.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: signInWithGoogle,
          icon: const Icon(Icons.login, color: Colors.white),
          label: const Text('Sign in with Google'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}

class PlaceDetailPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String location;
  final double rating;
  final String bestSeason;

  const PlaceDetailPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.location,
    required this.rating,
    required this.bestSeason,
  });

  String getExtendedInfo() {
    switch (title) {
      case "Burabay":
        return "Burabay is known as the 'Kazakh Switzerland' due to its stunning lakes and forests.";
      case "Bozzhyra":
        return "Bozzhyra features surreal desert landscapes and unique rock formations.";
      case "Charyn Canyon":
        return "Charyn Canyon offers breathtaking views and hiking trails, often compared to the Grand Canyon.";
      case "Yasawi Mausoleum":
        return "This mausoleum is an iconic spiritual and architectural landmark.";
      case "Kolsay Lakes":
        return "The Kolsay Lakes are alpine lakes surrounded by mountain beauty.";
      case "Shymbulak":
        return "Shymbulak is Central Asia’s premier ski resort, popular year-round.";
      default:
        return "Explore the beauty of Kazakhstan through this wonderful destination.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: Colors.blue),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                description,
                style: const TextStyle(fontSize: 16, height: 1.5),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.place, color: Colors.blue),
                      const SizedBox(width: 6),
                      Text(location, style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber),
                      const SizedBox(width: 6),
                      Text(
                        rating.toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, color: Colors.green),
                      const SizedBox(width: 6),
                      Text(
                        "Best Season: $bestSeason",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                getExtendedInfo(),
                style: const TextStyle(fontSize: 16, height: 1.5),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class TopPlaces extends StatelessWidget {
  const TopPlaces({super.key});

  final List<Map<String, dynamic>> places = const [
    {
      "image": "images/bozzhyra.jpg",
      "title": "Bozzhyra",
      "description": "A stunning natural wonder in the desert.",
      "location": "Mangystau Region",
      "rating": 4.8,
      "bestSeason": "Spring & Fall",
      "price": "120",
      "availability": "Available now",
    },
    {
      "image": "images/burabay.jpg",
      "title": "Burabay",
      "description": "A picturesque national park with lakes and forests.",
      "location": "Akmola Region",
      "rating": 4.6,
      "bestSeason": "Summer",
      "price": "90",
      "availability": "Available now",
    },
    {
      "image": "images/charyn.jpeg",
      "title": "Charyn Canyon",
      "description": "Breathtaking canyon, similar to the Grand Canyon.",
      "location": "Almaty Region",
      "rating": 4.7,
      "bestSeason": "Summer & Early Fall",
      "price": "110",
      "availability": "Limited spots",
    },
    {
      "image": "images/khodja.jpg",
      "title": "Yasawi Mausoleum",
      "description": "A UNESCO World Heritage site with deep history.",
      "location": "Turkestan",
      "rating": 4.5,
      "bestSeason": "Spring & Fall",
      "price": "80",
      "availability": "Available now",
    },
    {
      "image": "images/kolsay.jpg",
      "title": "Kolsay Lakes",
      "description": "Beautiful alpine lakes perfect for hiking.",
      "location": "Almaty Region",
      "rating": 4.9,
      "bestSeason": "Summer",
      "price": "100",
      "availability": "Available now",
    },
    {
      "image": "images/shymbulak.jpeg",
      "title": "Shymbulak",
      "description": "Central Asia’s top ski resort.",
      "location": "Almaty",
      "rating": 4.4,
      "bestSeason": "Winter",
      "price": "130",
      "availability": "Available now",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "Top Places",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    children:
                        places.map((place) {
                          return PlaceCard(
                            imagePath: place["image"],
                            title: place["title"],
                            description: place["description"],
                            location: place["location"],
                            rating: place["rating"],
                            bestSeason: place["bestSeason"],
                            price: place["price"],
                            availability: place["availability"],
                          );
                        }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlaceCard extends StatefulWidget {
  final String imagePath;
  final String title;
  final String description;
  final String location;
  final double rating;
  final String bestSeason;
  final String price;
  final String availability;
  final bool isFavorite;

  const PlaceCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.location,
    required this.rating,
    required this.bestSeason,
    required this.price,
    required this.availability,
    this.isFavorite = false,
  });

  @override
  State<PlaceCard> createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              widget.imagePath,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    _isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      _isFavorite = !_isFavorite;
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  widget.location,
                  style: const TextStyle(color: Colors.grey),
                ),
                const Spacer(),
                const Icon(Icons.star, size: 16, color: Colors.amber),
                const SizedBox(width: 4),
                Text(widget.rating.toString()),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Text(
              widget.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.black87),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Text(
                  "Best season: ${widget.bestSeason}",
                  style: const TextStyle(fontSize: 12, color: Colors.green),
                ),
                const Spacer(),
                Text(
                  "\$${widget.price}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Text(
              widget.availability,
              style: const TextStyle(color: Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => PlaceDetailPage(
                            imagePath: widget.imagePath,
                            title: widget.title,
                            description: widget.description,
                            location: widget.location,
                            rating: widget.rating,
                            bestSeason: widget.bestSeason,
                          ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text("See More"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
