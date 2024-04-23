import 'package:feature_model/utils/constant/api_constant.dart';

import '../../utils/logging/logger.dart';

Uri getUri({required String url, Map<String, String>? prams}) {
  if (prams == null || prams.isEmpty) {
    // logs.i(Uri.parse(APIconstant.baseURL + url));
    return Uri.parse(ApiConstant.baseUrl + url);
  } else {
    var listData = [];
    prams.forEach(
      (key, value) {
        listData.add('$key=$value&');
      },
    );

    logs.i(listData.toString());

    logs.i(ApiConstant.baseUrl +
        url +
        listData
            .toString()
            .replaceAll('[', '?')
            .replaceAll(RegExp(r'[, ]'), '')
            .replaceAll('&]', '')
            .replaceAll('null', ''));

    return Uri.parse(
        "${ApiConstant.baseUrl}$url${listData.toString().replaceAll('[', '?').replaceAll(RegExp(r'[, ]'), '').replaceAll('&]', '').replaceAll('null', '')}");
  }
}
