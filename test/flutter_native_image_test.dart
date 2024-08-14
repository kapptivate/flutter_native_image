import 'dart:io';

import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:flutter_native_image/flutter_native_image_method_channel.dart';
import 'package:flutter_native_image/flutter_native_image_platform_interface.dart';
import 'package:flutter_native_image/models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterNativeImagePlatform
    with MockPlatformInterfaceMixin
    implements FlutterNativeImagePlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<File> compressImage(String fileName,
      {int percentage = 70,
      int quality = 70,
      int targetWidth = 0,
      int targetHeight = 0}) {
    // TODO: implement compressImage
    throw UnimplementedError();
  }

  @override
  Future<File> cropImage(
      String fileName, int originX, int originY, int width, int height) {
    // TODO: implement cropImage
    throw UnimplementedError();
  }

  @override
  Future<ImageProperties> getImageProperties(String fileName) {
    // TODO: implement getImageProperties
    throw UnimplementedError();
  }

  @override
  Future<File> rotateImage(String fileName, int angle) {
    // TODO: implement rotateImage
    throw UnimplementedError();
  }
}

void main() {
  final FlutterNativeImagePlatform initialPlatform =
      FlutterNativeImagePlatform.instance;

  test('$MethodChannelFlutterNativeImage is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterNativeImage>());
  });

  test('getPlatformVersion', () async {
    FlutterNativeImage flutterNativeImagePlugin = FlutterNativeImage();
    MockFlutterNativeImagePlatform fakePlatform =
        MockFlutterNativeImagePlatform();
    FlutterNativeImagePlatform.instance = fakePlatform;

    expect(await flutterNativeImagePlugin.getPlatformVersion(), '42');
  });
}
