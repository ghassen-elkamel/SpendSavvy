import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_widgets/atom_alert_dialog.dart';


import '../values/colors.dart';

showAlertDialog(
    {IconData? icon,
    String? image,
    String? title,
    TextStyle? titleStyle,
    String? subTitle,
    TextAlign? subTitleAlign,
    Widget? content,
    List<Widget> actions = const [],
    Function()? onClose}) {
  if (Get.context != null) {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AtomAlertDialog(
          icon: icon,
          image: image,
          title: title,
          titleStyle: titleStyle,
          subTitle: subTitle,
          content: content,
          actions: actions,
          onClose: onClose,
          subTitleAlign: subTitleAlign,
        );
      },
    );
  }
}

showAtomSnackBar(
    {required String title,
    required String message,
    bool isSucceed = false,
    Duration? duration}) {
  return GetSnackBar(
    titleText: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title.tr,

        ),
        InkWell(
          onTap: () => Get.closeCurrentSnackbar(),
          child: const Icon(
            Icons.close,
            color: Colors.black
          ),
        ),
      ],
    ),
    messageText: Text(
      message.tr,

    ),
    snackPosition: SnackPosition.TOP,
    margin: const EdgeInsets.only(
      left: 8,
      right: 8,
      top: 85,
    ),
    padding: const EdgeInsets.only(top: 13, bottom: 16, left: 20.55, right: 13),
    backgroundColor: white,
    duration: duration,
    borderRadius: 10,
    icon: const Icon(
      Icons.close,
      color: Colors.black
    ),
    boxShadows: const [BoxShadow(color: white, blurRadius: 1)],
  );
}

showErrors(Map<String, dynamic> data) {
  showAlertDialog(
      title: data["message"] ?? "",
      subTitle: data["errors"] ?? "",
      subTitleAlign: TextAlign.start);
}

safeBack<T>({T? result}) {
  if (Get.previousRoute.isEmpty) {
    Get.offAllNamed(Get.currentRoute.split("/")[1]);
  } else {
    Get.back(result: result);
  }
}

bool isMobile(BuildContext context) {
  return !kIsWeb || MediaQuery.of(context).size.width < 750;
}
