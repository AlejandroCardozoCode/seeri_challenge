import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:seeri/bloc/movies/movies_bloc.dart';
import 'package:seeri/theme/theme.dart';
import 'package:seeri/views/favorites_screen.dart';
import 'package:seeri/views/home_screen.dart';
import 'package:seeri/views/screens_gestor.dart';
import 'package:seeri/views/search_screen.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MoviesBloc(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: "screens",
      theme: ThemeApp.light,
      routes: {
        "screens": (context) => const ScreensGestor(),
        "home": (context) => const HomeScreen(),
        "search": (context) => const SearchScreen(),
        "favorites": (context) => const FavoritesScreen(),
      },
    );
  }
}
