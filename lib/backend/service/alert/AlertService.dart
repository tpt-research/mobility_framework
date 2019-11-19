import 'package:mobility_framework/backend/constants/TrainAPIConstants.dart';
import 'package:mobility_framework/backend/http/SuperchargedHttp.dart';
import 'package:mobility_framework/backend/models/core/AlertModel.dart';

class AlertService {
  static Future<AlertModel> getAlert() async {
    var result = await SuperchargedHTTP.request(
        URL: TrainAPIConstants.API_URL + TrainAPIConstants.API_ENDPOINT_ALERT,
        timeout: 5000);

    return AlertModel.fromJson(result);
  }
}
