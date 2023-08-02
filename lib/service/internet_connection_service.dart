 

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  static final ConnectivityService _instance = ConnectivityService._internal();
  factory ConnectivityService() => _instance;

  ConnectivityService._internal();

  Stream<ConnectivityResult> get connectivityStream =>
      Connectivity().onConnectivityChanged;
}