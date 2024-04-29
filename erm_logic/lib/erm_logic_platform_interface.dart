import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'erm_logic_method_channel.dart';

abstract class ErmLogicPlatform extends PlatformInterface {
  /// Constructs a ErmLogicPlatform.
  ErmLogicPlatform() : super(token: _token);

  static final Object _token = Object();

  static ErmLogicPlatform _instance = MethodChannelErmLogic();

  /// The default instance of [ErmLogicPlatform] to use.
  ///
  /// Defaults to [MethodChannelErmLogic].
  static ErmLogicPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ErmLogicPlatform] when
  /// they register themselves.
  static set instance(ErmLogicPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
