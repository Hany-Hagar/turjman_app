import 'dart:io';

import 'image_states.dart';
import '../../data/repo/image_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageCubit extends Cubit<ImageStates> {
  final ImageRepo imageRepo;

  ImageCubit({required this.imageRepo}) : super(ImageInitial());

  Future<void> pickImage() async {
    emit(ImagePickingLoading());
    final result = await imageRepo.pickImageFromGallery();
    result.fold(
      (exception) => emit(ImageFailure(message: exception.toString())),
      (imageFile) {
        if (imageFile != null) {
          emit(ImagePickingSuccess(imagePath: imageFile.path));
        } else {
          emit(ImageFailure(message: 'No image selected.'));
        }
      },
    );
  }

  Future<void> processImage(File imageFile) async {
    emit(ImageProcessingLoading());
    final result = await imageRepo.processImage(imageFile);
    result.fold(
      (exception) => emit(ImageFailure(message: exception.toString())),
      (ocrResult) => emit(ImageProcessingSuccess(text: ocrResult)),
    );
  }
}
