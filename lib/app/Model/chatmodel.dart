// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:reasa/app/Model/user_model.dart';

class Message {
  User sender;
  String time;
  String text;
  bool isread;
  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.isread,
  });

  Message copyWith({
    User? sender,
    String? time,
    String? text,
    bool? isread,
  }) {
    return Message(
      sender: sender ?? this.sender,
      time: time ?? this.time,
      text: text ?? this.text,
      isread: isread ?? this.isread,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sender': sender.toMap(),
      'time': time,
      'text': text,
      'isread': isread,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      sender: User.fromMap(map['sender'] as Map<String, dynamic>),
      time: map['time'] as String,
      text: map['text'] as String,
      isread: map['isread'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Message(sender: $sender, time: $time, text: $text, isread: $isread)';
  }

  @override
  bool operator ==(covariant Message other) {
    if (identical(this, other)) return true;

    return other.sender == sender &&
        other.time == time &&
        other.text == text &&
        other.isread == isread;
  }

  @override
  int get hashCode {
    return sender.hashCode ^ time.hashCode ^ text.hashCode ^ isread.hashCode;
  }
}

List<Message> chatlist = [
  message1,
  message2,
  message3,
  message4,
  message5,
  message6,
  message7,
  message8,
  message9,
  currentusermesage
];
//angelina,rohan,alfonzo,anguestina,rodalfo,tanner,ordonez,dorrance,clinton

Message currentusermesage = Message(
    sender: currentuser,
    time: "16:00",
    text: "what do you do boy?",
    isread: false);

Message message1 = Message(
    sender: angelina,
    time: "16:00",
    text: "Of course, the apartment is ...",
    isread: false);
Message message2 = Message(
    sender: rohan,
    time: "14.45",
    text: "Okay...Do we have a deal?",
    isread: false);
Message message3 = Message(
    sender: alfonzo,
    time: "10.38",
    text: "It's nice working with you 😁",
    isread: true);
Message message4 = Message(
    sender: anguestina,
    time: "12/22/2022",
    text: "Will the contract be sent? 🤔",
    isread: false);
Message message5 = Message(
    sender: rodalfo,
    time: "12/21/2022",
    text: "just ideas for next time",
    isread: true);
Message message6 = Message(
    sender: tanner,
    time: "12/21/2022",
    text: "Haha that's terrifying 😂",
    isread: true);
Message message7 = Message(
    sender: ordonez,
    time: "12/21/2022",
    text: "I'll be there in 2 mins ⏱",
    isread: true);
Message message8 = Message(
    sender: dorrance,
    time: "12/21/2022",
    text: "Wow, this is really epic 🔥🔥",
    isread: true);
Message message9 = Message(
    sender: clinton,
    time: "12/21/2022",
    text: "Haha that's terrifying 😂",
    isread: true);
