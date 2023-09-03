import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const String host = "172.19.240.1";
const int port = 5000;
const String apiPrefix = "/api";
const Duration timeoutDuration = Duration(seconds: 30);
const String storageGlobalKey = "SpendSavvy";

const String storageAccessUser = "accessUser";

const String storageLocale = "locale";
final RxInt selectedIndex = 0.obs;
final iconList=<IconData>[

  Icons.home,
  Icons.monetization_on,
  Icons.person,


];
