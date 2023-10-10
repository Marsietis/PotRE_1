import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Counter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Word counter'),
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
  final getTextController = TextEditingController();

  String charCount = '0';
  String wordCount = '0';
  

  void countChars() {
    setState(() {
      charCount = getTextController.text.length.toString();
    });
  }
  
  void countWords(){
    setState(() {
      String text = getTextController.text.toString();

      final RegExp regExp = RegExp(r"[\w-._]+");
      final Iterable matches = regExp.allMatches(text);
      wordCount = matches.length.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text('Enter text to count words:'),
              TextField(
                onChanged: (text) {
                  countChars();
                  countWords();
                },
                maxLines: 6,
                controller: getTextController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter text to count',
                ),
              ),
              Text(
                'Words: $wordCount',
              ),
              Text(
                'Characters: $charCount',
              )
            ],
          ),
        ),
      ),
    );
  }
}
