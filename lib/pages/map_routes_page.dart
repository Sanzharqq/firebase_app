import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapRoutesPage extends StatefulWidget {
  const MapRoutesPage({Key? key}) : super(key: key);

  @override
  State<MapRoutesPage> createState() => _MapRoutesPageState();
}

class _MapRoutesPageState extends State<MapRoutesPage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(51.1605, 71.4704);

  final List<Marker> _markers = [
    Marker(
      markerId: MarkerId('shchuchye_lake'),
      position: LatLng(52.9000, 70.3333),
      infoWindow: InfoWindow(title: 'Shchuchye Lake'),
    ),
    Marker(
      markerId: MarkerId('bayanaul'),
      position: LatLng(50.7746, 74.6279),
      infoWindow: InfoWindow(title: 'Bayanaul National Park'),
    ),
    Marker(
      markerId: MarkerId('ak_mechet'),
      position: LatLng(44.8453, 65.4841),
      infoWindow: InfoWindow(title: 'Ak-Mechet Cave'),
    ),

    Marker(
      markerId: MarkerId('charyn_canyon'),
      position: LatLng(43.3651, 79.0720),
      infoWindow: InfoWindow(title: 'Charyn Canyon'),
    ),
    Marker(
      markerId: MarkerId('kaindy_lake'),
      position: LatLng(42.9817, 78.5645),
      infoWindow: InfoWindow(title: 'Kaindy Lake'),
    ),
    Marker(
      markerId: MarkerId('big_almaty_lake'),
      position: LatLng(43.0500, 76.9855),
      infoWindow: InfoWindow(title: 'Big Almaty Lake'),
    ),
    Marker(
      markerId: MarkerId('bozjyra'),
      position: LatLng(43.4400, 54.2600),
      infoWindow: InfoWindow(title: 'Bozjyra Valley'),
    ),
    Marker(
      markerId: MarkerId('mangystau'),
      position: LatLng(44.0000, 54.0000),
      infoWindow: InfoWindow(title: 'Mangystau Mountains'),
    ),
  ];

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Maps and routes')),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _center, zoom: 6.5),
        markers: Set<Marker>.of(_markers),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('The route building feature is coming soon!'),
            ),
          );
        },
        label: Text('Show routes'),
        icon: Icon(Icons.directions),
      ),
    );
  }
}
