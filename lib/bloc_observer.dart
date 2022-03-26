import 'package:flutter_bloc/flutter_bloc.dart';

/// Custom [BlocObserver] which observes all bloc and cubit instances.
class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    (event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    (transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    (error);
    super.onError(bloc, error, stackTrace);
  }
}