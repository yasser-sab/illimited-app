import 'package:illimited_app/utils/utils.dart';


Map<String, Map<String, dynamic>> tasksOf = {
  "week1": {
    "day1": {
      "tasks": {
        "task1": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        },
        "task2": {
          "type": Tasks.questions,
          "title": "Journal de board",
          "description": "Describe your feelings",
          "introText":
              "Bienvenue dans ton journal de bord ! pour les semaines suivantes tu vas celui ci t'accompagnera et soutiendras lors de ton changement :) N'hésitez pas à me consulter souvent et à te rappeler tes objectifs et rester motivée ! ",
          "questions": {
            "1":
                "Nomme 5 objectifs pour l'amélioration de ton mental et 5 objectifs d'amélioration physique ?",
            "2": "Pourquoi souhaites-tu améliorer ces points ?"
          },
        },
        "task3": {
          "type": Tasks.quote,
          "title": "Quote of the day!",
          "description": "We are going to do this together :)",
          "text":
              "LE PASSÉ EST UNE LEÇON, LE PRÉSENT EST UN CADEAU, ET L’AVENIR EST TA MOTIVATION "
        },
        "task4": {
          "type": Tasks.video,
          "title": "Video motivation",
          "videoUrl":
              "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FCle%CC%811.semaine1.jour1.Jeanmp4.mp4?alt=media&token=d3dfac10-95ef-4a95-ace5-e9256d12f337",
          "description": "N’AYEZ PAS PEUR DU CHANGEMENT ! ",
        },
      },
    },
    "day2": {
      "tasks": {
        "task1": {
          "type": Tasks.video,
          "title": "Video motivation",
          "videoUrl":
              "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FDefi1Controletesalimsem1jour2.mp4?alt=media&token=0e8d856b-37e1-40e8-ad8c-09300c9c93bb",
          "description": "Nous sommes ce que nous mangeons!",
        },
        "task2": {
          "type": Tasks.questions,
          "title": "Journal de bord",
          "description":
              "CONTROLE TES ALIMENTS , histoire de jean CONSIGNE DÉFI “ CONTRÔLER SES ALIMENTS”",
          "introText":
              "Choisissez un aliments que vous souhaitez mieux contrôler , cette semaine nous vous proposons de mieux contrôler : CHOCOLAT ",
          "questions": {
            "1":
                "A quelle fréquence et quantité en avez-vous mangé dans la journée ?",
            "2": "dans quelles circonstances ?"
          },
        },
        "task3": {
          "type": Tasks.quote,
          "title": "Quote of the day!",
          "description": "We are going to do this together :)",
          "text": "RESPECTE TOI, TU MERITES LE MEILLEUR"
        },
        "task4": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        },
      },
    },
    "day3": {
      "tasks": {
        "task1": {
          "type": Tasks.video,
          "title": "Video motivation",
          "videoUrl":
              "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2Fsem1jour3deficulinaire2.mp4?alt=media&token=89d7b71a-0932-4727-bbd9-3c774a17f037",
          "description": "Nous sommes ce que nous mangeons!",
        },
        "task2": {
          "type": Tasks.questions,
          "title": "Défi Communauté Gourmande",
          "description":
              "Cuisinez une recette proposée en découvrant les ingrédients près de chez vous !",
          "introText":
              "Préparez-vous à cuisiner une recette que nous avons spécialement sélectionnée pour vous. Une vraie recette saine et réconfortante, qui pourrait aller du bœuf bourguignon à un sauté de crevettes, en passant par des pâtes carbonara. Nous avons choisi une recette que vous allez adorer apprendre à maîtriser. Une fois la recette reçue, partez à la recherche des ingrédients nécessaires au sein de votre communauté, c'est-à-dire dans un rayon de 5 à 15 km autour de chez vous. Enfilez votre plus belle paire de chaussures de sport ou prenez votre vélo pour explorer votre quartier à travers ce défi. Expliquez aux commerçants que vous rencontrez l objectif de votre démarche. Cet exercice vous permettra de créer un véritable lien avec votre communauté, de renforcer votre sentiment d'appartenance, et de découvrir des forces insoupçonnées en vous, contribuant à votre épanouissement personnel. Cette semaine, nous vous proposons de réaliser un délicieux Bœuf Bourguignon !",
          "questions": {
            "1": "quand et comment allez- vous préparer cet événement ?",
            "2":
                "qui avez-vous rencontré ? (marchand, épicier, connaissance …)",
            "3":
                "qu ‘avez vous ressenti en cuisinant le plat, en voyant le résultat ? "
          },
        },
        "task3": {
          "type": Tasks.questions,
          "title": "EVOLUTION PHYSIQUE",
          "description":
              "N'oubliez pas de remplir votre défi évolution physique cette semaine !",
          "introText": "Bienvenue dans votre défi physique :)",
          "questions": {
            "1": {
              "q": "Quel repas avez-vous choisi cette semaine ?",
              "a": ['Matin', 'Midi', 'Soir']
            }, //these are the choices that the user should choose from : 1-Matin 2-Midi 3-Soir 4-Collation
            "2": {
              "q":
                  "De combien de portions avez-vous réduit votre consommation ?",
              "a": ['½', '⅓', '¼']
            }, //these are the choices that the user should choose from : 1-½ 2-⅓ 3-¼
            "3": {
              "q": "Avez-vous remplacé les jus par de l'eau ou du thé ? ",
              "a": ['Oui', 'Non']
            }, //these are the choices that the user should choose from : 1-Oui 2-Non
            "4": {
              "q":
                  "Avez-vous trouvé d'autres activités à faire lorsque vous aviez envie de grignoter ?",
              "a": ['Oui', 'Non']
            }, //these are the choices that the user should choose from :  1-Oui 2-Non
            "5":
                "Quelles activités avez-vous choisies pour éviter le grignotage ?",
            "6":
                "Comment vous sentez-vous par rapport à cette semaine de défi ?"
          },
        },
        "task4": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        },
      },
    },
    "day4": {
      "tasks": {
        "task1": {
          "type": Tasks.quote,
          "title": "Quote of the day!",
          "description": "We are going to do this together :)",
          "text":
              "Lorsque nous comprenons qui nous sommes , notre vie a un sens"
        },
        "task2": {
          "type": Tasks.video,
          "title": "Video motivation",
          "videoUrl":
              "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FDefi3EvolutionPhisiq-sem1jour4.mp4?alt=media&token=7e120cbe-12ec-4e4b-843e-e5c7f308aac3",
          "description": "N’AYEZ PAS PEUR DU CHANGEMENT ! ",
        },
        "task3": {
          "type": Tasks.questions,
          "title": "Your Feelings!",
          "description": "Describe your feeling",
          "introText": "",
          "questions": {"1": "How are you ?"},
        },
        "task4": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        }
      },
    },
    "day5": {
      "tasks": {
        "task1": {
          "type": Tasks.quote,
          "title": "Quote of the day!",
          "description": "We are going to do this together :)",
          "text":
              "PRENDS L’HABITUDE DE TROUVER AU MOINS UNE CHOSES POSITIVE QUI T EST ARRIVÉE DANS LA JOURNÉE "
        },
        "task2": {
          "type": Tasks.questions,
          "title": "Journal de board",
          "description": "Describe your feeling",
          "introText":
              "Bienvenue dans votre journal de bord du jour, faisons-le ensemble :)",
          "questions": {
            "1": "Comment te sens tu aujourd' hui ? ",
            "2": "Ou est tu rendu dans tes défis ?  "
          },
        },
        "task3": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        }
      },
    },
    "day6": {
      "tasks": {
        "task1": {
          "type": Tasks.quote,
          "title": "Quote of the day!",
          "description": "We are going to do this together :)",
          "text":
              "C’EST NORMAL DE FAIRE DES ERREURS, TANT QUE JE CONTINUE DE DONNER LE MEILLEUR DE MOI-MÊME."
        },
        "task2": {
          "type": Tasks.questions,
          "title": "Journal de board",
          "description": "Describe your feeling",
          "introText":
              "Bienvenue dans votre journal de bord du jour, faisons-le ensemble :)",
          "questions": {"1": "COMMENT SE PASSE TES OBJECTIFS ? "},
        },
        "task3": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        }
      },
    },
    "day7": {
      "tasks": {
        "task1": {
          "type": Tasks.generatedVideo,
          "title": "Vidéo BestOf de la semaine",
          "description":
              "Profitez des meilleurs moments de cette semaine, en espérant que ça vous plaise !",
        },
      },
    },
  },
  "week2": {
    "day1": {
      "tasks": {
        "task1": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        },
        "task2": {
          "type": Tasks.questions,
          "title": "Journal de board",
          "description": "Describe your feelings",
          "introText":
              "Bienvenue dans votre journal de bord du jour, faisons-le ensemble :)",
          "questions": {"1": "Comment te sens- tu en ce début de semaine ?"},
        },
        "task3": {
          "type": Tasks.video,
          "title": "Video motivation",
          "videoUrl":
              "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FCle%CC%812.semaine2.jou1.Suzanne.mp4?alt=media&token=185fff2c-bb5e-46a4-b607-7b27650cf00e",
          "description": "CLE BIEN-ÊTRE 2 : CHANGEZ VOTRE REGARD",
        }
      },
    },
    "day2": {
      "tasks": {
        "task1": {
          "type": Tasks.questions,
          "title": "Your Feelings!",
          "description": "Describe your feeling",
          "introText":
              "Bienvenue dans votre journal de bord du jour, repenser à 3 situations et répondez aux questions suivantes qui amènera à poser un autre regard sur les événement que vous vivez ou avez vécu :",
          "questions": {
            "1": "À quel moment et pourquoi vous êtes-vous senti énervé ?",
            "2": "Où étiez-vous et qui était avec vous à ce moment-là ?",
            "3":
                "Qu'est-ce qui s'est passé exactement pour déclencher cette émotion ?",
            "4":
                "Quelles pensées vous traversaient l'esprit pendant cet événement ?",
            "5": "Comment la situation s'est-elle terminée ?",
            "6": "Comment vous sentiez-vous émotionnellement après coup ?",
            "7":
                "Avec du recul, comment auriez-vous pu mieux gérer la situation ?",
            "8": "Qu'auriez-vous pu faire ou penser différemment ?",
            "9": "Quel aspect positif pouvez-vous tirer de cette expérience ?",
            "10":
                "Quelles seraient les conséquences positives d'une autre manière de réagir ou d'agir ?",
            "11": "Quels enseignements pouvez-vous en tirer ?"
          },
        },
        "task2": {
          "type": Tasks.quote,
          "title": "Quote of the day!",
          "description": "We are going to do this together :)",
          "text":
              "Si cette vie t’a eté donnée, c’est que tu as la force requise pour bien la vivre."
        },
        "task3": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        }
      },
    },
    //day3 week2 to come back later because i confused this one
    "day3": {
      "tasks": {
        "task1": {
          "type": Tasks.questions,
          "title": "Journal de board",
          "description": "Describe your feelings",
          "introText":
              "Cependant, et pour être fidèle à notre accompagnement, pendant 21 jours vous allez devoir maintenir cette saine habitude (non pas d'aller au coiffeur tous les matins) mais de prendre le temps de vous faire sentir bien par une nouvelle habitude corporelle et/ou esthétique. Exemple: si vous prenez un soin esthétique, par exemple une épilation: l'idée du défi 21 jours, est de prendre soin tous les jours en mettant de la crème sur votre partie épilée, cela aussi peut être une nouvelle habitude. *Les personnes obèses ou en surpoids ont tendance à garder les cheveux courts ou attachés, je vous mets en lien quelques modèles de coupe de rallonges qui vont très bien aux rondes et qui font sentir femmes ;)",
          "questions": {
            "1":
                "Quel est l'objectif de maintenir une nouvelle habitude de soin personnel pendant 21 jours ?",
            "2":
                "Comment les soins esthétiques ou corporels quotidiens peuvent-ils contribuer au bien-être à long terme ?",
            "3":
                "Quelles sont quelques suggestions de coiffure pour les personnes cherchant à améliorer leur apparence et à se sentir plus féminines ?"
          },
        },
        "task2": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        }
      },
    },
    "day4": {
      "tasks": {
        "task1": {
          "type": Tasks.quote,
          "title": "Quote of the day!",
          "description": "We are going to do this together :)",
          "text":
              "Guérir ne veut pas dire nier ses blessures, mais bien leur enlever tout contrôle sur soi."
        },
        "task2": {
          "type": Tasks.questions,
          "title": "Journal de bord",
          "description":
              "CONTROLE TES ALIMENTS , histoire de jean CONSIGNE DÉFI “ CONTRÔLER SES ALIMENTS”",
          "introText":
              "Choisissez un aliments que vous souhaitez mieux contrôler , cette semaine nous vous proposons de mieux contrôler : BISCUITS  ",
          "questions": {
            "1":
                "À quelle fréquence et en quelle quantité en avez-vous mangé dans la journée ?",
            "2": "Dans quelles circonstances ?"
          },
        },
        "task3": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        }
      },
    },
    "day5": {
      "tasks": {
        "task1": {
          "type": Tasks.quote,
          "title": "Quote of the day!",
          "description": "We are going to do this together :)",
          "text": "Sois humble dans la victoire, et brave devant la peur."
        },
        "task2": {
          "type": Tasks.questions,
          "title": "EVOLUTION PHYSIQUE",
          "description":
              "N'oubliez pas de remplir votre défi évolution physique cette semaine !",
          "introText": "Bienvenue dans votre défi physique :)",
          "questions": {
            "1": "Comment te sens-tu aujourd'hui ?",
            "2": "Où en es-tu dans tes défis ?",
            "3": {
              "q": "Quel repas avez-vous choisi cette semaine ?",
              "a": ['Matin', 'Midi', 'Soir']
            }, //these are the choices that the user should choose from : 1-Matin 2-Midi 3-Soir 4-Collation
            "4": {
              "q":
                  "De combien de portions avez-vous réduit votre consommation ?",
              "a": ['½', '⅓', '¼']
            }, //these are the choices that the user should choose from : 1-½ 2-⅓ 3-¼
            "5": {
              "q": "Avez-vous remplacé les jus par de l'eau ou du thé ? ",
              "a": ['Oui', 'Non']
            }, //these are the choices that the user should choose from : 1-Oui 2-Non
            "6": {
              "q":
                  "Avez-vous trouvé d'autres activités à faire lorsque vous aviez envie de grignoter ?",
              "a": ['Oui', 'Non']
            },
            "7":
                "Quelles activités avez-vous choisies pour éviter le grignotage ?",
            "8":
                "Comment vous sentez-vous par rapport à cette semaine de défi ?"
          },
        },
        "task3": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        }
      },
    },
    "day6": {
      "tasks": {
        "task1": {
          "type": Tasks.questions,
          "title": "Défi Communauté Gourmande",
          "description":
              "Cuisinez une recette proposée en découvrant les ingrédients près de chez vous !",
          "introText":
              "Préparez-vous à cuisiner une recette que nous avons spécialement sélectionnée pour vous. Une vraie recette saine et réconfortante, qui pourrait aller du bœuf bourguignon à un sauté de crevettes, en passant par des pâtes carbonara. Nous avons choisi une recette que vous allez adorer apprendre à maîtriser. Une fois la recette reçue, partez à la recherche des ingrédients nécessaires au sein de votre communauté, c'est-à-dire dans un rayon de 5 à 15 km autour de chez vous. Enfilez votre plus belle paire de chaussures de sport ou prenez votre vélo pour explorer votre quartier à travers ce défi. Expliquez aux commerçants que vous rencontrez l objectif de votre démarche. Cet exercice vous permettra de créer un véritable lien avec votre communauté, de renforcer votre sentiment d'appartenance, et de découvrir des forces insoupçonnées en vous, contribuant à votre épanouissement personnel. Cette semaine, nous vous proposons de réaliser un délicieux Pates a la carbonara !",
          "questions": {
            "1": "Quand et comment allez-vous préparer cet événement ?",
            "2": "Qui avez-vous rencontré ? (marchand, épicier, connaissance…)",
            "3":
                "Qu’avez-vous ressenti en cuisinant le plat, en voyant le résultat ?"
          },
        },
        "task2": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        }
      },
    },
    "day7": {
      "tasks": {
        "task1": {
          "type": Tasks.generatedVideo,
          "title": "Vidéo BestOf de la semaine",
          "description":
              "Profitez des meilleurs moments de cette semaine, en espérant que ça vous plaise !",
        },
      },
    },
  },
  "week3": {
    "day1": {
      "tasks": {
        "task1": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        },
        "task2": {
          "type": Tasks.video,
          "title": "Video motivation",
          "videoUrl":
              "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2Fcle3%2Csemaine3%2Cjour1%20Sophie.mp4?alt=media&token=9dae5aeb-9e9e-4863-b933-4d644715c131",
          "description":
              "CLÉ BIEN-ÊTRE 3 : VIVEZ L’INSTANT PRÉSENT : Et si vous décidiez de vivre davantage le moment présent ? ",
        },
      },
    },
    "day2": {
      "tasks": {
        "task1": {
          "type": Tasks.quote,
          "title": "Quote of the day!",
          "description": "We are going to do this together :)",
          "text":
              "Nous nous plaignons souvent de ce que nous ne possédons pas, sans réaliser de la richesse et la chance de tout ce que nous possedons deja."
        },
        "task2": {
          "type": Tasks.video,
          "title": "Video motivation",
          "videoUrl":
              "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2Fsemaine3jour2defi4prendreconscience.mp4?alt=media&token=5d7dcd5b-b019-4a42-b71f-420262e6229f",
          "description": "N’AYEZ PAS PEUR DU CHANGEMENT ! ",
        },
        "task3": {
          "type": Tasks.questions,
          "title": "Journal de board",
          "description": "Describe your feelings",
          "introText":
              "Bienvenue dans votre journal de bord du jour, PRENDRE CONSCIENCE DE NOTRE CHANCE LE defi émotionnel de cette semaine est ainsi fait pour vous faire conscientiser à cet adage  : il est réalisé 3 fois par semaine . Vous devez sélectionner 3 événements qui vous ont fait du bien durant la journée :) cela peut être un événement vécu ou événement dont vous avez été témoin et qui vous as fait du bien :) ",
          "questions": {
            "1": "Quel est l'événement ?",
            "2": "Où cela s’est-il passé ?",
            "3": "Comment cela vous a-t-il fait sentir ?"
          },
        },
        "task4": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        }
      },
    },
    "day3": {
      "tasks": {
        "task1": {
          "type": Tasks.quote,
          "title": "Defi Physique",
          "description": "PROFiTEZ DU SOLEIL !",
          "text":
              "PROFiTEZ DU SOLEIL !  Trouvez un endroit dans votre rayon d'habitation à l'extérieur ou vous pouvez vous étendre. Installez-vous confortablement, et  prenez un minimum de 15 minutes de soleil par jour, cela vous permettra de vous sentir bien. Les effets sont saisissants : le soleil a généralement mauvaise presse. Mais profiter d’une belle journée ensoleillée est bon pour le moral … et pour votre provision de vitamine D!"
        },
        "task2": {
          "type": Tasks.questions,
          "title": "Journal de board",
          "description": "Describe your feelings",
          "introText":
              "Bienvenue dans votre journal de bord du jour, faisons-le ensemble :)",
          "questions": {
            "1": "Quand êtes-vous sorti ?",
            "2": "Combien de temps êtes-vous resté dehors ?",
            "3": "Comment vous êtes-vous senti ?"
          },
        },
        "task4": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        }
      },
    },
    "day4": {
      "tasks": {
        "task1": {
          "type": Tasks.quote,
          "title": "Quote of the day!",
          "description": "We are going to do this together :)",
          "text":
              "Fais quelque chose aujourd hui pour laquelle tu te féliciteras plus tard"
        },
        "task2": {
          "type": Tasks.questions,
          "title": "Journal de bord",
          "description":
              "CONTROLE TES ALIMENTS , histoire de jean CONSIGNE DÉFI “ CONTRÔLER SES ALIMENTS”",
          "introText":
              "Choisissez un aliments que vous souhaitez mieux contrôler , cette semaine nous vous proposons de mieux contrôler : BONBONS  ",
          "questions": {
            "1":
                "À quelle fréquence et en quelle quantité en avez-vous mangé dans la journée ?",
            "2": "Dans quelles circonstances ?"
          },
        },
        "task3": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        }
      },
    },
    "day5": {
      "tasks": {
        "task1": {
          "type": Tasks.quote,
          "title": "Quote of the day!",
          "description": "We are going to do this together :)",
          "text":
              "Fais toi confiance, tu sais mieux que quiconque ce qui est bon pour toi "
        },
        "task2": {
          "type": Tasks.questions,
          "title": "Défi Communauté Gourmande",
          "description":
              "Cuisinez une recette proposée en découvrant les ingrédients près de chez vous !",
          "introText":
              "Préparez-vous à cuisiner une recette que nous avons spécialement sélectionnée pour vous. Une vraie recette saine et réconfortante, qui pourrait aller du bœuf bourguignon à un sauté de crevettes, en passant par des pâtes carbonara. Nous avons choisi une recette que vous allez adorer apprendre à maîtriser. Une fois la recette reçue, partez à la recherche des ingrédients nécessaires au sein de votre communauté, c'est-à-dire dans un rayon de 5 à 15 km autour de chez vous. Enfilez votre plus belle paire de chaussures de sport ou prenez votre vélo pour explorer votre quartier à travers ce défi. Expliquez aux commerçants que vous rencontrez l objectif de votre démarche. Cet exercice vous permettra de créer un véritable lien avec votre communauté, de renforcer votre sentiment d'appartenance, et de découvrir des forces insoupçonnées en vous, contribuant à votre épanouissement personnel. Cette semaine, nous vous proposons de réaliser un délicieux Sauté de crevettes !",
          "questions": {
            "1": "Comment te sens-tu aujourd'hui ?",
            "2": "Où en es-tu dans tes défis ?",
            "3": "Quand et comment allez-vous préparer cet événement ?",
            "4": "Qui avez-vous rencontré ? (marchand, épicier, connaissance…)",
            "5":
                "Qu’avez-vous ressenti en cuisinant le plat, en voyant le résultat ?"
          },
        },
        "task3": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        }
      },
    },
    "day6": {
      "tasks": {
        "task1": {
          "type": Tasks.questions,
          "title": "EVOLUTION PHYSIQUE",
          "description":
              "N'oubliez pas de remplir votre défi évolution physique cette semaine !",
          "introText": "Bienvenue dans votre défi physique :)",
          "questions": {
            "1":
                "Comment se passent tes objectifs de la semaine et en général ?",
            "2": {
              "q": "Quel repas avez-vous choisi cette semaine ?",
              "a": ['Matin', 'Midi', 'Soir']
            }, //these are the choices that the user should choose from : 1-Matin 2-Midi 3-Soir 4-Collation
            "3": {
              "q":
                  "De combien de portions avez-vous réduit votre consommation ?",
              "a": ['½', '⅓', '¼']
            }, //these are the choices that the user should choose from : 1-½ 2-⅓ 3-¼
            "4": {
              "q": "Avez-vous remplacé les jus par de l'eau ou du thé ? ",
              "a": ['Oui', 'Non']
            }, //these are the choices that the user should choose from : 1-Oui 2-Non
            "5": {
              "q":
                  "Avez-vous trouvé d'autres activités à faire lorsque vous aviez envie de grignoter ?",
              "a": ['Oui', 'Non']
            },
            "6":
                "Quelles activités avez-vous choisies pour éviter le grignotage ?",
            "7":
                "Comment vous sentez-vous par rapport à cette semaine de défi ?"
          },
        },
        "task3": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        }
      },
    },
    "day7": {
      "tasks": {
        "task1": {
          "type": Tasks.generatedVideo,
          "title": "Vidéo BestOf de la semaine",
          "description":
              "Profitez des meilleurs moments de cette semaine, en espérant que ça vous plaise !",
        },
      },
    },
  },
  "week4": {
    "day1": {
      "tasks": {
        "task1": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        },
        "task2": {
          "type": Tasks.video,
          "title": "Video motivation",
          "videoUrl":
              "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FCle4Fsemaine4jour1Eric.mp4?alt=media&token=7aada55e-c9be-4942-9043-f1509eac4519",
          "description": "CLE BIEN-ÊTRE 4",
        },
      },
    },
    "day2": {
      "tasks": {
        "task1": {
          "type": Tasks.questions,
          "title": "Journal de board",
          "description": "Organiser d'une soirée",
          "introText":
              "Le défi est d ‘organiser une soirée ou après-midi avec ces personnes des amis , collegues,voisins,  autour de jeux de connaissance qui ont pour but d' apprendre à mieux vous connaître. Vous pouvez utiliser des jeux de sociétés ou nous vous proposons une liste sympa de jeux animés et amusants :) ",
          "questions": {
            "1":
                "Organisation de l'événement : combien de personnes sont invitées ?",
            "2": "Quelle formule, soirée à thème ou potluck ?"
          },
        },
        "task2": {
          "type": Tasks.quote,
          "title": "Quote of the day!",
          "description": "We are going to do this together :)",
          "text":
              "Tous les jours , je choisis consciemment d’améliorer ma santé physique, car c’est le seul corps qui m’est donné et il abrite mon esprit"
        },
        "task3": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        }
      },
    },
    "day3": {
      "tasks": {
        "task1": {
          "type": Tasks.questions,
          "title": "Journal de board",
          "description": "Exercice Émotionnel",
          "introText":
              "Notez dans votre journal les sentiments et émotions que chaque personne vous fait ressentir avant,pendant , et apres evenement .  Recenser dans votre journal les réactions que vous avez eu, et les émotions que vous ressentez, si les amitiés que vous souhaitez créer se sont révélées positives ou négatives, à approfondir ou pas. Le maintien de cette saine habitude de vie , organiser une fois par mois ce genre d' activité avec les personnes que vous désirez connaître ou approfondir les relations,  au minimum 4 , vous deviendrez rapidement le roi ou la reine de soirées sympas ;)",
          "questions": {
            "1": "Avez-vous été surpris par la réaction d'un de vos amis ?"
          },
        },
        "task2": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        }
      },
    },
    "day4": {
      "tasks": {
        "task1": {
          "type": Tasks.reading,
          "title": "Jeux : Le portrait ",
          "description": "Let's have some fun :D",
          "goal":
              "Permettre à chacun des participants du groupe de mieux se connaître.  Créer, à l’intérieur du groupe, une atmosphère de camaraderie nécessaire à la formation. ",
          "materials":
              "Une feuille d'énoncé par participant.  Un crayon par participant. ",
          "text":
              "Faire asseoir le groupe en cercle. Distribuer une feuille d'énoncé par participant. Inviter les participants à choisir sur la feuille trois énoncés (ajuster le nombre d’énoncés en fonction du nombre de participants) et à y répondre de façon individuelle. Chacun doit ensuite partager, à tour de rôle, les trois énoncés retenus au reste du groupe en expliquant ses choix. Feuille d’énoncés Consigne : Choisir trois énoncés parmi cette liste proposée. Si j’étais… un lieu, un arbre, une fleur, un animal, une œuvre d’art, une personnalité connue, un événement historique, une œuvre d’art, un tableau, un livre, un objet, un entrepreneur, sur le marché du travail. Compléter les trois phrases suivantes afin d’expliquer vos énoncés. 1. Si j’étais _______________________________ je serais ______________________________ parce que _____________________________________________________________________. 2. Si j’étais _______________________________ je serais ______________________________ parce que _____________________________________________________________________. 3. Si j’étais _______________________________ je serais ______________________________ parce que _____________________________________________________________________."
        },
        "task2": {
          "type": Tasks.reading,
          "title": "Jeux : Le maître du ballon ",
          "description": "Let's have some fun :D",
          "goal":
              "Le but du jeu est d'être la dernière personne dont le ballon n'est pas crevé, avec une durée de 5 à 10 minutes.",
          "materials":
              "Ficelle et suffisamment de ballons pour en donner un à chaque personne. ",
          "text":
              "Demandez aux participants de gonfler un ballon et d’y attacher le bout d’une ficelle (d’environ 60 cm). Puis, demandez‐leur d’attacher l’autre extrémité de la ficelle autour de leur cheville. Les joueurs doivent ensuite courir et tenter de crever le ballon des autres en sautant dessus. La dernière personne dont le ballon est intact gagne! Pour faire durer le plaisir, jeu peut se dérouler en plusieurs manches "
        },
        "task3": {
          "type": Tasks.reading,
          "title": "Jeux : Moi ",
          "description": "Let's have some fun :D",
          "goal":
              "Les participants devinent ce que les dates et les mots révèlent sur vous.",
          "materials":
              "des dates et mots qui vous caractérisent, écrits au tableau ou sur une feuille. ",
          "text":
              "Les participants devinent en remue-méninges ce que les dates et les mots écrits leur apprennent sur vous, par exemple : bleu (ma couleur préférée), Egypte (j’ai habité en Egypte), Danser (j’aime danser), Patrice (mon frère), 11 (mon adresse), Épinards (je déteste), Ferrari (je voudrais une Ferrari), Vélo (j’ai un vélo), 44 (année de naissance de ma mère), etc. Ensuite, les participants peuvent écrire des mots les caractérisant pour que les autres les devinent."
        },
        "task4": {
          "type": Tasks.questions,
          "title": "Journal de bord",
          "description":
              "CONTROLE TES ALIMENTS , histoire de jean CONSIGNE DÉFI “ CONTRÔLER SES ALIMENTS”",
          "introText":
              "Choisissez un aliments que vous souhaitez mieux contrôler , cette semaine nous vous proposons de mieux contrôler : BONBONS   ",
          "questions": {
            "1":
                "À quelle fréquence et en quelle quantité en avez-vous mangé dans la journée ?",
            "2": "Dans quelles circonstances ?",
            "3":
                "Qu'en penses-tu ? Écris tes impressions dans ton journal de bord"
          },
        },
        "task5": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        }
      },
    },
    "day5": {
      "tasks": {
        "task1": {
          "type": Tasks.quote,
          "title": "Quote of the day!",
          "description": "We are going to do this together :)",
          "text":
              "Des choses extraordinaires se produisent quand on s'éloigne de la négativité"
        },
        "task2": {
          "type": Tasks.questions,
          "title": "Défi Communauté Gourmande",
          "description":
              "Cuisinez une recette proposée en découvrant les ingrédients près de chez vous !",
          "introText":
              "Préparez-vous à cuisiner une recette que nous avons spécialement sélectionnée pour vous. Une vraie recette saine et réconfortante, qui pourrait aller du bœuf bourguignon à un sauté de crevettes, en passant par des pâtes carbonara. Nous avons choisi une recette que vous allez adorer apprendre à maîtriser. Une fois la recette reçue, partez à la recherche des ingrédients nécessaires au sein de votre communauté, c'est-à-dire dans un rayon de 5 à 15 km autour de chez vous. Enfilez votre plus belle paire de chaussures de sport ou prenez votre vélo pour explorer votre quartier à travers ce défi. Expliquez aux commerçants que vous rencontrez l objectif de votre démarche. Cet exercice vous permettra de créer un véritable lien avec votre communauté, de renforcer votre sentiment d'appartenance, et de découvrir des forces insoupçonnées en vous, contribuant à votre épanouissement personnel. Cette semaine, nous vous proposons de réaliser un délicieux Rôti de Porc , pomme et érable !",
          "questions": {
            "1": "Comment te sens-tu aujourd'hui ?",
            "2": "Où en es-tu dans tes défis ?",
            "3": "Quand et comment allez-vous préparer cet événement ?",
            "4": "Qui avez-vous rencontré ? (marchand, épicier, connaissance…)",
            "5":
                "Qu’avez-vous ressenti en cuisinant le plat, en voyant le résultat ?"
          },
        },
        "task3": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        }
      },
    },
    "day6": {
      "tasks": {
        "task1": {
          "type": Tasks.quote,
          "title": "Quote of the day!",
          "description": "We are going to do this together :)",
          "text": "Entoure toi de gens qui te font évoluer"
        },
        "task2": {
          "type": Tasks.questions,
          "title": "EVOLUTION PHYSIQUE",
          "description":
              "N'oubliez pas de remplir votre défi évolution physique cette semaine !",
          "introText": "Bienvenue dans votre défi physique :)",
          "questions": {
            "1":
                "Comment se passent tes objectifs de la semaine et en général ?",
            "2":
                "Comment se passent tes objectifs de la semaine et en général ?",
            "3": {
              "q": "Quel repas avez-vous choisi cette semaine ?",
              "a": ['Matin', 'Midi', 'Soir']
            }, //these are the choices that the user should choose from : 1-Matin 2-Midi 3-Soir 4-Collation
            "4": {
              "q":
                  "De combien de portions avez-vous réduit votre consommation ?",
              "a": ['½', '⅓', '¼']
            }, //these are the choices that the user should choose from : 1-½ 2-⅓ 3-¼
            "5": {
              "q": "Avez-vous remplacé les jus par de l'eau ou du thé ? ",
              "a": ['Oui', 'Non']
            }, //these are the choices that the user should choose from : 1-Oui 2-Non
            "6": {
              "q":
                  "Avez-vous trouvé d'autres activités à faire lorsque vous aviez envie de grignoter ?",
              "a": ['Oui', 'Non']
            },
            "7":
                "Quelles activités avez-vous choisies pour éviter le grignotage ?",
            "8":
                "Comment vous sentez-vous par rapport à cette semaine de défi ?"
          },
        },
        "task3": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        }
      },
    },
    "day7": {
      "tasks": {
        "task1": {
          "type": Tasks.generatedVideo,
          "title": "Vidéo BestOf de la semaine",
          "description":
              "Profitez des meilleurs moments de cette semaine, en espérant que ça vous plaise !",
        },
      },
    },
  },
  "week5": {
    "day1": {
      "tasks": {
        "task1": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        },
        "task2": {
          "type": Tasks.video,
          "title": "Video motivation",
          "videoUrl":
              "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2Fcle5Semaine5-jour1_acceptersesimper.mp4?alt=media&token=586526bf-5d28-4775-ba7f-0e0532622aa1",
          "description": "CLE BIEN-ÊTRE 5",
        },
      },
    },
    "day2": {
      "tasks": {
        "task1": {
          "type": Tasks.video,
          "title": "Video motivation",
          "videoUrl":
              "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2Fdefi6Oserrevercestos.mp4?alt=media&token=e6c631ef-b76c-4bea-a328-2125bdcf8200",
          "description": "N’AYEZ PAS PEUR DU CHANGEMENT ! ",
        },
        "task2": {
          "type": Tasks.questions,
          "title": "Journal de board",
          "description": "Oser rever , c est oser vivre !",
          "introText":
              "Bienvenue dans votre journal de bord du jour, durant votre cheminement, prenez le temps de rêver et de constater l'évolution de ces rêveries et trouver les moyens pour les réaliser  en complétant  les questions",
          "questions": {
            "1": "Quelles sont les réalisations que vous souhaitez vivre ?",
            "2": "Est-ce que c'est réalisable ?",
            "3":
                "Quels sont les moyens que vous vous donnez pour réaliser ces rêves ?"
          },
        },
        "task3": {
          "type": Tasks.quote,
          "title": "Quote of the day!",
          "description": "We are going to do this together :)",
          "text":
              "Lorsqu on traite tous les êtres vivants avec respect, ils nous respectent en retour"
        },
        "task3": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        },
      },
    },
    "day3": {
      "tasks": {
        "task1": {
          "type": Tasks.questions,
          "title": "Journal de board",
          "description": "Describe your feelings",
          "introText":
              "Bienvenue dans votre journal de bord du jour. Faites quelque chose que vous n'avez jamais osé faire ! un saut en parachute, ou du bungee ou plus simple , allez a la piscine, faire du jardinage , de la poterie maintenant que vous commencez à élargir votre cercle social , inviter une personne à vous accompagner dans cette aventure ",
          "questions": {
            "1": "Comment te sens-tu aujourd'hui ?",
            "2": "Où en es-tu dans tes défis ?",
          },
        },
        "task2": {
          "type": Tasks.quote,
          "title": "Quote of the day!",
          "description": "We are going to do this together :)",
          "text":
              "Il est préférable d'avancer lentement que de rester immobile."
        },
        "task3": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        }
      },
    },
    "day4": {
      "tasks": {
        "task1": {
          "type": Tasks.quote,
          "title": "Quote of the day!",
          "description": "We are going to do this together :)",
          "text":
              "Ce ne sont pas toutes les tempêtes qui viennent perturber ta vie.Certaines sont la pour dégager ton chemin."
        },
        "task2": {
          "type": Tasks.questions,
          "title": "Journal de bord",
          "description":
              "CONTROLE TES ALIMENTS , histoire de jean CONSIGNE DÉFI “ CONTRÔLER SES ALIMENTS”",
          "introText":
              "Choisissez un aliments que vous souhaitez mieux contrôler , cette semaine nous vous proposons de mieux contrôler : PRODUITS TRANSFORMÉ  ",
          "questions": {
            "1":
                "À quelle fréquence et en quelle quantité en avez-vous mangé dans la journée ?",
            "2": "Dans quelles circonstances ?"
          },
        },
        "task3": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        }
      },
    },
    "day5": {
      "tasks": {
        "task1": {
          "type": Tasks.quote,
          "title": "Quote of the day!",
          "description": "We are going to do this together :)",
          "text": "Aimes toi suffisamment pour adopter un mode de vie sain"
        },
        "task2": {
          "type": Tasks.questions,
          "title": "Défi Communauté Gourmande",
          "description":
              "Cuisinez une recette proposée en découvrant les ingrédients près de chez vous !",
          "introText":
              "Préparez-vous à cuisiner une recette que nous avons spécialement sélectionnée pour vous. Une vraie recette saine et réconfortante, qui pourrait aller du bœuf bourguignon à un sauté de crevettes, en passant par des pâtes carbonara. Nous avons choisi une recette que vous allez adorer apprendre à maîtriser. Une fois la recette reçue, partez à la recherche des ingrédients nécessaires au sein de votre communauté, c'est-à-dire dans un rayon de 5 à 15 km autour de chez vous. Enfilez votre plus belle paire de chaussures de sport ou prenez votre vélo pour explorer votre quartier à travers ce défi. Expliquez aux commerçants que vous rencontrez l objectif de votre démarche. Cet exercice vous permettra de créer un véritable lien avec votre communauté, de renforcer votre sentiment d'appartenance, et de découvrir des forces insoupçonnées en vous, contribuant à votre épanouissement personnel. Cette semaine, nous vous proposons de réaliser un délicieux Bœuf Bourguignon !",
          "questions": {
            "1": "Comment te sens-tu aujourd'hui ?",
            "2": "Où en es-tu dans tes défis ?",
            "3": "Quand et comment allez-vous préparer cet événement ?",
            "4": "Qui avez-vous rencontré ? (marchand, épicier, connaissance…)",
            "5":
                "Qu’avez-vous ressenti en cuisinant le plat, en voyant le résultat ?"
          },
        },
        "task3": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        }
      },
    },
    "day6": {
      "tasks": {
        "task1": {
          "type": Tasks.questions,
          "title": "EVOLUTION PHYSIQUE",
          "description":
              "N'oubliez pas de remplir votre défi évolution physique cette semaine !",
          "introText": "Bienvenue dans votre défi physique :)",
          "questions": {
            "1":
                "Comment se passent tes objectifs de la semaine et en général ?",
            "2":
                "Comment se passent tes objectifs de la semaine et en général ?",
            "3": {
              "q": "Quel repas avez-vous choisi cette semaine ?",
              "a": ['Matin', 'Midi', 'Soir']
            }, //these are the choices that the user should choose from : 1-Matin 2-Midi 3-Soir 4-Collation
            "4": {
              "q":
                  "De combien de portions avez-vous réduit votre consommation ?",
              "a": ['½', '⅓', '¼']
            }, //these are the choices that the user should choose from : 1-½ 2-⅓ 3-¼
            "5": {
              "q": "Avez-vous remplacé les jus par de l'eau ou du thé ? ",
              "a": ['Oui', 'Non']
            }, //these are the choices that the user should choose from : 1-Oui 2-Non
            "6": {
              "q":
                  "Avez-vous trouvé d'autres activités à faire lorsque vous aviez envie de grignoter ?",
              "a": ['Oui', 'Non']
            },
            "7":
                "Quelles activités avez-vous choisies pour éviter le grignotage ?",
            "8":
                "Comment vous sentez-vous par rapport à cette semaine de défi ?"
          },
        },
        "task2": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        }
      },
    },
    "day7": {
      "tasks": {
        "task1": {
          "type": Tasks.generatedVideo,
          "title": "Vidéo BestOf de la semaine",
          "description":
              "Profitez des meilleurs moments de cette semaine, en espérant que ça vous plaise !",
        },
      },
    },
  },
  "week6": {
    "day1": {
      "tasks": {
        "task1": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        },
        "task2": {
          "type": Tasks.video,
          "title": "Video motivation",
          "videoUrl":
              "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FCl6semaine6jour1soph.mp4?alt=media&token=fe7552cb-6047-42ff-a30e-1060ac2c96f6",
          "description": "CLE BIEN-ÊTRE 6",
        },
        "task3": {
          "type": Tasks.questions,
          "title": "Journal de board",
          "description": "Describe your feelings",
          "introText":
              "Le soutien de vos proches est primordial dans la réussite de  votre démarche . Au mieux ce défi resserra les liens avec vos proches, (ce que je souhaite ardemment) au pire vous allez découvrir les vrais visages de ce qui vous aimes et vous soutiennent de ceux qui ne vous soutiennent pas . A ce stade , vous devriez ressentir quelques changements significatifs dans la perception de vous-même. Il est temps de révéler votre nouveau vous , et votre nouveau chemin à vos proches !",
          "questions": {"Que pensez-vous du soutien de votre famille ? ": ""},
        },
      },
    },
    "day2": {
      "tasks": {
        "task1": {
          "type": Tasks.questions,
          "title": "Journal de board",
          "description": "Describe your feelings",
          "introText":
              "Vous devez inviter vos proches à un repas que vous aurez préparé, en demandant des conseils à vos épiciers pour satisfaire tous vos invités ; profitez-en pour proposer un jeu et vous affirmer, en refaisant les jeux de la semaine 4 ou en consultant la liste à venir, et préparez cet événement en choisissant le repas et les activités pour la soirée.",
          "questions": {
            "1": "Comment te sens-tu aujourd'hui ?",
            "2": "Où en es-tu dans tes défis ?",
          },
        },
        "task2": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        }
      },
    },
    "day3": {
      "tasks": {
        "task1": {
          "type": Tasks.questions,
          "title": "Journal de board",
          "description": "Describe your feelings",
          "introText": {
            "Révélez votre cheminement à vos proches, comment vous vous êtes senti avant et maintenant. L'idée n'est pas de régler ses comptes avec les membres de notre famille qui nous ont fait sentir mal, mais plutôt de leur révéler ou vous en êtes rendu et de demander leur soutien pour la suite.  Recenser dans votre journal les réactions que vous avez eu, et les émotions que vous ressentez.",
            "1-notez 3 qualités que vous vous reconnaissez ou que les autres vous reconnaissent . Dites à haute voix chaque qualité (je suis quelqu’un qui sait écouter, d'accueillant, de généreux, de fidele...).",
            "2- Notez 3 défauts. Soyez honnête envers vous-même. Ne vous jugez pas car ce n'est pas le sujet. Que pouvez-vous faire pour les atténuer?  Parlez- en avec vos proches, ils révéleront ainsi leur bienveillance.",
            "Le maintien de cette saine habitude de vie , réside dans le fait d’organiser une fois par mois ce genre d' activité avec les membres de votre famille, avec qui vous désirez maintenir et approfondir les relations."
          },
          "questions": {
            "1": "Comment te sens-tu aujourd'hui ?",
            "2": "Où en es-tu dans tes défis ?",
            "3": "Avez-vous été surpris par la réaction d'un de vos proches ?"
          },
        },
        "task2": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        }
      },
    },
    "day4": {
      "tasks": {
        "task1": {
          "type": Tasks.reading,
          "title": "Jeux : Le Roi du Dictionnaire",
          "description": "Let's have some fun :D",
          "goal":
              "Deviner les définitions de mots inconnus pour devenir le roi du dictionnaire.",
          "materials":
              "Chaque joueur a un morceau de papier et un stylo, et un dictionnaire est nécessaire pour rechercher les mots.",
          "text":
              "Un joueur choisit un mot inconnu dans le dictionnaire et le lit au groupe ; chaque joueur écrit le mot et propose une définition, tandis que le joueur avec le dictionnaire note la définition correcte. Les papiers sont ensuite mélangés et les définitions sont lues à haute voix. Les joueurs votent pour la définition qu'ils pensent être correcte, et des points sont attribués en fonction des votes. Le jeu continue jusqu'à ce qu'un joueur accumule le plus de points et devienne le roi du dictionnaire. si vous avez des ados : https://www.jeuxetcompagnie.fr/mafia-jeu-role-les-ados/"
        },
        "task2": {
          "type": Tasks.reading,
          "title": "Jeux : Le Siège Chaud",
          "description": "Let's have some fun :D",
          "goal":
              "Révéler votre nouveau vous à vos proches en apprenant à mieux vous connaître.",
          "materials": "Aucun matériel spécifique n'est requis.",
          "text":
              "Une personne s’assoit sur la sellette et tout le monde pose des questions ; commencez par vous et assurez-vous que les questions restent respectueuses."
        },
        "task3": {
          "type": Tasks.reading,
          "title": "Jeux : Questions Bizarres",
          "description": "Let's have some fun :D",
          "goal":
              "Découvrir vos invités en leur posant des questions amusantes et inattendues.",
          "materials": "Aucun matériel spécifique n'est requis.",
          "text":
              "Posez des questions étranges aux invités, comme 'Préféreriez-vous avoir le pouvoir de voler ou de vous téléporter ?' ou 'Effacerez-vous toutes les guerres de l’histoire ou trouverez-vous un remède contre le cancer ?' pour favoriser des échanges amusants et intéressants."
        },
        "task4": {
          "type": Tasks.questions,
          "title": "Journal de bord",
          "description":
              "CONTROLE TES ALIMENTS , histoire de jean CONSIGNE DÉFI “ CONTRÔLER SES ALIMENTS”",
          "introText":
              "Choisissez un aliments que vous souhaitez mieux contrôler , cette semaine nous vous proposons de mieux contrôler : PAIN  ",
          "questions": {
            "1":
                "À quelle fréquence et en quelle quantité en avez-vous mangé dans la journée ?",
            "2": "Dans quelles circonstances ?"
          },
        },
        "task5": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        }
      },
    },
    "day5": {
      "tasks": {
        "task1": {
          "type": Tasks.questions,
          "title": "Défi Communauté Gourmande",
          "description":
              "Cuisinez une recette proposée en découvrant les ingrédients près de chez vous !",
          "introText":
              "Préparez-vous à cuisiner une recette que nous avons spécialement sélectionnée pour vous. Une vraie recette saine et réconfortante, qui pourrait aller du bœuf bourguignon à un sauté de crevettes, en passant par des pâtes carbonara. Nous avons choisi une recette que vous allez adorer apprendre à maîtriser. Une fois la recette reçue, partez à la recherche des ingrédients nécessaires au sein de votre communauté, c'est-à-dire dans un rayon de 5 à 15 km autour de chez vous. Enfilez votre plus belle paire de chaussures de sport ou prenez votre vélo pour explorer votre quartier à travers ce défi. Expliquez aux commerçants que vous rencontrez l objectif de votre démarche. Cet exercice vous permettra de créer un véritable lien avec votre communauté, de renforcer votre sentiment d'appartenance, et de découvrir des forces insoupçonnées en vous, contribuant à votre épanouissement personnel. Cette semaine, nous vous proposons de réaliser un délicieux Hachis parmentier la Dinde !",
          "questions": {
            "1": "Quand et comment allez-vous préparer cet événement ?",
            "2": "Qui avez-vous rencontré ? (marchand, épicier, connaissance…)",
            "3":
                "Qu’avez-vous ressenti en cuisinant le plat, en voyant le résultat ?"
          },
        },
        "task2": {
          "type": Tasks.quote,
          "title": "Quote of the day!",
          "description": "We are going to do this together :)",
          "text":
              "Une des choses les plus bénéfiques à faire, c’est de se reconnecter avec ses origines"
        },
        "task3": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        }
      },
    },
    "day6": {
      "tasks": {
        "task1": {
          "type": Tasks.questions,
          "title": "EVOLUTION PHYSIQUE",
          "description":
              "N'oubliez pas de remplir votre défi évolution physique cette semaine !",
          "introText": "Bienvenue dans votre défi physique :)",
          "questions": {
            "1":
                "Comment se passent tes objectifs de la semaine et en général ?",
            "2":
                "Comment se passent tes objectifs de la semaine et en général ?",
            "3": {
              "q": "Quel repas avez-vous choisi cette semaine ?",
              "a": ['Matin', 'Midi', 'Soir']
            }, //these are the choices that the user should choose from : 1-Matin 2-Midi 3-Soir 4-Collation
            "4": {
              "q":
                  "De combien de portions avez-vous réduit votre consommation ?",
              "a": ['½', '⅓', '¼']
            }, //these are the choices that the user should choose from : 1-½ 2-⅓ 3-¼
            "5": {
              "q": "Avez-vous remplacé les jus par de l'eau ou du thé ? ",
              "a": ['Oui', 'Non']
            }, //these are the choices that the user should choose from : 1-Oui 2-Non
            "6": {
              "q":
                  "Avez-vous trouvé d'autres activités à faire lorsque vous aviez envie de grignoter ?",
              "a": ['Oui', 'Non']
            },
            "7":
                "Quelles activités avez-vous choisies pour éviter le grignotage ?",
            "8":
                "Comment vous sentez-vous par rapport à cette semaine de défi ?"
          },
        },
        "task2": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        }
      },
    },
    "day7": {
      "tasks": {
        "task1": {
          "type": Tasks.generatedVideo,
          "title": "Vidéo BestOf de la semaine",
          "description":
              "Profitez des meilleurs moments de cette semaine, en espérant que ça vous plaise !",
        },
      },
    },
  },
  "week7": {
    "day1": {
      "tasks": {
        "task1": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        },
        "task2": {
          "type": Tasks.video,
          "title": "Video motivation",
          "videoUrl":
              "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FCle7Semaine7jour1Jea.mp4?alt=media&token=f931a1eb-648e-4845-b28e-59e61484df30",
          "description": "CLE BIEN-ÊTRE 7",
        }
      },
    },
    "day2": {
      "tasks": {
        "task1": {
          "type": Tasks.questions,
          "title": "Journal de board",
          "description": "Describe your feelings",
          "introText":
              "Est donc de trouver cette activité culturelle qui vous intéresse. Pour éviter tout désagrément,  n'hésitez pas à communiquer avec les organisateurs pour savoir si l’endroit et les équipements sont adaptés.  Vous vous sentez un peu fébrile ? demandez à un de vos proches de vous accompagner et amusez-vous :) ",
          "questions": {
            "1":
                "Activités choisies, date, avec qui allez-vous faire cette activité ?",
            "2": "Comment te sens-tu aujourd'hui ?",
            "3": "Où en es-tu dans tes défis ?",
          },
        },
        "task2": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        }
      },
    },
    "day3": {
      "tasks": {
        "task1": {
          "type": Tasks.questions,
          "title": "Journal de board",
          "description": "Describe your feelings",
          "introText":
              "Bienvenue dans votre journal de bord du jour, Si vous répondez non aux première et deuxième questions vous comprenez que la perception du danger est exagérée et vous pouvez relativiser. Si vous répondez oui à la première et deuxième questions alors vous devez convenir avec la question 3 ce qu' il convient de faire. L’Action vous permettra d'être en contrôle et de diminuer votre anxiété. ",
          "questions": {
            "1": "Ma sécurité est-elle en danger ?",
            "2": "Est-ce grave ?",
            "3":
                "Que puis-je faire d'utile et d'adapté pour régler le conflit ?"
          },
        },
        "task2": {
          "type": Tasks.quote,
          "title": "Quote of the day!",
          "description": "We are going to do this together :)",
          "text":
              "lèves toi et vénère le sol sur lequel tu chemines, laisse toi guider vers de nouvelles aventures "
        },
        "task3": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        }
      },
    },
    "day4": {
      "tasks": {
        "task1": {
          "type": Tasks.quote,
          "title": "Quote of the day!",
          "description": "We are going to do this together :)",
          "text": "Prendre soin de soi permet de se réapproprier son pouvoir"
        },
        "task2": {
          "type": Tasks.questions,
          "title": "Journal de bord",
          "description":
              "CONTROLE TES ALIMENTS , histoire de jean CONSIGNE DÉFI “ CONTRÔLER SES ALIMENTS”",
          "introText":
              "Choisissez un aliments que vous souhaitez mieux contrôler , cette semaine nous vous proposons de mieux contrôler : BISCUITS  ",
          "questions": {
            "1":
                "À quelle fréquence et en quelle quantité en avez-vous mangé dans la journée ?",
            "2": "Dans quelles circonstances ?"
          },
        },
        "task3": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        }
      },
    },
    "day5": {
      "tasks": {
        "task1": {
          "type": Tasks.quote,
          "title": "Quote of the day!",
          "description": "We are going to do this together :)",
          "text": "Tout epreuves fait grandir"
        },
        "task2": {
          "type": Tasks.questions,
          "title": "Défi Communauté Gourmande",
          "description":
              "Cuisinez une recette proposée en découvrant les ingrédients près de chez vous !",
          "introText":
              "Préparez-vous à cuisiner une recette que nous avons spécialement sélectionnée pour vous. Une vraie recette saine et réconfortante, qui pourrait aller du bœuf bourguignon à un sauté de crevettes, en passant par des pâtes carbonara. Nous avons choisi une recette que vous allez adorer apprendre à maîtriser. Une fois la recette reçue, partez à la recherche des ingrédients nécessaires au sein de votre communauté, c'est-à-dire dans un rayon de 5 à 15 km autour de chez vous. Enfilez votre plus belle paire de chaussures de sport ou prenez votre vélo pour explorer votre quartier à travers ce défi. Expliquez aux commerçants que vous rencontrez l objectif de votre démarche. Cet exercice vous permettra de créer un véritable lien avec votre communauté, de renforcer votre sentiment d'appartenance, et de découvrir des forces insoupçonnées en vous, contribuant à votre épanouissement personnel. Cette semaine, nous vous proposons de réaliser un délicieux Hachis parmentier la Dinde !",
          "questions": {
            "1": "Quand et comment allez-vous préparer cet événement ?",
            "2": "Qui avez-vous rencontré ? (marchand, épicier, connaissance…)",
            "3":
                "Qu’avez-vous ressenti en cuisinant le plat, en voyant le résultat ?"
          },
        },
        "task3": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        }
      },
    },
    "day6": {
      "tasks": {
        "task1": {
          "type": Tasks.questions,
          "title": "EVOLUTION PHYSIQUE",
          "description":
              "N'oubliez pas de remplir votre défi évolution physique cette semaine !",
          "introText": "Bienvenue dans votre défi physique :)",
          "questions": {
            "1":
                "Comment se passent tes objectifs de la semaine et en général ?",
            "2":
                "Comment se passent tes objectifs de la semaine et en général ?",
            "3": {
              "q": "Quel repas avez-vous choisi cette semaine ?",
              "a": ['Matin', 'Midi', 'Soir']
            }, //these are the choices that the user should choose from : 1-Matin 2-Midi 3-Soir 4-Collation
            "4": {
              "q":
                  "De combien de portions avez-vous réduit votre consommation ?",
              "a": ['½', '⅓', '¼']
            }, //these are the choices that the user should choose from : 1-½ 2-⅓ 3-¼
            "5": {
              "q": "Avez-vous remplacé les jus par de l'eau ou du thé ? ",
              "a": ['Oui', 'Non']
            }, //these are the choices that the user should choose from : 1-Oui 2-Non
            "6": {
              "q":
                  "Avez-vous trouvé d'autres activités à faire lorsque vous aviez envie de grignoter ?",
              "a": ['Oui', 'Non']
            },
            "7":
                "Quelles activités avez-vous choisies pour éviter le grignotage ?",
            "8":
                "Comment vous sentez-vous par rapport à cette semaine de défi ?"
          },
        },
        "task2": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        }
      },
    },
    "day7": {
      "tasks": {
        "task1": {
          "type": Tasks.generatedVideo,
          "title": "Vidéo BestOf de la semaine",
          "description":
              "Profitez des meilleurs moments de cette semaine, en espérant que ça vous plaise !",
        },
      },
    },
  },
  "week8": {
    "day1": {
      "tasks": {
        "task1": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        },
        "task2": {
          "type": Tasks.questions,
          "title": "Journal de board",
          "description": "Describe your feelings",
          "introText":
              "Bienvenue dans votre journal de bord du jour, faisons-le ensemble :)",
          "questions": {
            "1": "Comment te sens-tu en ce début de semaine ?",
            "2": "Où en es-tu dans tes défis ?"
          },
        },
        "task3": {
          "type": Tasks.video,
          "title": "Video motivation",
          "videoUrl":
              "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FCle8semaine8jour1jea.mp4?alt=media&token=e4020c48-eda4-466e-af8d-e77a01dc08fe",
          "description": "CLE BIEN-ÊTRE 7",
        },
      },
    },
    "day2": {
      "tasks": {
        "task1": {
          "type": Tasks.questions,
          "title": "Journal de board",
          "description": "Describe your feelings",
          "introText":
              "Pour le défi émotionnel, vous êtes libre de choisir ce qui vous convient le plus, ou bien d' en inventer pour continuer la découverte vers vous même. L  idee etant de vous reprendre en main et de vous offrir l' autonomie de vivre ! ",
          "questions": {"1": "Comment te sens-tu aujourd'hui ?"},
        },
        "task2": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        }
      },
    },
    "day3": {
      "tasks": {
        "task1": {
          "type": Tasks.questions,
          "title": "Journal de board",
          "description": "Describe your feelings",
          "introText":
              "Votre défi physique de cette semaine et de choisir le défi que vous avez le plus aimé, qui vous a fait sentir vous transformer et recommencer le , c' est votre cadeau :) ",
          "questions": {"1": "Comment te sens-tu aujourd'hui ?"},
        },
        "task2": {
          "type": Tasks.takePhoto,
          "title": "Selfie Time!",
          "description": "Take a quick selfie, we'd love to see your smile!",
        }
      },
    },
    "day4": {
      "tasks": {
        "task1": {
          "type": Tasks.generatedVideo,
          "title": "Your Feelings!",
          "description":
              "Recapitulatif des moments exterieur videos photos et videos des jours 2 et 3  de chaque semaine",
        },
      },
    },
    "day5": {
      "tasks": {
        "task1": {
          "type": Tasks.generatedVideo,
          "title": "Your Feelings!",
          "description":
              "Recapitulatif des videos et photos jours 4 et 5 de chaque semaine ",
        },
      },
    },
    "day6": {
      "tasks": {
        "task1": {
          "type": Tasks.generatedVideo,
          "title": "Your Feelings!",
          "description": "Recapitulatif des videos et photos jour 6",
        },
      },
    },
    "day7": {
      "tasks": {
        "task1": {
          "type": Tasks.generatedVideo,
          "title": "Your Feelings!",
          "description": "Recapitulatif des jour 1 de chaque semaine",
        },
        "task2": {
          "type": Tasks.video,
          "title": "Video de Fin",
          "videoUrl":
              "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FFelicitationVideo.mp4?alt=media&token=125ef43c-46dd-42f3-b275-c8199df5e9d6",
          "description": "Felicitations :D",
        }
      },
    },
  },
};
