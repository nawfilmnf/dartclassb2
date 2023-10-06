import 'dart:io';
import 'dart:math';

class QuizApp {
  final Map<int, Map<String, dynamic>> questions = {
    1: {
      'question': 'What is the capital of France?',
      'options': ['Paris', 'London', 'Berlin'],
      'correctOption': 0,
    },
    2: {
      'question': 'Which planet is known as the Red Planet?',
      'options': ['Mars', 'Venus', 'Jupiter'],
      'correctOption': 0,
    },
    3: {
      'question' : 'Where do you live?',
      'options' : ['Karachi', 'Lahore' , 'Peshawar'],
      'correctoption' : 0,
    },
     4: {
      'question' : 'What are your hobbies?',
      'options' : ['Crciket', 'Football' , 'Tennis'],
      'correctoption' : 0,
       },
 5: {
      'question' : 'Do you know about programming?',
      'options' : ['No', 'Yes' , 'a little bit'],
      'correctoption' : 1,
 },
 6: {
      'question' : 'How many dots appear on a pair of dice? ?',
      'options' : ['8', '7' , '6'],
      'correctoption' : 3,
   },
  7: {
      'question' : 'Where do you live?',
      'options' : ['Karachi', 'Lahore' , 'Peshawar'],
      'correctoption' : 0,
   },

 8: {
      'question' : 'How many minutes are in a full week?',
      'options' : ['10,080', '9,1801' , '7,256'],
      'correctoption' : 0,
   },
  9: {
      'question' : 'According to population, which is the largest city in Pakistan?',
      'options' : ['Karachi', 'Lahore' , 'Peshawar'],
      'correctoption' : 0,
   },
    10: {
      'question' : 'How many languages are spoken in Pakistan?',
      'options' : ['32', '23' , '34'],
      'correctoption' : 0,
 },
11 : {
      'question' : 'What is the name of the highest peak of Pakistan?',
      'options' : ['Rakaposhi', 'Nanga parbat' , 'K-2'],
      'correctoption' : 3,
 },
 12: {
      'question' : 'Which is the national animal of Pakistan?',
      'options' : ['Goat', 'Markhor' , 'Sheep'],
      'correctoption' : 2,
 },
  13: {
      'question' : '	Magnetic disk is an example of?',
      'options' : ['Secondary memory', 'Primary memory' , 'Both'],
      'correctoption' : 0,
  },
   14: {
      'question' : 'The first computers were programmed using',
      'options' : ['Hybrid lang', 'Machine Lang' , 'None of these'],
      'correctoption' : 0,
 },
  15: {
      'question' : '	Which button makes alphabets/letters in uppercase and lowercase and numbers to symbols?',
      'options' : ['Enter', 'Ctrl' , 'Shift'] ,
      'correctoption' : 3,
 },
 
  };

  List<int> randList = [];

  QuizApp() {
    // Generate a list of unique random numbers
    while (randList.length < 20) {
      int randomNumber = Random().nextInt(questions.length) + 1;
      if (!randList.contains(randomNumber)) {
        randList.add(randomNumber);
      }
    }
  }

  void startQuiz() {
    int score = 0;
    int totalQuestions = randList.length;

    for (int i = 0; i < randList.length; i++) {
      int questionNumber = randList[i];
      Map<String, dynamic>? question = questions[questionNumber];

      print('Question ${i + 1}: ${question?['question']}');
      for (int j = 0; j < question?['options'].length; j++) {
        print('${j + 1}. ${question?['options'][j]}');
      }

      stdout.write('Enter your answer (1-${question?['options'].length}): ');
      int userAnswer = int.parse(stdin.readLineSync() ?? '0');

      if (userAnswer - 1 == question?['correctOption']) {
        score++;
      }
    }

    double percentage = (score / totalQuestions) * 100;
    print('Quiz completed!');
    print('Total number of correct answers: $score/$totalQuestions');
    print('Percentage of correct answers: ${percentage.toStringAsFixed(2)}%');

    if (percentage > 50) {
      print('Congratulations! You passed the quiz.');
    }
  }
}

void main() {
  QuizApp quizApp = QuizApp();

  while (true) {
    quizApp.startQuiz();

    stdout.write('Do you want to play again? (yes/no): ');
    String choice = stdin.readLineSync()?.toLowerCase() ?? '';
    if (choice != 'yes') {
      break;
    }
  }
}
