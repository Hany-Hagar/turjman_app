
import 'dart:io';
import 'image_states.dart';
import 'package:flutter/material.dart';
import '../../data/repo/image_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/image_service.dart';

class ImageCubit extends Cubit<ImageStates> {
  final ImageRepo imageRepo;
  ImageCubit({required this.imageRepo}) : super(ImageInitial());
  static ImageCubit get(BuildContext context) => BlocProvider.of(context);

  File? selectedImage;
  OcrResult? result;
  
  void init(){
    selectedImage = null;
    result = null;
    emit(ImageInitial());
  }

  Future<void> pickImage({required bool fromCamera}) async {
    emit(ImagePickingLoading());
    final result = await imageRepo.pickImage(fromCamera: fromCamera);
    result.fold(
      (exception) => emit(ImageFailure(message: exception.toString())),
      (imageFile) {
        if (imageFile != null) {
          selectedImage = imageFile;
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
      (ocrResult) => emit(ImageProcessingSuccess(result: ocrResult)),
    );
  }
}
