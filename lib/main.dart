import 'package:flutter/material.dart';
import 'package:text_parsing_regex/rich_text.dart';
import 'package:text_parsing_regex/rich_text_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Parsing in Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Demo Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomRichText(
                richTextData: RegexRichText().textTransformation(
                  context: context,
                  text:
                      'I wanna tell you something <b>IMPORTANT</b> and <i>delicate</i> but <b><i><u> make it special</u></i></b>! Let\'s chat more…',
                ),
              ),
              const SizedBox(height: 20),
              CustomRichText(
                richTextData: RegexRichText().textTransformation(
                  context: context,
                  text:
                      'Some text <b>BOLD</b>, <i>italic</i> and <b><i>bold and italic</i></b> and <b><i><u> bold and italic and underline</b></i></u>  and <i><u><b> italic and underline and bold</i></u></b>',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
