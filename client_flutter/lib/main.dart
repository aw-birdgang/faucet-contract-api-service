import 'package:client_flutter/screens/main/main_screen.dart';
import 'package:client_flutter/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'controllers/main_controller.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // print("load dotenv!!");
  // await dotenv.load(fileName: "assets/env/.env.dev");
  // String envFbProjectId = dotenv.get('FIREBASE_PROJECT_ID');
  // print("envFbProjectId :: " + envFbProjectId);
  // HttpConfigurationProvider provider = HttpConfigurationProvider();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => MainController(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme).apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
      },
    );
  }
}
