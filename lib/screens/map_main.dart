import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

const MAPBOX_ACCESS_TOKEN = 'pk.eyJ1IjoiY2FybG1lbmUiLCJhIjoiY2x3czA4NDduMDBidzJtb21scjVhbzIxbiJ9.gifCQrBKRe2Xopn0CJ6DRA';

Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Verificar si los servicios de ubicación están habilitados
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Los servicios de ubicación están deshabilitados.');
  }

  // Verificar el estado de los permisos de ubicación
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Los permisos de ubicación están denegados.');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Los permisos de ubicación están denegados permanentemente, no podemos solicitarlos.');
  }

  // Obtener la posición actual del usuario
  return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
}

void main() {
  runApp(const MapMain());
}

class MapMain extends StatefulWidget {
  const MapMain({super.key});

  @override
  _MapMainState createState() => _MapMainState();
}

class _MapMainState extends State<MapMain> {
  LatLng _currentPosition = const LatLng(-33.000, 77.000); // Inicialmente 0,0
  bool _loading = true;
  late final MapController _mapController;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _getCurrentPosition();
  }

  // Función para obtener la posición actual y actualizar el estado
  void _getCurrentPosition() async {
    try {
      Position position = await determinePosition();
      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
        _loading = false;
        _mapController.move(_currentPosition, 13); // Mover el mapa a la nueva posición
      });
    } catch (e) {
      print(e);
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Mapa"),
          backgroundColor: Colors.blueAccent,
        ),
        body: _loading
            ? const Center(child: CircularProgressIndicator())
            : FlutterMap(
                mapController: _mapController, // Asignar el MapController
                options: MapOptions(
                  initialCenter: _currentPosition,
                  initialZoom: 13,
                  minZoom: 5,
                  maxZoom: 25,
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
                    additionalOptions: const {
                      'accessToken': MAPBOX_ACCESS_TOKEN,
                      'id': 'mapbox/streets-v12',
                    },
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: _currentPosition,
                        width: 80,
                        height: 80,
                        child: const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
