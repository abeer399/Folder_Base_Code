import 'package:feature_model/features/department/models/deparment_model.dart';
import 'package:feature_model/features/department/service/department_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/dialogBox/dialog_box.dart';
import '../../../helpers/locator.dart';
import '../../../utils/logging/logger.dart';

final departmentControllerInstance =
    ChangeNotifierProvider.autoDispose((ref) => DeparmentController());

class DeparmentController extends ChangeNotifier {
  bool isLoading = true;
  late List<DeparmentModel> getData;

  Future<void> requestData(context) async {
    try {
      var data = await DeparmemtService.getDeparmemtData();
      if (data is String) {
        logs.i(data);
        isBusy(context);
        locator<DialogClass>().apiMsgDialog(context, msg: data);
      } else {
        getData = data;
        isBusy(context);
      }
    } catch (e) {
      logs.i(e);
      isBusy(context);
    }
  }

  void isBusy(context) {
    isLoading = !isLoading;
    notifyListeners();
  }
}
