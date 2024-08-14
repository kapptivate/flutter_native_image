enum ImageOrientation {
  normal,
  rotate90,
  rotate180,
  rotate270,
  flipHorizontal,
  flipVertical,
  transpose,
  transverse,
  undefined,
}

// For details, see: https://developer.android.com/reference/android/media/ExifInterface
ImageOrientation decodeExifOrientation(int? orientation) {
  final orientations = {
    1: ImageOrientation.normal,
    2: ImageOrientation.flipHorizontal,
    3: ImageOrientation.rotate180,
    4: ImageOrientation.flipVertical,
    5: ImageOrientation.transpose,
    6: ImageOrientation.rotate90,
    7: ImageOrientation.transverse,
    8: ImageOrientation.rotate270,
  };
  return orientations[orientation] ?? ImageOrientation.undefined;
}

/// Return value of [getImageProperties].
class ImageProperties {
  int? width;
  int? height;
  ImageOrientation orientation;

  ImageProperties(
      {this.width = 0,
      this.height = 0,
      this.orientation = ImageOrientation.undefined});
}
