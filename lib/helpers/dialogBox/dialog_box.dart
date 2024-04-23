import 'package:flutter/material.dart';

import '../../utils/constant/color_constants.dart';

class DialogClass {
  // No Interner Dialog
  Future<void> noInternetDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          icon: const Icon(
            Icons.signal_wifi_statusbar_connected_no_internet_4_rounded,
            size: 75,
            color: AppColors.error,
          ),
          title: const Text(
            'Whoops!',
            style: TextStyle(color: AppColors.error),
          ),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'No internet connection found.',
                  textAlign: TextAlign.center,
                ),
                Text('Check you connection or try again.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Ok',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Show message of from API response
  Future<void> apiMsgDialog(context, {required String msg}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // icon: const Icon(
          //   Icons.signal_wifi_statusbar_connected_no_internet_4_rounded,
          //   size: 75,
          //   color: AppColors.error,
          // ),
          title: const Text(
            'Success!',
            style: TextStyle(color: AppColors.info),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  msg,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Ok',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Show image picker dialog
  //Future
  // <XFile?>
  imagePickerDialog(context, controller) async {
    // return
    // final ImagePicker picker = ImagePicker();

    // XFile? image;
    return await showDialog
        // <XFile?>
        (
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                icon: const Icon(
                  Icons.image_outlined,
                  size: 75,
                  color: AppColors.secondary,
                ),
                title: const Text(
                  'Select Option',
                  style: TextStyle(color: AppColors.info),
                ),
                content: const SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text(
                        "To upload image",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () async => Navigator.pop(
                                context,
                                // await picker.pickImage(source: ImageSource.camera)
                              ),
                          child: const Text("Camera")),
                      ElevatedButton(
                          onPressed: () async => Navigator.pop(
                                context,
                                // await picker.pickImage(source: ImageSource.gallery)
                              ),
                          child: const Text("Gallery")),
                    ],
                  ),
                ],
              );
            });
  }

  // No Location Dialog
  Future<void> noLocationDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          icon: const Icon(
            Icons.location_off,
            size: 75,
            color: AppColors.error,
          ),
          title: const Text(
            'Whoops!',
            style: TextStyle(color: AppColors.error),
          ),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Seems you have denied to access your location.',
                  textAlign: TextAlign.center,
                ),
                Text(
                  'This is just for us to able to help you find the best practitioners around you please senable location tracking.',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Ok',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // No Interner Dialog
  Future<void> isProfileActiveDialog({context, required bool isActive}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          // icon: const Icon(
          //   Icons.signal_wifi_statusbar_connected_no_internet_4_rounded,
          //   size: 75,
          //   color: AppColors.error,
          // ),
          title: Text(
            isActive ? 'congratulations!' : 'Whoops!',
            style: const TextStyle(color: AppColors.info),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  isActive
                      ? "Your profile has successfuly active."
                      : 'please wait for 1-3 business days to get approval for service.',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Ok',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  //? Demo dialog

  // Future<String?> showCustomDialog(context) async {
  //   String? result;

  //   await showDialog<String>(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text('Enter a value'),
  //         content: TextField(
  //           onChanged: (value) => result = value,
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.pop(context),
  //             child: Text('Cancel'),
  //           ),
  //           TextButton(
  //             onPressed: () => Navigator.pop(context, result),
  //             child: Text('OK'),
  //           ),
  //         ],
  //       );
  //     },
  //   );

  //   return result;
  // }
}
