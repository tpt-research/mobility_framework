import 'package:mobility_framework/backend/http/SuperchargedHttp.dart';
import 'package:mobility_framework/backend/models/circ/CircModel.dart';

class CircService {
  static Future<CircModel> getCircScooter(double lat, double lon) async {
    var result = await SuperchargedHTTP.request(
        URL: 'https://api.goflash.com/api/Mobile/Scooters?userLatitude=' +
            lat.toString() +
            '&userLongitude=' +
            lon.toString() +
            '&lang=de&latitude=' +
            lat.toString() +
            '&longitude=' +
            lon.toString() +
            '&latitudeDelta=0.01&longitudeDelta=0.01',
        timeout: 5000);

    return CircModel.fromJson(result);
  }
}
