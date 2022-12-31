import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
} // this widget gets rebuild

class _MyAppState extends State<MyApp> {
  // this stays persistent
  var _questionIndex = 0;
  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    }); // this basically tells dart when to change the state and helps in executing build widget again

    var aBool = true;
    if(_questionIndex<questions.length)
    {
        
    }
    print("Answer Chosen");
  }

  final questions =const [
    {
      'questionText': 'What is the full form of HTML?',
      'answers': ['ans1', 'ans2', 'ans3', 'ans4'],
    },
    {
      'questionText': 'Wich of the following languages is the oldest language?',
      'answers': ['ans1', 'ans2', 'ans3', 'ans4'],
    }
  ]; // this is a map which consists of a key value pair

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: Column(children: [
          Question(questions[_questionIndex]['questionText'].toString()),
          ...(questions[_questionIndex]['answers'] as List<String>).map((answer) { // we add that to let dart know that we are accessing a list of string because dart cannot do it automatically
            return Answer(_answerQuestion,answer);
          }).toList() // converts the whole thing to a new list
        ]),
      ),
    );
  }
}

