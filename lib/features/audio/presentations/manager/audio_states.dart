sealed class AudioStates {}

class AudioInitial extends AudioStates {}

/// Init
class InitializingAudioLoading extends AudioStates {}

class InitializingAudioSuccess extends AudioStates {}

class InitializingAudioFailure extends AudioStates {
  final String errorMessage;
  InitializingAudioFailure({required this.errorMessage});
}

/// Listening
class ListeningAudioLoading extends AudioStates {}

class ListeningAudio extends AudioStates {
  final String sourceText;
  final String translatedText;
  ListeningAudio({required this.sourceText, required this.translatedText});
}

class ListeningAudioFailure extends AudioStates {
  final String errorMessage;
  ListeningAudioFailure({required this.errorMessage});
}
