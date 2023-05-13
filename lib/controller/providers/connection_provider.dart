import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

class ConnectionProvide extends ChangeNotifier {
  bool isOffline = true;
  StreamSubscription? connection;

  initialize() {
    connection = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        isOffline = true;
        notifyListeners();
      } else if (result == ConnectivityResult.mobile) {
        isOffline = false;
        notifyListeners();
      } else if (result == ConnectivityResult.wifi) {
        isOffline = false;
        notifyListeners();
      } else if (result == ConnectivityResult.ethernet) {
        isOffline = false;
        notifyListeners();
      }
    });
  }

  close() {
    connection!.cancel();
  }
}
