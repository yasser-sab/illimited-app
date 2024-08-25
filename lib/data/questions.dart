import 'package:flutter/material.dart';

List<Map<String, dynamic>> questions = [
  {
    "question": "what is your gender ?",
    "type": 0,
    "answers": [
      {"text": "Male", "icon": "assets/icon/man.png"},
      {"text": "Female", "icon": "assets/icon/woman.png"},
    ]
  },
  {
    "question": "What would you like to improve ?",
    "type": 0,
    "answers": [
      {"text": "Your Physical Well-being", "icon": "assets/icon/exercise.png"},
      {"text": "Your Mental well-being", "icon": "assets/icon/brain.png"},
      {"text": "Both", "icon": "assets/icon/both.png"},
    ]
  },
  {
    "question": "What age group do you fall into ?",
    "type": 0,
    "answers": [
      {
        "text": "12-17 years",
        "icon": "",
      },
      {
        "text": "18-25 years",
        "icon": "",
      },
      {
        "text": "25-34 years",
        "icon": "",
      },
      {
        "text": "35-45 years",
        "icon": "",
      },
      {
        "text": "45-55 years",
        "icon": "",
      },
      {
        "text": "55-65 years",
        "icon": "",
      },
      {
        "text": "65 + years",
        "icon": "",
      },
    ]
  },
  {
    "question": "Which country are you located in ?",
    "type": 1,
    "answers": [
      {
        "text": "Morocco",
        "icon": Icons.schedule,
      },
    ]
  },
];
