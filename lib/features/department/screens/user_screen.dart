import 'package:feature_model/features/authentication/signin/screens/login_screen.dart';
import 'package:feature_model/features/department/controller/department_controller.dart';
import 'package:feature_model/utils/constant/color_constants.dart';
import 'package:feature_model/utils/device/media_query.dart';
import 'package:feature_model/utils/local_storage/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DepartmentView extends ConsumerStatefulWidget {
  const DepartmentView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DepartmentViewState();
}

class _DepartmentViewState extends ConsumerState<DepartmentView> {
  @override
  void initState() {
    ref.read(departmentControllerInstance).requestData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var controller = ref.watch(departmentControllerInstance);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.secondary,
          centerTitle: true,
          title: const Text(
            "Departments",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: AppColors.scaffoldColor),
          ),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  SharedPref.logoutFunc();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const LoginScreen()));
                },
                icon: const Icon(
                  Icons.logout,
                  color: AppColors.scaffoldColor,
                ))
          ],
        ),
        body: controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SizedBox(
                height: screenHeight,
                width: screenWidth,
                child: ListView.builder(
                    itemCount: controller.getData.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Icon(Icons.local_fire_department),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  controller.getData[index].name,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                        ],
                      );
                    }),
              ));
  }
}
