import 'package:mobility_framework/backend/http/SuperchargedHttp.dart';
import 'package:mobility_framework/backend/models/nextbike/NextbikeModel.dart';

class NextbikeService {
  static Future<NextbikeModel> getNextbike() async {
    var result = await SuperchargedHTTP.request(
        URL:
            'https://gbfs.nextbike.net/maps/gbfs/v1/nextbike_de/de/free_bike_status.json',
        timeout: 5000);

    return NextbikeModel.fromJson(result);
  }
}
