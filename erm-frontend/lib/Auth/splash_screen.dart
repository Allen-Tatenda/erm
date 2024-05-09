import 'package:erm/Auth/login.dart';
import 'package:erm/Pages/main_page.dart';
import 'package:erm/Pages/settings/widgets/set_password_screen.dart';
import 'package:erm_logic/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    
    AuthController().splashScreen(context, const Entrance(), const LoginPage(),const SetPasswordScreen());

  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 200,
        child: LoadingIndicator (
              indicatorType: Indicator.audioEqualizer, /// Required, The loading type of the widget
              colors: [Colors.blue,Colors.red,Colors.amber,Colors.green],       /// Optional, The color collections
              strokeWidth: 2,                     /// Optional, The stroke of the line, only applicable to widget which contains line
              backgroundColor: Colors.transparent,      /// Optional, Background of the widget
              pathBackgroundColor: Colors.black   /// Optional, the stroke backgroundColor
          ),
      ),
    );
  }
}