import 'package:location/location.dart';

class LocationRespiratory {
  Location location = Location();
  String latitudelongitude = '';

  Future<void> requestLocationPermission() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    getLocation();
  }

  Future<String> getLocation() async {
    LocationData currentLocation = await location.getLocation();

    return "${currentLocation.latitude} + ${currentLocation.longitude}";
  }
}
