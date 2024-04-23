import 'package:feature_model/features/department/models/deparment_model.dart';

import '../../../utils/constant/enums.dart';
import '../../../utils/local_storage/shared_preferences.dart';
import '../../../utils/logging/logger.dart';
import 'package:http/http.dart' as http;

class DeparmemtService {
  static Future getDeparmemtData({context}) async {
    String token = await SharedPref.getString(UserPrefEnum.token);
    var headers = {'Authorization': 'bearer $token'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://crystalonbritsols.net2online.com/api/v1/departments'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      List<DeparmentModel> data =
          deparmentModelFromJson(await response.stream.bytesToString());
      logs.i(data[1].name);
    } else {
      logs.i(response.reasonPhrase);
    }
  }
}
