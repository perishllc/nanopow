import 'package:flutter_test/flutter_test.dart';
import 'package:nanopow/nanopow.dart';
import 'package:nanopow/nanopow_platform_interface.dart';
import 'package:nanopow/nanopow_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNanopowPlatform
    with MockPlatformInterfaceMixin
    implements NanopowPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final NanopowPlatform initialPlatform = NanopowPlatform.instance;

  test('$MethodChannelNanopow is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNanopow>());
  });

  test('getPlatformVersion', () async {
    Nanopow nanopowPlugin = Nanopow();
    MockNanopowPlatform fakePlatform = MockNanopowPlatform();
    NanopowPlatform.instance = fakePlatform;

    expect(await nanopowPlugin.getPlatformVersion(), '42');
  });
}
