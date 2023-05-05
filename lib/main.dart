import 'package:flutter/material.dart';
import 'package:flutter_chat_gpt/constants/constants.dart';
import 'package:flutter_chat_gpt/providers/models_providers.dart';
import 'package:flutter_chat_gpt/screens/chat_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>ModelsProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: scaffoldBackgroundColor,
          appBarTheme: AppBarTheme(
            color: cardColor
          )
        ),
        home:const ChatScreen()
      ),
    );
  }
}

