import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_native_image_platform_interface.dart';
import 'models.dart';

/// An implementation of [FlutterNativeImagePlatform] that uses method channels.
class MethodChannelFlutterNativeImage extends FlutterNativeImagePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_native_image');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<File> compressImage(String fileName,
      {int percentage = 70,
      int quality = 70,
      int targetWidth = 0,
      int targetHeight = 0}) async {
    var file = await methodChannel.invokeMethod<String>("compressImage", {
      'file': fileName,
      'quality': quality,
      'percentage': percentage,
      'targetWidth': targetWidth,
      'targetHeight': targetHeight
    });

    if (file == null) {
      throw Exception('Failed to compress image');
    }

    return File(file);
  }

  @override
  Future<ImageProperties> getImageProperties(String fileName) async {
    var properties = Map.from(await (methodChannel
        .invokeMethod("getImageProperties", {'file': fileName})));
    return ImageProperties(
        width: properties["width"],
        height: properties["height"],
        orientation: decodeExifOrientation(properties["orientation"]));
  }

  @override
  Future<File> cropImage(
      String fileName, int originX, int originY, int width, int height) async {
    var file = await methodChannel.invokeMethod<String>("cropImage", {
      'file': fileName,
      'originX': originX,
      'originY': originY,
      'width': width,
      'height': height
    });
    if (file == null) {
      throw Exception('Failed to crop image');
    }

    return File(file);
  }

  @override
  Future<File> rotateImage(String fileName, int angle) async {
    var file = await methodChannel.invokeMethod<String>(
        "rotateImage", {'file': fileName, 'angle': angle});

    if (file == null) {
      throw Exception('Failed to rotate image');
    }

    return File(file);
  }
}
