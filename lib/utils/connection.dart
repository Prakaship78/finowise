// ignore_for_file: public_member_api_docs

import 'package:connectivity_plus/connectivity_plus.dart';

class Connection {
  static var sharedInstance = Connection();

  Future<ConnectivityResult> checkConnectivity() {
    final connectivityResult = Connectivity().checkConnectivity();
    return connectivityResult;
  }
}
