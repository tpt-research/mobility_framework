import 'package:mobility_framework/backend/http/SuperchargedHttp.dart';
import 'package:mobility_framework/backend/models/tier/TierModel.dart';

class TierService {
  static Future<TierModel> getTierScooter(
      double lat, double lon, int radius) async {
    var result = await SuperchargedHTTP.requestAdvanced(
        URL: 'https://platform.tier-services.io/vehicle?lat=' +
            lat.toString() +
            '&lng=' +
            lon.toString() +
            '&radius=' +
            radius.toString(),
        headers: {'X-Api-Key': 'bpEUTJEBTf74oGRWxaIcW7aeZMzDDODe1yBoSxi2'},
        timeout: 5000);

    return TierModel.fromJson(result);
  }
}
