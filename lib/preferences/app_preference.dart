import 'package:finowise/preferences/pref_helper.dart';
import 'package:get_storage/get_storage.dart';

class AppPreference extends PreferenceHelper {
  final _pref = GetStorage('finowisepref');

  @override
  String? get accessToken => _pref.read('accessToken');

  @override
  set accessToken(String? accessToken) {
    _pref.write('accessToken', accessToken);
  }

  @override
  bool? get isLoggedIn => _pref.read('isLoggedIn');

  @override
  set isLoggedIn(bool? isLoggedIn) {
    _pref.write('isLoggedIn', isLoggedIn);
  }
}
