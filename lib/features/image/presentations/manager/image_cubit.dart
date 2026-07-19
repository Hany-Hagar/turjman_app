import 'dart:io';
import 'image_states.dart';
import 'package:flutter/material.dart';
import '../../data/repo/image_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/server_locator.dart';
import '../../../../core/enum/translation_type.dart';
import '../../../home/presentation/manager/home_cubit.dart';
import '../../../translations/data/models/translation_model.dart';
import '../../../../core/extension/translate_language_extension.dart';
import '../../../translations/presentation/manager/translations_cubit.dart';

class ImageCubit extends Cubit<ImageStates> {
  final ImageRepo imageRepo;
  ImageCubit({required this.imageRepo}) : super(ImageInitial());
  static ImageCubit get(BuildContext context) => BlocProvider.of(context);

  File? selectedImage;
  String? result;

  void init() {
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
          processImage(fromCamera: fromCamera, imageFile: imageFile);
        } else {
          emit(ImageFailure(message: 'No image selected.'));
        }
      },
    );
  }

  Future<void> processImage({
    required bool fromCamera,
    required File imageFile,
  }) async {
    emit(ImageProcessingLoading());
    var sourceLang = getIt<HomeCubit>().selectedSourceLanguage;
    var targetLang = getIt<HomeCubit>().selectedTargetLanguage;
    final result = await imageRepo.processImage(
      imageFile: imageFile,
      sourceLanguage: sourceLang.toTranslateLanguage,
      targetLanguage: targetLang.toTranslateLanguage,
    );
    result.fold(
      (exception) => emit(ImageFailure(message: exception.toString())),
      (ocrResult) {
        emit(ImageProcessingSuccess(result: ocrResult));
        getIt<TranslationsCubit>().addTranslation(
          translation: TranslationModel.newTranslation(
            source: sourceLang,
            target: targetLang,
            sourceText: ocrResult.text,
            translatedText: ocrResult.translatedText,
            translationType: fromCamera
                ? TranslationType.camera
                : TranslationType.image,
          ),
        );
      },
    );
  }
}
