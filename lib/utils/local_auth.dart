import 'package:local_auth/local_auth.dart';
import 'package:flutter/material.dart';

class LocalAuth {
  static final LocalAuthentication _auth = LocalAuthentication();

  static Future<bool> _canAuthenticate() async =>
      await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

  static Future<bool> authenticate() async {
    try {
      if (!await _canAuthenticate()) return false;

      return await _auth.authenticate(
          localizedReason: 'Authenticate to access Kitty',
          options: AuthenticationOptions(
            stickyAuth: true,
            biometricOnly: false,
          ));
    } catch (e) {
      debugPrint('error $e');
      return false;
    }
  }
}
