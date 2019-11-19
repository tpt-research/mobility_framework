import 'dart:async';

import 'package:mobility_framework/backend/constants/OSMConstants.dart';
import 'package:mobility_framework/backend/http/SuperchargedHttp.dart';
import 'package:mobility_framework/backend/models/osm/Nominatim.dart';

class NominatimRequest {
  static Future<Nominatim> getPlace(double lat, double lon) async {
    var result = await SuperchargedHTTP.request(
        URL: OSMConstants.API_URL +
            '/reverse?format=json&lat=' +
            lat.toString() +
            '&lon=' +
            lon.toString() +
            '&addressdetails=1',
        timeout: 5000);

    return Nominatim.fromJson(result);
  }
}
