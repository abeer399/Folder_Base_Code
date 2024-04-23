import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../utils/device/internet_checker.dart';
import '../../utils/logging/logger.dart';
import '../dialogBox/dialog_box.dart';
import '../locator.dart';
import 'uri_url.dart';

class APIHelperClass {
  Future getAPI(
      {required String url,
      Map<String, String>? prams,
      Map<String, String>? headers,
      context}) async {
    logs.i(getUri(url: url));
    return await http.get(getUri(url: url, prams: prams), headers: headers);
  }

  Future postAPI({
    required String url,
    Map<String, String>? prams,
    Map<String, String>? headers,
    required Map<dynamic, dynamic>? body,
  }) async {
    return await http.post(getUri(url: url, prams: prams),
        headers: headers, body: json.encode(body));
  }

  Future stripCardToken({
    required String url,
    Map<String, String>? prams,
    Map<String, String>? headers,
    required Map<String, String> bodyFields,
  }) async {
    var request = http.Request('POST', Uri.parse(url));
    request.bodyFields = bodyFields;
    request.headers.addAll(headers!);
    return await request.send();
  }

  Future postMultipartRequestAPI({
    required String url,
    Map<String, String>? prams,
    Map<String, String> headers = const <String, String>{
      'Accept': 'application/json'
    },
    Map<String, String>? fields,
    required Map<String, String> files,
  }) async {
    var request = http.MultipartRequest('POST', getUri(url: url, prams: prams));
    request.fields.addAll(fields!);
    files.forEach((key, value) async {
      request.files.add(await http.MultipartFile.fromPath(key, value));
    });
    request.headers.addAll(headers);
    return await request.send();
  }

  //* Main function of API call
  Future apiFunc(
      {required String url,
      Map<String, String>? prams,
      Map<String, String>? headers = const <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      Map<dynamic, dynamic>? body,
      Map<String, String>? fields,
      Map<String, String>? bodyFields,
      Map<String, String>? files,
      required context}) async {
    try {
      // Internet check
      bool hasInternet = await locator<InternetCheck>().iC();

      if (hasInternet == false) {
        locator<DialogClass>().noInternetDialog(context);
        return false;
      }

      // Check and call apis function using parameters.
      // ignore: prefer_typing_uninitialized_variables
      var response;
      // http.StreamedResponse streamedResponse;
      if (body == null && bodyFields == null && files == null) {
        response = await getAPI(url: url, prams: prams, headers: headers);
      } else {
        if (files != null) {
          response = await postMultipartRequestAPI(
              url: url, headers: headers!, fields: fields, files: files);
        } else if (bodyFields != null) {
          response = await stripCardToken(
              url: url,
              prams: prams,
              headers: headers!,
              bodyFields: bodyFields);
        } else {
          response = await postAPI(
              url: url, prams: prams, headers: headers!, body: body);
        }
      }

      late String msg;
      List returnList = [];

      if (response is http.Response) {
        if (url != "api/download-invoice") {
          msg = json.decode(response.body)["message"].toString();
        } else {
          msg = "";
        }
        returnList = [msg, response, response.statusCode];
      } else if (response is http.StreamedResponse) {
        var resp = await response.stream.bytesToString();
        var responseDecode = json.decode(resp);
        msg = responseDecode["message"] ?? "Kindly, recheck your card details.";
        returnList = [msg, resp, response.statusCode, response];
      }

      // Status code check
      if (response.statusCode >= 400) {
        logs.e('Some Error - Status code = ${response.statusCode}');
        logs.e(msg);
        return returnList;
      } else if (response.statusCode >= 300) {
        logs.e('Some Error - Status code = ${response.statusCode}');
        logs.e(msg);
        return returnList;
      } else if (response.statusCode >= 200) {
        logs.e(msg);
        return returnList;
      }
    } on HttpException catch (error) {
      logs.e(error.toString());
      return null;
    } catch (error) {
      logs.e(error.toString());
      return null;
    }
  }
}
