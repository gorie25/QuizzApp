// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Question {
  int id;
  String? title;
  String question;
  String answer;
  String? youtube_id_result;

  Question({
    required this.id,
    this.title = 'Saun khi thực hiện đoạn mã sẽ là gì ?',
    required this.question,
    required this.answer,
    this.youtube_id_result,
  });

  Question copyWith({
    int? id,
    String? title,
    String? question,
    String? answer,
    String? youtube_id_result,
  }) {
    return Question(
      id: id ?? this.id,
      title: title ?? this.title,
      question: question ?? this.question,
      answer: answer ?? this.answer,
      youtube_id_result: youtube_id_result ?? this.youtube_id_result,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'question': question,
      'answer': answer,
      'youtube_id_result': youtube_id_result,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'] as int,
      title: map['title'] != null ? map['title'] as String : null,
      question: map['question'] as String,
      answer: map['answer'] as String,
      youtube_id_result: map['youtube_id_result'] != null
          ? map['youtube_id_result'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Question(id: $id, title: $title, question: $question, answer: $answer, youtube_id_result: $youtube_id_result)';
  }

  @override
  bool operator ==(covariant Question other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.question == question &&
        other.answer == answer &&
        other.youtube_id_result == youtube_id_result;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        question.hashCode ^
        answer.hashCode ^
        youtube_id_result.hashCode;
  }
}
