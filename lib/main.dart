import 'package:reto_lugares/screen/lugar_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reto_lugares/screen/home_screen.dart';
import 'package:reto_lugares/service/lugar_service.dart';

void main() {
  runApp(const ProviderStateWidget());
}

class ProviderStateWidget extends StatelessWidget {
  const ProviderStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LugaresService(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'home_page',
      routes: {
        'home_page': (_) => const HomePage(),
        'lugar_page': (_) => const LugarPage(),
      },
    );
  }
}
