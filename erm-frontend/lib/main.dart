import 'package:erm/Auth/login.dart';
import 'package:erm/Auth/splash_screen.dart';
import 'package:erm_logic/blocs/bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' show Client;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';
import 'app_blocs.dart';
import 'app_repositories.dart';

// Future<void> main() async {
//   setPathUrlStrategy();
//   var sharedPrefs = await SharedPreferences.getInstance();
//   runApp(
//     AppRepositories(
//       httpClient: Client(),
//       sharedPreferences: sharedPrefs,
//       child: AppBlocs(
//         prefs: sharedPrefs,
//          child: const SplashScreen(),
        
//       ),
//     ),
//   );
// }

Future<void> main() async {
  //setPathUrlStrategy();
  var sharedPrefs = await SharedPreferences.getInstance();
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:
      MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenticationBloc()..add(LoadAuthenticationEvent()),
          lazy: true,
        ),
       

      ],
      child: SplashScreen(),
    )
    );
  }
}