import 'package:mobility_framework/backend/http/SuperchargedHttp.dart';
import 'package:mobility_framework/backend/models/core/ICEPortalModel.dart';

class ICEPortalService {
  static Future<IcePortalModel> getICEPortal() async {
    var result = await SuperchargedHTTP.request(
        URL: 'https://iceportal.de/api1/rs/tripInfo/trip', timeout: 5000);

    if (result.toString().endsWith('</html>')) {
      return null;
    }

    return IcePortalModel.fromJson(result);
  }
}
