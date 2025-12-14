import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String myPosition = 'Unknown';

  Future<Position> getPosition() async {
    await Geolocator.requestPermission();
    await Geolocator.isLocationServiceEnabled();
    Position? position = await Geolocator.getCurrentPosition();
    return position;
  }

  @override
  void initState() {
    super.initState();
    getPosition().then((position) {
      setState(() {
        myPosition =
            'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final myWidget = myPosition == 'Unknown'
          ? const CircularProgressIndicator()
          : Text(myPosition);

    return Scaffold(
      appBar: AppBar(title: const Text('Syaiful Geolocation Example')),
      body: Center(child: myWidget),
    );
  }
}
