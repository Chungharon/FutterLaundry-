import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundryhub/utils/popups/loaders.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  /// Initialize the network manager and set up a stream to continuously check the connection status.
  @override
  void onInit() {
    super.onInit();
    _initializeConnectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      _updateConnectionStatus(results.isNotEmpty ? results.first : ConnectivityResult.none);
    });
  }

  /// Initialize connectivity status on startup
  Future<void> _initializeConnectivity() async {
    try {
      final List<ConnectivityResult> results = await _connectivity.checkConnectivity();
      _updateConnectionStatus(results.isNotEmpty ? results.first : ConnectivityResult.none);
    } catch (e) {
      debugPrint('Failed to get connectivity: $e');
      _updateConnectionStatus(ConnectivityResult.none);
    }
  }

  /// Update the connection status based on the connectivity and show a relevant popup for no internet connection.
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus.value = result;
    if (_connectionStatus.value == ConnectivityResult.none) {
      TLoaders.warningSnackBar(
        title: 'No Internet Connection',
        message: 'Please check your internet connection and try again.',
      );
    }
  }

  /// Check the internet connection status.
  /// Returns 'true' if connected, 'false' otherwise.
  Future<bool> isConnected() async {
    try {
      final List<ConnectivityResult> results = await _connectivity.checkConnectivity();
      return results.isNotEmpty && results.first != ConnectivityResult.none;
    } catch (e) {
      debugPrint('Error checking connectivity: $e');
      return false;
    }
  }

  /// Get current connection status
  ConnectivityResult get connectionStatus => _connectionStatus.value;

  /// Check if currently connected (reactive)
  bool get isCurrentlyConnected => _connectionStatus.value != ConnectivityResult.none;

  /// Dispose of the stream subscription
  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }
}