import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_remake/changeNotifiyer/cartNotifier.dart';
import 'package:flutter_form_remake/changeNotifiyer/formNotifier.dart';
import 'package:flutter_form_remake/pageView/registerAndSignInGlobalPageView.dart';
import 'package:flutter_form_remake/pageView/signIn_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FormNotifier()),
        ChangeNotifierProvider(create: (_) => CartNotifier())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Form Remake',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: Scaffold(
            body: RegisterAndSignInGlobalPageView(),
          )),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: RegisterAndSignInGlobalPageView());
//   }
// }
