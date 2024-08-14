import 'dart:io';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_native_image_method_channel.dart';
import 'models.dart';

abstract class FlutterNativeImagePlatform extends PlatformInterface {
  /// Constructs a FlutterNativeImagePlatform.
  FlutterNativeImagePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterNativeImagePlatform _instance =
      MethodChannelFlutterNativeImage();

  /// The default instance of [FlutterNativeImagePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterNativeImage].
  static FlutterNativeImagePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterNativeImagePlatform] when
  /// they register themselves.
  static set instance(FlutterNativeImagePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<File> compressImage(String fileName,
      {int percentage = 70,
      int quality = 70,
      int targetWidth = 0,
      int targetHeight = 0}) async {
    throw UnimplementedError('compressImage() has not been implemented.');
  }

  Future<ImageProperties> getImageProperties(String fileName) async {
    throw UnimplementedError('getImageProperties() has not been implemented.');
  }

  Future<File> cropImage(
      String fileName, int originX, int originY, int width, int height) async {
    throw UnimplementedError('cropImage() has not been implemented.');
  }

  Future<File> rotateImage(String fileName, int angle) async {
    throw UnimplementedError('rotateImage() has not been implemented.');
  }
}
