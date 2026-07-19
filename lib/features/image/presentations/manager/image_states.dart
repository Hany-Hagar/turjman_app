
sealed class ImageStates {}

class ImageInitial extends ImageStates {}

class ImageFailure extends ImageStates {
  final String message;
  ImageFailure({required this.message});
}

// Picking image states
class ImagePickingLoading extends ImageStates {}

class ImagePickingSuccess extends ImageStates {
  final String imagePath;
  ImagePickingSuccess({required this.imagePath});
}

// Processing image states
class ImageProcessingLoading extends ImageStates {}

class ImageProcessingSuccess extends ImageStates {
  final ({String text, String translatedText}) result;
  ImageProcessingSuccess({required this.result});
}
