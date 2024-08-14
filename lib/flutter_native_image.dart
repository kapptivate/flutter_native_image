// You have generated a new plugin project without specifying the `--platforms`
// flag. A plugin project with no platform support was generated. To add a
// platform, run `flutter create -t plugin --platforms <platforms> .` under the
// same directory. You can also find a detailed instruction on how to add
// platforms in the `pubspec.yaml` at
// https://flutter.dev/to/pubspec-plugin-platforms.

import 'dart:io';

import 'flutter_native_image_platform_interface.dart';
import 'models.dart';

class FlutterNativeImage {
  Future<String?> getPlatformVersion() {
    return FlutterNativeImagePlatform.instance.getPlatformVersion();
  }

  /// Compress an image
  ///
  /// Compresses the given [fileName].
  /// [percentage] controls by how much the image should be resized. (0-100)
  /// [quality] controls how strong the compression should be. (0-100)
  /// Use [targetWidth] and [targetHeight] to resize the image for a specific
  /// target size.
  Future<File> compressImage(String fileName,
      {int percentage = 70,
      int quality = 70,
      int targetWidth = 0,
      int targetHeight = 0}) async {
    return await FlutterNativeImagePlatform.instance.compressImage(fileName,
        percentage: percentage,
        quality: quality,
        targetWidth: targetWidth,
        targetHeight: targetHeight);
  }

  /// Gets the properties of an image
  ///
  /// Gets the properties of an image given the [fileName].
  Future<ImageProperties> getImageProperties(String fileName) async {
    return await FlutterNativeImagePlatform.instance
        .getImageProperties(fileName);
  }

  /// Crops an image
  ///
  /// Crops the given [fileName].
  /// [originX] and [originY] control from where the image should be cropped.
  /// [width] and [height] control how the image is being cropped.
  Future<File> cropImage(
      String fileName, int originX, int originY, int width, int height) async {
    return await FlutterNativeImagePlatform.instance
        .cropImage(fileName, originX, originY, width, height);
  }

  /// Crops an image
  ///
  /// Crops the given [fileName].
  /// [angle] control how the image is being rotated.
  Future<File> rotateImage(String fileName, int angle) async {
    return await FlutterNativeImagePlatform.instance
        .rotateImage(fileName, angle);
  }
}
