import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Screen/screens.dart';
import 'package:postgres/postgres.dart';

void main() {
  runApp(MyApp());
}

Future operation() async {
  var connection = PostgreSQLConnection(
      "ec2-31-242-24-212.compute-1.amazonaws.com", // hostURL
      5432, // port
      "djb7v0k318g55", // databaseName
      username: "ggfplrsgbytwdc",
      password: "b72bf90efb5e5f52b3c22a87f7ef5f76f80e663583",
      useSSL: true);

  await connection.open();
  print("Connected");
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Education',
      theme: ThemeData(
        textTheme:
            GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        'ForgotPassword': (context) => ForgotPassword(),
        'CreateNewAccount': (context) => CreateNewAccount(),
      },
    );
  }
}
