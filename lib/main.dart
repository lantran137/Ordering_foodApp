import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ordering_app/provider/my_provider.dart';
import 'package:ordering_app/screens/home_page.dart';
import 'package:ordering_app/screens/login_page.dart';
import 'package:ordering_app/screens/sign_up.dart';
import 'package:ordering_app/screens/welcome_page.dart';
import 'package:provider/provider.dart';
//import 'package:ordering_app/screens/welcome_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Order app',
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xff2b2b2b),
          appBarTheme: AppBarTheme(
            color: Color(0xff2b2b2b)
          )
        ),
        //home: LoginPage(),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (index, sncpshot){
            if(sncpshot.hasData){
              return HomePage();
            }
            return LoginPage();
        }),
      ),
    );
  }
}


