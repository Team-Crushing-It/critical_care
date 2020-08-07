import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:critical_care/splash_page.dart';
import 'package:critical_care/user_repository.dart';

import 'authentication_bloc.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';
import 'home_page.dart';
import 'loading_indicator.dart';
import 'login_page.dart';
import 'package:syncfusion_flutter_core/core.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}

void main() {
  SyncfusionLicense.registerLicense(
      "NT8mJyc2IWhia31hfWN9Z2doanxlfGFjYWNzYmlmYWljYXMDHmg+ODIwOyE8PGFqEzQ+Mjo/fTA8Pg==");

  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();
  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(userRepository: userRepository)
          ..add(AuthenticationStarted());
      },
      child: App(userRepository: userRepository),
    ),
  );
}

class App extends StatelessWidget {
  final UserRepository userRepository;

  App({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Open Sans",
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationInitial) {
            return SplashPage();
          }
          if (state is AuthenticationSuccess) {
            return HomePage();
          }
          if (state is AuthenticationFailure) {
            return LoginPage(userRepository: userRepository);
          }
          if (state is AuthenticationInProgress) {
            return LoadingIndicator();
          } else {
            return null;
          }
        },
      ),
    );
  }
}
