import 'package:feature_model/utils/constant/enums.dart';
import 'package:feature_model/utils/local_storage/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '/features/authentication/signin/models/login_model.dart';
import '../../../../utils/logging/logger.dart';

class LoginService {
  static Future postLogin(
      {context, required String email, required String password}) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://crystalonbritsols.net2online.com/api/v1/authorization/tokens'));
    request.fields.addAll({
      'username': email,
      'password': password,
      'grant_type': 'password',
      'client_id': '629569fa-8c19-477b-bdee-828e1ae83463',
      'scope': 'offline_access'
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      LoginModel data =
          loginModelFromJson(await response.stream.bytesToString());
      logs.i(data.accessToken);
      SharedPref.setString(UserPrefEnum.token, data.accessToken);
      return data;
    } else {
      logs.i(response.reasonPhrase);
      return "Unauthenticated";
    }
  }
}
