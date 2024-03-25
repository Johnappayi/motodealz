import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:motodealz/utils/popups/loader.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();
  
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>>
      _connectivitySubscription; // Update the type here
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> results) async {
    final result = results.isNotEmpty ? results.last : ConnectivityResult.none;
    _connectionStatus.value = result;
    if (_connectionStatus.value == ConnectivityResult.none) {
      MLoaders.warningSnackBar(title: 'No Internet Connection');
    }
  }

  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      // ignore: unrelated_type_equality_checks
      if (result == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
