import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sipakar_apps/src/blocs/account_bloc/account_bloc.dart';
import 'package:sipakar_apps/src/blocs/auth_bloc/auth_bloc.dart';
import 'package:sipakar_apps/src/blocs/disease_bloc/disease_bloc.dart';
import 'package:sipakar_apps/src/blocs/identification_bloc/identification_bloc.dart';
import 'package:sipakar_apps/src/blocs/indication_bloc/indication_bloc.dart';
import 'package:sipakar_apps/src/onboarding_screen.dart';
import 'package:sipakar_apps/src/views/auth/login_screen.dart';

int initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  print('initScreen $initScreen');
  runApp(MyApp());
}

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DiseaseBloc>(
          create: (BuildContext context) => DiseaseBloc(),
        ),
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => AuthBloc(),
        ),
        BlocProvider<AccountBloc>(
          create: (BuildContext context) => AccountBloc(),
        ),
        BlocProvider<IndicationBloc>(
          create: (BuildContext context) => IndicationBloc(),
        ),
        BlocProvider<IdentificationBloc>(
          create: (BuildContext context) => IdentificationBloc(),
        ),
      ],
      child: MaterialApp(
        title: _title,
        debugShowCheckedModeBanner: false,
        initialRoute: initScreen == 0 || initScreen == null ? "first" : "/",
        routes: {
          '/': (context) => LoginPage(),
          "first": (context) => OnboardingScreen(),
        },
      ),
    );
  }
}
