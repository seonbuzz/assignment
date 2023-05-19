import 'package:flutter/material.dart';

//결과 페이지

// 하드코딩 말고 반복문을 이용해보자 ~!
class SurveyWidget extends StatelessWidget {
  final List<String> questions;
  final List<List<String>> answers;

  const SurveyWidget({
    required this.questions,
    required this.answers,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: questions.length,
      itemBuilder: (BuildContext context, int index) {
        final question = questions[index];
        final answerOptions = answers[index];

        return SurveyItemWidget(
          question: question,
          answerOptions: answerOptions,
          onNext: () {

          },
        );
      },
    );
  }
}

class SurveyItemWidget extends StatelessWidget {
  final String question;
  final List<String> answerOptions;
  final VoidCallback onNext;

  const SurveyItemWidget({
    required this.question,
    required this.answerOptions,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(question),
        SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: answerOptions.length,
          itemBuilder: (BuildContext context, int index) {
            final answer = answerOptions[index];

            return ElevatedButton(
              onPressed: () {
                onNext(); // 다음 질문으로 이동
              },
              child: Text(answer),
            );
          },
        ),
      ],
    );
  }
}

class SurveyPage extends StatefulWidget {
  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  List<String> questions = [];
  List<List<String>> answers = [];

  @override
  void initState() {
    super.initState();
    // 파이어베이스에서 데이터를 가져와서 questions와 answers 리스트를 채우기.
    fetchData();
  }

  void fetchData() {
    // 파이어베이스에서 데이터를 가져오는 비동기 작업 (인터넷에서 데이터 가져오기)
    // 데이터를 questions와 answers에 할당
    questions = ['Question 1', 'Question 2', 'Question 3'];
    answers = [
      ['Answer 1-1', 'Answer 1-2', 'Answer 1-3'],
      ['Answer 2-1', 'Answer 2-2'],
      ['Answer 3-1', 'Answer 3-2', 'Answer 3-3', 'Answer 3-4'],
    ];

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text('Sandy`s Demo ', style: TextStyle(color: Colors.amber),),
      ),
      body: questions.isEmpty
          ? /*null safety*/ Center(
        child: CircularProgressIndicator(),
      )
          : SurveyWidget(
        questions: questions,
        answers: answers,
      ),
    );
  }
}
