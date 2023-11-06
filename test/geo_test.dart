import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';

void Main(){
  GeoTest();
}

class GeoTest extends StatefulWidget {
  const GeoTest({super.key});

  @override
  State<GeoTest> createState() => _GeoTestState();
}

class _GeoTestState extends State<GeoTest> {
  late String lat;
  late String long;

  Future<Position> _getCurrentLocation() async{
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      return Future.error("location error");
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission ==  LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return Future.error("에러2");
      }
    }
    if(permission == LocationPermission.deniedForever){
      return Future.error("에러3");
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _getCurrentLocation().then((value) {
              lat = '${value.latitude}';
              long = '${value.longitude}';
              setState(() {
                Logger().d("lat ${lat}");
                Logger().d("long ${long}");
              });
            });
          },child: Text("간다간다"),
        ),
      ),
    );
  }
}
