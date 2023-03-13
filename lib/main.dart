import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:freelancing_fyp/views/buyer/tasks.dart';
import 'package:freelancing_fyp/views/order/ordersRecord.dart';
import 'package:freelancing_fyp/views/splash.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'services/authentication/firebase_auth_methods.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthMethods>(
          create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<FirebaseAuthMethods>().authState,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        title: 'Freelancing fyp',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          tabBarTheme: TabBarTheme( labelColor: Colors.black,),
        ),
        home: const Tasks(),
        //const SplashScreen(),
      ),
    );
  }
}



