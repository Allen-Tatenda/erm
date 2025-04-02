import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AppBlocs extends StatelessWidget {
  final Widget child;
  final SharedPreferences prefs;

  const AppBlocs({
    Key? key,
    required this.child,
    required this.prefs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create: (context) => AuthenticationBloc()..add(AuthenticateEvent()),
        //   lazy: false,
        // ),
       

      ],
      child: child,
    );
  }
}
