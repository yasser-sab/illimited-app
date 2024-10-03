import 'package:illimited_app/utils/utils.dart';

Map<String, Map<String, dynamic>> tasksOf = {
  // "week1": {
  //   "day1": {
  //     "tasks": {
  //       "task1": {
  //         "type": Tasks.takePhoto,
  //         "title": "Selfie Time!",
  //         "description": "Take a selfie in lmazna with l3arandas",
  //       },
  //       "task2": {
  //         "type": Tasks.questions,
  //         "title": "Journal de bord",
  //         "description":
  //             "CONTROLE TES ALIMENTS , histoire de jean CONSIGNE DÉFI “ CONTRÔLER SES ALIMENTS”",
  //         "introText":
  //             "Choisissez un aliments que vous souhaitez mieux contrôler , cette semaine nous vous proposons de mieux contrôler : PRODUITS TRANSFORMÉ  ",
  //         "questions": {
  //           "1":
  //               "A quelle fréquence et quantité en avez-vous mangé dans la journée ?",
  //           "2": "dans quelles circonstances ?"
  //         },
  //       },
  //       "task3": {
  //         "type": Tasks.reading,
  //         "title": "Your Feelings!",
  //         "description": "ask these questions with l3amloud",
  //         "goal": "",
  //         "materials": "",
  //         "text": ""
  //       },
  //       "task4": {
  //         "type": Tasks.quote,
  //         "title": "Your Feelings!",
  //         "description": "ask these questions with l3amloud",
  //         "text": "READING TEXT"
  //       },
  //       "task5": {
  //         "type": Tasks.video,
  //         "title": "Your Feelings!",
  //         "description": "ask these questions with l3amloud",
  //       },
  //       "task6": {
  //         "type": Tasks.generatedVideo,
  //         "title": "Your Feelings!",
  //         "description": "ask these questions with l3amloud",
  //       },
  //     },
  //   },
  //   "day2": {
  //     "tasks": {
  //       "task1": {
  //         "type": "",
  //         "title": "title",
  //         "description": "description",
  //       },
  //     },
  //   },
  //   "day3": {
  //     "tasks": {
  //       "task1": {
  //         "type": "",
  //         "title": "title",
  //         "description": "description",
  //       },
  //     },
  //   },
  //   "day4": {
  //     "tasks": {
  //       "task1": {
  //         "type": "",
  //         "title": "title",
  //         "description": "description",
  //       },
  //     },
  //   },
  //   "day5": {
  //     "tasks": {
  //       "task1": {
  //         "type": "",
  //         "title": "title",
  //         "description": "description",
  //       },
  //     },
  //   },
  //   "day6": {
  //     "tasks": {
  //       "task1": {
  //         "type": "",
  //         "title": "title",
  //         "description": "description",
  //       },
  //     },
  //   },
  //   "day7": {
  //     "tasks": {
  //       "task1": {
  //         "type": "",
  //         "title": "title",
  //         "description": "description",
  //       },
  //     },
  //   },
  // },
  "week1": {
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
            "1": "organisation de l'événement : combien de personnes invitées ?",
            "2": "quelle formule , soiree a theme, ou pot lock ? "
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
           "1": "Avez-vous été surpris de la réaction d' un de vos amis ?",
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
          "title": "Journal de board",
          "description": "Describe your feelings",
          "introText":
              "Bienvenue dans votre journal de bord du jour, faisons-le ensemble :)",
          "questions": {
            "1":"Qu en penses- tu ? ecrit tes impressions dans ton journal de bord  ",
          },
        },
        "task5": {
          "type": Tasks.questions,
          "title": "Journal de bord",
          "description":
              "CONTROLE TES ALIMENTS , histoire de jean CONSIGNE DÉFI “ CONTRÔLER SES ALIMENTS”",
          "introText":
              "Choisissez un aliments que vous souhaitez mieux contrôler , cette semaine nous vous proposons de mieux contrôler : BONBONS   ",
          "questions": {
            "1":"A quelle fréquence et quantité en avez-vous mangé dans la journée ?",
            "2":"dans quelles circonstances ?"
          },
        },
        "task6": {
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
            "1":"Comment te sens tu aujourd' hui ?",
            "2":"Ou est tu rendu dans tes défis ? ",
            "3":"quand et comment allez- vous préparer cet événement ?",
            "4":"qui avez-vous rencontré ? (marchand, épicier, connaissance …)",
            "5":"qu ‘avez vous ressenti en cuisinant le plat, en voyant le résultat ? "
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
            "1":{
              'videoTitle' : "video",
              'videoUrl' : "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/WhatsApp%20Video%202024-08-22%20at%2022.59.37.mp4?alt=media&token=5631087a-37ff-4020-a506-e7319df4fc8c"
            },
            "2":{
              "q" : "Quel repas avez-vous choisi cette semaine ?",
              "a" : ['Matin', 'Midi', 'Soir']
            }, //these are the choices that the user should choose from : 1-Matin 2-Midi 3-Soir 4-Collation
            "3":"De combien de portions avez-vous réduit votre consommation ?", //these are the choices that the user should choose from : 1-½ 2-⅓ 3-¼
            "4":{
              "q" : "Avez-vous remplacé les jus par de l'eau ou du thé ?",
              "a" : ['oui', 'non']
            }, //these are the choices that the user should choose from : 1-Oui 2-Non
            "5":"Avez-vous trouvé d'autres activités à faire lorsque vous aviez envie de grignoter ?", //these are the choices that the user should choose from :  1-Oui 2-Non
            "6":"Quelles activités avez-vous choisies pour éviter le grignotage ?",
            "7":"Comment vous sentez-vous par rapport à cette semaine de défi ?"
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
      }
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
          "type": Tasks.video,
          "title": "Video motivation",
          "videoUrl" : "",
          "description": "CLE BIEN-ÊTRE 5", 
        },
      },
    },
    "day2": {
      "tasks": {
        "task1": {
          "type": Tasks.questions,
          "title": "Journal de board",
          "description": "Oser rever , c est oser vivre !",
          "introText":
              "Bienvenue dans votre journal de bord du jour, durant votre cheminement, prenez le temps de rêver et de constater l'évolution de ces rêveries et trouver les moyens pour les réaliser  en complétant  les questions",
          "questions": {
            "Quelles sont les réalisations que vous souhaitez vivre ? ": "",
            "Est ce que c' est réalisable ?": "",
            "Quels sont les moyens que vous vous donnez pour réaliser ces rêves ?":
                ""
          },
        },
        "task2": {
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
            "Comment te sens tu aujourd' hui ? ": "",
            "Ou est tu rendu dans tes défis ?  ": ""
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
            "A quelle fréquence et quantité en avez-vous mangé dans la journée ?":
                "",
            "dans quelles circonstances ?": ""
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
            "Comment te sens tu aujourd' hui ? ": "",
            "Ou est tu rendu dans tes défis ?   ": "",
            "quand et comment allez- vous préparer cet événement ?": "",
            "qui avez-vous rencontré ? (marchand, épicier, connaissance …)": "",
            "qu ‘avez vous ressenti en cuisinant le plat, en voyant le résultat ? ":
                ""
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
            "Comment se passe tes objectifs de la semaine et générale ?": "",
            "Quel repas avez-vous choisi cette semaine ?":
                "", //these are the choices that the user should choose from : 1-Matin 2-Midi 3-Soir 4-Collation
            "De combien de portions avez-vous réduit votre consommation ?":
                "", //these are the choices that the user should choose from : 1-½ 2-⅓ 3-¼
            "Avez-vous remplacé les jus par de l'eau ou du thé ? ":
                "", //these are the choices that the user should choose from : 1-Oui 2-Non
            "Avez-vous trouvé d'autres activités à faire lorsque vous aviez envie de grignoter ?":
                "", //these are the choices that the user should choose from :  1-Oui 2-Non
            "Quelles activités avez-vous choisies pour éviter le grignotage ?":
                "",
            "Comment vous sentez-vous par rapport à cette semaine de défi ?": ""
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
      }
    },
  },
  "week4": {
    "day1": {
      "tasks": {
        "task1": {
          "type": "",
          "title": "title",
          "description": "description",
        },
      },
    },
    "day2": {
      "tasks": {
        "task1": {
          "type": "",
          "title": "title",
          "description": "description",
        },
      },
    },
    "day3": {
      "tasks": {
        "task1": {
          "type": "",
          "title": "title",
          "description": "description",
        },
      },
    },
    "day4": {
      "tasks": {
        "task1": {
          "type": "",
          "title": "title",
          "description": "description",
        },
      },
    },
    "day5": {
      "tasks": {
        "task1": {
          "type": "",
          "title": "title",
          "description": "description",
        },
      },
    },
    "day6": {
      "tasks": {
        "task1": {
          "type": "",
          "title": "title",
          "description": "description",
        },
      },
    },
    "day7": {
      "tasks": {
        "task1": {
          "type": "",
          "title": "title",
          "description": "description",
        },
      },
    },
  },
  "week5": {
    "day1": {
      "tasks": {
        "task1": {
          "type": "",
          "title": "title",
          "description": "description",
        },
      },
    },
    "day2": {
      "tasks": {
        "task1": {
          "type": "",
          "title": "title",
          "description": "description",
        },
      },
    },
    "day3": {
      "tasks": {
        "task1": {
          "type": "",
          "title": "title",
          "description": "description",
        },
      },
    },
    "day4": {
      "tasks": {
        "task1": {
          "type": "",
          "title": "title",
          "description": "description",
        },
      },
    },
    "day5": {
      "tasks": {
        "task1": {
          "type": "",
          "title": "title",
          "description": "description",
        },
      },
    },
    "day6": {
      "tasks": {
        "task1": {
          "type": "",
          "title": "title",
          "description": "description",
        },
      },
    },
    "day7": {
      "tasks": {
        "task1": {
          "type": "",
          "title": "title",
          "description": "description",
        },
      },
    },
  },
  "week6": {
    "day1": {
      "tasks": {
        "task1": {
          "type": "",
          "title": "title",
          "description": "description",
        },
      },
    },
    "day2": {
      "tasks": {
        "task1": {
          "type": "",
          "title": "title",
          "description": "description",
        },
      },
    },
    "day3": {
      "tasks": {
        "task1": {
          "type": "",
          "title": "title",
          "description": "description",
        },
      },
    },
    "day4": {
      "tasks": {
        "task1": {
          "type": "",
          "title": "title",
          "description": "description",
        },
      },
    },
    "day5": {
      "tasks": {
        "task1": {
          "type": "",
          "title": "title",
          "description": "description",
        },
      },
    },
    "day6": {
      "tasks": {
        "task1": {
          "type": "",
          "title": "title",
          "description": "description",
        },
      },
    },
    "day7": {
      "tasks": {
        "task1": {
          "type": "",
          "title": "title",
          "description": "description",
        },
      },
    },
  },
  "week7": {
    "day1": {
      "tasks": {
        "task1": {
          "type": "",
          "title": "title",
          "description": "description",
        },
      },
    },
    "day2": {
      "tasks": {
        "task1": {
          "type": "",
          "title": "title",
          "description": "description",
        },
      },
    },
    "day3": {
      "tasks": {
        "task1": {
          "type": "",
          "title": "title",
          "description": "description",
        },
      },
    },
    "day4": {
      "tasks": {
        "task1": {
          "type": "",
          "title": "title",
          "description": "description",
        },
      },
    },
    "day5": {
      "tasks": {
        "task1": {
          "type": "",
          "title": "title",
          "description": "description",
        },
      },
    },
    "day6": {
      "tasks": {
        "task1": {
          "type": "",
          "title": "title",
          "description": "description",
        },
      },
    },
    "day7": {
      "tasks": {
        "task1": {
          "type": "",
          "title": "title",
          "description": "description",
        },
      },
    },
  },
  "week8": {
    "day1": {
      "tasks": {
        "task1": {
          "type": "",
          "title": "title",
          "description": "description",
        },
      },
    },
    "day2": {
      "tasks": {
        "task1": {
          "type": "",
          "title": "title",
          "description": "description",
        },
      },
    },
    "day3": {
      "tasks": {
        "task1": {
          "type": "",
          "title": "title",
          "description": "description",
        },
      },
    },
    "day4": {
      "tasks": {
        "task1": {
          "type": "",
          "title": "title",
          "description": "description",
        },
      },
    },
    "day5": {
      "tasks": {
        "task1": {
          "type": "",
          "title": "title",
          "description": "description",
        },
      },
    },
    "day6": {
      "tasks": {
        "task1": {
          "type": "",
          "title": "title",
          "description": "description",
        },
      },
    },
    "day7": {
      "tasks": {
        "task1": {
          "type": "",
          "title": "title",
          "description": "description",
        },
      },
    },
  },
};
