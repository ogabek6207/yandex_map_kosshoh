import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late YandexMapController controller;
  final animation =
      const MapAnimation(type: MapAnimationType.smooth, duration: 2.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          YandexMap(
            onMapCreated: (YandexMapController yandexMapController) async {
              controller = yandexMapController;
            },
          ),
          Positioned(
            bottom: 24,
            left: 24,
            child: GestureDetector(
              onTap: () async {
                // print(await Permission.locationWhenInUse.status);
                // if (await Permission.locationWhenInUse.isGranted) {
                //   print("Yes");
                // }
                await controller.moveCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: Point(
                        latitude: 41,
                        longitude:69,
                      ),
                      zoom: 11,
                    ),
                  ),
                  animation: animation,
                );
              },
              child: Container(
                height: 56,
                width: 56,
                color: Colors.red,
              ),
            ),
          ),
          Positioned(
            bottom: 124,
            left: 24,
            child: GestureDetector(
              onTap: () async {
                // var permission = await Geolocator.checkPermission();
                // print(permission);
                if (await Permission.locationWhenInUse.isGranted) {
                  var k = await Geolocator.getCurrentPosition();
                  await controller.moveCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                        // target: Point(
                        //   latitude: k.latitude,
                        //   longitude: k.longitude,
                        // ),
                        target: Point(
                          latitude: 41,
                          longitude:69,
                        ),
                        zoom: 11,
                      ),
                    ),
                    animation: animation,
                  );
                }
              },
              child: Container(
                height: 56,
                width: 56,
                color: Colors.yellow,
              ),
            ),
          )
        ],
      ),
    );
  }
}
