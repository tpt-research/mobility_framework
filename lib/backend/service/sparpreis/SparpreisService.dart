import 'package:mobility_framework/backend/constants/SparpreisConstants.dart';
import 'package:mobility_framework/backend/http/SuperchargedHttp.dart';
import 'package:mobility_framework/backend/models/core/SparpreisFinderModel.dart';

class SparpreisService {
  static Future<SparpreisFinderModel> getSparpreise(
      String from, String to, String when) async {
    var result = await SuperchargedHTTP.request(
        URL: SparpreisConstants.API_URL +
            SparpreisConstants.API_ENDPOINT_SPARPREIS +
            "/" +
            from +
            "/" +
            to +
            "/" +
            when,
        timeout: 5000);

    return SparpreisFinderModel.fromJson(result);
  }
}
