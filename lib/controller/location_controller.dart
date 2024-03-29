import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../data/repository/location_repo.dart';
import '../models/AddressModel.dart';

class LocationController extends GetxController implements GetxService {

  LocationRepo locationRepo;

  LocationController({required this.locationRepo});

  bool _loading = false;
  late Position _position;
  late Position _pickPosition;

  bool get loading => _loading;
  Position get position => _position;
  Position get pickPosition => _pickPosition;

  Placemark _placemark = Placemark();
  Placemark _pickPlacemark = Placemark();
  Placemark get placemark => _placemark;
  Placemark get pickPlacemark => _pickPlacemark;

  List<AddressModel> _addressList = [];
  List<AddressModel> get addressList => _addressList;
  late List<AddressModel> _allAddressList = [];

  List<String> _addressTypeList = ["home", "office", "others"];
  List<String> get addressTypeList => _addressTypeList;
  int _addressTypeIndex = 0;
  int get addressTypeIndex => _addressTypeIndex;

  late Map<String, dynamic> _getAddress;
  Map get getAddress => _getAddress;

  late GoogleMapController _mapController;
  bool _updateAddressData = true;
  bool _changeAddress = true;

  void setMapController(GoogleMapController mapController) {
    _mapController = mapController;
  }

  void updatePosition(CameraPosition position, bool fromAddress) async {
    if(_updateAddressData) {
      _loading = true;
      update();
      try {
        if(fromAddress) {
          _position = Position(
            latitude: position.target.latitude,
            longitude: position.target.longitude,
            timestamp: DateTime.now(),
            heading: 1,
            accuracy: 1,
            altitude: 1,
            speedAccuracy: 1,
            speed: 1
          );
        } else {
          _pickPosition = Position(
              latitude: position.target.latitude,
              longitude: position.target.longitude,
              timestamp: DateTime.now(),
              heading: 1,
              accuracy: 1,
              altitude: 1,
              speedAccuracy: 1,
              speed: 1
          );
        }

        if(_changeAddress) {
          String _address = await getAddressfromGeocode(
            LatLng(position.target.latitude,
                position.target.longitude)
          );
          fromAddress? _placemark = Placemark(name: _address):
          _pickPlacemark = Placemark(name: _address);

        }
      } catch(e) {
        print(e);
      }
    }
  }

  Future<String> getAddressfromGeocode(LatLng latLng) async {

    List<Placemark> response = await locationRepo.getAddressfromGeocode(latLng);
    String _address = response[0].street! + ', ' +
        response[0].subLocality! + ', ' +
        response[0].locality! + ', ' +
        response[0].subAdministrativeArea! + ', ' +
        response[0].administrativeArea!;

    print(_address);

    return _address;
  }

  void setAddressTypeIndex(int index) {
    _addressTypeIndex = index;
    update();
  }
}