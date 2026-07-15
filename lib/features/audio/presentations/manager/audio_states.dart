sealed class AudioStates {}

class AudioInitialState extends AudioStates {}

class AudioLoading extends AudioStates {}

class AudioListening extends AudioStates {}

class AudioStopped extends AudioStates {}

class AudioFailure extends AudioStates {
  final String message;

  AudioFailure({required this.message});
}
