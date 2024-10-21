import 'package:flutter/material.dart';

Map<String, List<Map<String, dynamic>>> questions = {
  "en": [
    {
      "question": "What is your gender?",
      "type": 0,
      "answers": [
        {"text": "Male", "icon": "assets/icon/man.png"},
        {"text": "Female", "icon": "assets/icon/woman.png"},
      ]
    },
    {
      "question": "What would you like to improve?",
      "type": 0,
      "answers": [
        {"text": "Your Physical Well-being", "icon": "assets/icon/exercise.png"},
        {"text": "Your Mental Well-being", "icon": "assets/icon/brain.png"},
        {"text": "Both", "icon": "assets/icon/both.png"},
      ]
    },
    {
      "question": "What age group do you fall into?",
      "type": 0,
      "answers": [
        {"text": "12-17 years", "icon": ""},
        {"text": "18-25 years", "icon": ""},
        {"text": "25-34 years", "icon": ""},
        {"text": "35-45 years", "icon": ""},
        {"text": "45-55 years", "icon": ""},
        {"text": "55-65 years", "icon": ""},
        {"text": "65 + years", "icon": ""},
      ]
    },
    {
      "question": "Which country are you located in?",
      "type": 1,
      "answers": [
        {"text": "Morocco", "icon": Icons.schedule},
      ]
    },
  ],
  "fr": [
    {
      "question": "Quel est votre sexe ?",
      "type": 0,
      "answers": [
        {"text": "Homme", "icon": "assets/icon/man.png"},
        {"text": "Femme", "icon": "assets/icon/woman.png"},
      ]
    },
    {
      "question": "Que souhaitez-vous améliorer ?",
      "type": 0,
      "answers": [
        {"text": "Votre bien-être physique", "icon": "assets/icon/exercise.png"},
        {"text": "Votre bien-être mental", "icon": "assets/icon/brain.png"},
        {"text": "Les deux", "icon": "assets/icon/both.png"},
      ]
    },
    {
      "question": "Dans quelle tranche d'âge vous situez-vous ?",
      "type": 0,
      "answers": [
        {"text": "12-17 ans", "icon": ""},
        {"text": "18-25 ans", "icon": ""},
        {"text": "25-34 ans", "icon": ""},
        {"text": "35-45 ans", "icon": ""},
        {"text": "45-55 ans", "icon": ""},
        {"text": "55-65 ans", "icon": ""},
        {"text": "65 ans et plus", "icon": ""},
      ]
    },
    {
      "question": "Dans quel pays êtes-vous situé ?",
      "type": 1,
      "answers": [
        {"text": "Maroc", "icon": Icons.schedule},
      ]
    },
  ],
  "es": [
    {
      "question": "¿Cuál es tu género?",
      "type": 0,
      "answers": [
        {"text": "Masculino", "icon": "assets/icon/man.png"},
        {"text": "Femenino", "icon": "assets/icon/woman.png"},
      ]
    },
    {
      "question": "¿Qué te gustaría mejorar?",
      "type": 0,
      "answers": [
        {"text": "Tu bienestar físico", "icon": "assets/icon/exercise.png"},
        {"text": "Tu bienestar mental", "icon": "assets/icon/brain.png"},
        {"text": "Ambos", "icon": "assets/icon/both.png"},
      ]
    },
    {
      "question": "¿En qué grupo de edad te encuentras?",
      "type": 0,
      "answers": [
        {"text": "12-17 años", "icon": ""},
        {"text": "18-25 años", "icon": ""},
        {"text": "25-34 años", "icon": ""},
        {"text": "35-45 años", "icon": ""},
        {"text": "45-55 años", "icon": ""},
        {"text": "55-65 años", "icon": ""},
        {"text": "65 + años", "icon": ""},
      ]
    },
    {
      "question": "¿En qué país estás ubicado?",
      "type": 1,
      "answers": [
        {"text": "Marruecos", "icon": Icons.schedule},
      ]
    },
  ],
  "ar": [
    {
      "question": "ما هو جنسك ؟",
      "type": 0,
      "answers": [
        {"text": "ذكر", "icon": "assets/icon/man.png"},
        {"text": "أنثى", "icon": "assets/icon/woman.png"},
      ]
    },
    {
      "question": "ماذا تريد أن تحسن؟",
      "type": 0,
      "answers": [
        {"text": "رفاهيتك البدنية", "icon": "assets/icon/exercise.png"},
        {"text": "رفاهيتك العقلية", "icon": "assets/icon/brain.png"},
        {"text": "كليهما", "icon": "assets/icon/both.png"},
      ]
    },
    {
      "question": "ما هي الفئة العمرية التي تنتمي إليها؟",
      "type": 0,
      "answers": [
        {"text": "12-17 سنة", "icon": ""},
        {"text": "18-25 سنة", "icon": ""},
        {"text": "25-34 سنة", "icon": ""},
        {"text": "35-45 سنة", "icon": ""},
        {"text": "45-55 سنة", "icon": ""},
        {"text": "55-65 سنة", "icon": ""},
        {"text": "65 سنة فما فوق", "icon": ""},
      ]
    },
    {
      "question": "في أي بلد أنت موجود؟",
      "type": 1,
      "answers": [
        {"text": "المغرب", "icon": Icons.schedule},
      ]
    },
  ]
};

