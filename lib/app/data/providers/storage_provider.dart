import 'dart:convert';

import 'package:localstorage/localstorage.dart';

import '../../core/utils/constant.dart';


class StorageHelper {
  static StorageHelper? _instance;
  late LocalStorage storage;

  factory StorageHelper() {
    _instance ??= StorageHelper._internal();
    return _instance!;
  }

  StorageHelper._internal() {
    storage = LocalStorage(storageGlobalKey);
  }

  dynamic fetchOrCreateItem(
      {required String key, required dynamic item}) async {
    dynamic data = await fetchItem(key);
    if (data == null) {
      await saveItem(key, item);
      data = item;
    }
    return data;
  }

  Future<void> updateItem({required String key, required dynamic item}) async {
    await saveItem(key, item);
  }

  Future<void> saveItem(String key, dynamic item) async {
    await storage.ready;
    storage.setItem(key, jsonEncode(item));
  }

  dynamic fetchItem(String key) async {
    await storage.ready;
    try {
      String? data = storage.getItem(key);
      if (data != null) {
        return jsonDecode(data);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  clean() async {
    storage.clear();
  }

  Future<void> removeItem(String key) {
    return storage.deleteItem(key);
  }
}
