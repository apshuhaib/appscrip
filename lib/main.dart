import 'package:appscrip/application/theme/theme_bloc.dart';
import 'package:appscrip/application/user/user_bloc.dart';
import 'package:appscrip/domain/core/di/injectable.dart';
import 'package:appscrip/presentation/home/home_screen.dart';
import 'package:appscrip/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<UserBloc>(),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(),
        )
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Appscrip',
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: state.themeMode,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
