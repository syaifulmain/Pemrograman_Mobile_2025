import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String myPosition = 'Unknown';
  Future<Position>? position;

  Future<Position> getPosition() async {
    await Geolocator.requestPermission();
    await Geolocator.isLocationServiceEnabled();
    await Future.delayed(const Duration(seconds: 3));
    Position? position = await Geolocator.getCurrentPosition();
    return position;
  }

  @override
  void initState() {
    super.initState();
    position = getPosition();
    // getPosition().then((position) {
    //   setState(() {
    //     myPosition =
    //         'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    // final myWidget = myPosition == 'Unknown'
    //       ? const CircularProgressIndicator()
    //       : Text(myPosition);

    // return Scaffold(
    //   appBar: AppBar(title: const Text('Syaiful Geolocation Example')),
    //   body: Center(child: myWidget),
    // );
    return Scaffold(
      appBar: AppBar(title: const Text('Syaiful Geolocation Example')),
      body: Center(
        child: FutureBuilder(
          future: position,
          builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              return Text(snapshot.data.toString());
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text('Something terrible happened!');
              }
              return Text(snapshot.data.toString());
            } else {
              return const Text('');
            }
          },
        ),
      ),
    );
  }
}
