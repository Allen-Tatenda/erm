import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'erm_logic_platform_interface.dart';

/// An implementation of [ErmLogicPlatform] that uses method channels.
class MethodChannelErmLogic extends ErmLogicPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('erm_logic');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
