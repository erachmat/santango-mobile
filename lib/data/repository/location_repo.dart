import 'package:dapurgo/data/api/api_client.dart';
import 'package:dapurgo/utils/app_constants.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart.';
import 'package:http/http.dart' as http;

class LocationRepo {

  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  LocationRepo({required this.apiClient, required this.sharedPreferences});

  Future<List<Placemark>> getAddressfromGeocode(LatLng latLng) async {
    // return await apiClient.getData('${AppConstant.GEOCODE_URI}'
    //     '?lat=${latLng.latitude}&lng=${latLng.longitude}'
    // );
    return await placemarkFromCoordinates(
        latLng.latitude, latLng.longitude);
  }
}