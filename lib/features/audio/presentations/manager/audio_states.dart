sealed class AudioStates {}

class AudioInitial extends AudioStates {}

class AudioLoading extends AudioStates {}

class AudioFailure extends AudioStates {
  final String errorMessage;
  AudioFailure({required this.errorMessage});
}

class AudioSuccess extends AudioStates {
  final String recognizedText;
  AudioSuccess(this.recognizedText);
}

class StoppedListening extends AudioStates {}

class CancelledListening extends AudioStates {}