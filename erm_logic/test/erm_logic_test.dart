import 'package:flutter_test/flutter_test.dart';
import 'package:erm_logic/erm_logic.dart';
import 'package:erm_logic/erm_logic_platform_interface.dart';
import 'package:erm_logic/erm_logic_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockErmLogicPlatform
    with MockPlatformInterfaceMixin
    implements ErmLogicPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ErmLogicPlatform initialPlatform = ErmLogicPlatform.instance;

  test('$MethodChannelErmLogic is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelErmLogic>());
  });

  test('getPlatformVersion', () async {
    ErmLogic ermLogicPlugin = ErmLogic();
    MockErmLogicPlatform fakePlatform = MockErmLogicPlatform();
    ErmLogicPlatform.instance = fakePlatform;

    expect(await ermLogicPlugin.getPlatformVersion(), '42');
  });
}
