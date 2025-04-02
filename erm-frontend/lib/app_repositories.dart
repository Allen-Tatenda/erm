import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppRepositories extends StatelessWidget {
  final Widget child;
  final Client httpClient;
  final SharedPreferences sharedPreferences;
  const AppRepositories({
    Key? key,
    required this.child,
    required this.httpClient,
    required this.sharedPreferences,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        // RepositoryProvider<AuthenticationRepository>(
        //   create: (context) => AuthenticationRepositoryImpl(
        //     provider: AuthenticationProviderImpl(
        //       client: httpClient,
        //       sharedPreferences: sharedPreferences,
        //     ),
        //   ),
        //   lazy: false,
        // ),
      ],
      child: child,
    );
  }
}
