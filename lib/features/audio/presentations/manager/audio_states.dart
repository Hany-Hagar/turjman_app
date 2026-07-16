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

class ListeningAudioSuccess extends AudioStates {
  final String recognizedText;
  ListeningAudioSuccess(this.recognizedText);
}

class ListeningAudioFailure extends AudioStates {
  final String errorMessage;
  ListeningAudioFailure({required this.errorMessage});
}