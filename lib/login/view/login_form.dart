import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';

import '../../sign_up/sign_up.dart';
import '../login.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/critical_logo.png',
              width: 600,
            ),
            const Padding(padding: EdgeInsets.all(16.0)),
            _EmailInput(),
            const Padding(padding: EdgeInsets.all(4.0)),
            _PasswordInput(),
            const Padding(padding: EdgeInsets.all(4.0)),
            _LoginButton(),
            const Padding(padding: EdgeInsets.all(4.0)),
            _GoogleLoginButton(),
            const Padding(padding: EdgeInsets.all(4.0)),
            _SignUpButton(),
          ],
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          style: const TextStyle(color: Colors.white, fontSize: 20),
          key: const Key('loginForm_emailInput_textField'),
          onChanged: (email) => context.bloc<LoginCubit>().emailChanged(email),
          decoration: InputDecoration(
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              labelText: 'Email',
              errorText: state.email.invalid ? 'invalid email' : null,
              labelStyle: const TextStyle(color: Colors.white, fontSize: 20)),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          style: const TextStyle(color: Colors.white, fontSize: 20),
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.bloc<LoginCubit>().passwordChanged(password),
          obscureText: true,
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            labelText: 'Password',
            errorText: state.password.invalid ? 'invalid password' : null,
            labelStyle: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : RaisedButton(
                key: const Key('loginForm_continue_raisedButton'),
                child:
                    const Text('LOGIN', style: TextStyle(color: Colors.white)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: Colors.blue,
                onPressed: state.status.isValidated
                    ? () => context.bloc<LoginCubit>().logInWithCredentials()
                    : null,
              );
      },
    );
  }
}

class _GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return RaisedButton.icon(
      key: const Key('loginForm_googleLogin_raisedButton'),
      label: const Text(
        'SIGN IN WITH GOOGLE',
        style: TextStyle(color: Colors.black),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      icon: const Icon(FontAwesomeIcons.google, color: Colors.white),
      color: Colors.white,
      onPressed: () => context.bloc<LoginCubit>().logInWithGoogle(),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FlatButton(
      key: const Key('loginForm_createAccount_flatButton'),
      child: Text(
        'CREATE ACCOUNT',
        style: TextStyle(color: theme.primaryColor),
      ),
      color: Colors.red,
      onPressed: () => Navigator.of(context).push<void>(SignUpPage.route()),
    );
  }
}
