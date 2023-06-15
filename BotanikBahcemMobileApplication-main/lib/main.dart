import 'package:botanik_bahcem/features/home/presentation/pages/home_page.dart';
import 'package:botanik_bahcem/features/splash/splash_screen.dart';
import 'package:botanik_bahcem/features/home/presentation/widgets/theme_modal.dart';
import 'package:botanik_bahcem/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/bitkisulama/data/repositories/service_locator.dart';
import 'features/login/presentation/pages/login_page.dart';

void main() async {
  setupGetIt();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModal(),
      child: Consumer(builder: (context, ThemeModal ThemeModal, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeModal.isDark ? ThemeData.dark() : ThemeData.light(),
          home: const MySplashScreen(),
        );
      }),
    );
  }
}
