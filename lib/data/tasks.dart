import 'package:illimited_app/utils/utils.dart';

Map<String, Map<String, dynamic>> tasksOf = {
  "week1": {
    "day1": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Moment de selfie !",
            "description":
                "Prenez un selfie rapide, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط صورة سيلفي سريعة، نود رؤية ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora de Selfie!",
            "description":
                "¡Tómate un selfie rápido, nos encantaría ver tu sonrisa!"
          },
        },
        "task2": {
          "fr": {
            "type": Tasks.questions,
            "title": "Journal de bord",
            "description": "Décris tes sentiments",
            "introText":
                "Bienvenue dans ton journal de bord ! Pour les semaines suivantes, celui-ci t'accompagnera et te soutiendra lors de ton changement :) N'hésite pas à me consulter souvent et à te rappeler tes objectifs pour rester motivée !",
            "questions": {
              "1":
                  "Nomme 5 objectifs pour l'amélioration de ton mental et 5 objectifs d'amélioration physique ?",
              "2": "Pourquoi souhaites-tu améliorer ces points ?"
            }
          },
          "en": {
            "type": Tasks.questions,
            "title": "Logbook",
            "description": "Describe your feelings",
            "introText":
                "Welcome to your logbook! For the next few weeks, this will accompany and support you during your transformation :) Feel free to check in with me often and remind yourself of your goals to stay motivated!",
            "questions": {
              "1":
                  "Name 5 goals for improving your mental health and 5 goals for physical improvement?",
              "2": "Why do you want to improve these areas?"
            }
          },
          "ar": {
            "type": Tasks.questions,
            "title": "دفتر الملاحظات",
            "description": "صف مشاعرك",
            "introText":
                "مرحبًا بك في دفتر ملاحظاتك! خلال الأسابيع المقبلة، سيُرافقك هذا الدعم في تحوّلك :) لا تتردد في مراجعة هذا بانتظام وتذكير نفسك بأهدافك للبقاء متحفزًا!",
            "questions": {
              "1": "اذكر 5 أهداف لتحسين صحتك العقلية و5 أهداف للتحسين البدني؟",
              "2": "لماذا تريد تحسين هذه النقاط؟"
            }
          },
          "es": {
            "type": Tasks.questions,
            "title": "Diario",
            "description": "Describe tus sentimientos",
            "introText":
                "¡Bienvenido a tu diario! Durante las próximas semanas, este te acompañará y apoyará en tu transformación :) ¡No dudes en consultarme a menudo y recordarte tus objetivos para mantenerte motivada!",
            "questions": {
              "1":
                  "Nombra 5 objetivos para mejorar tu salud mental y 5 objetivos para mejorar físicamente.",
              "2": "¿Por qué deseas mejorar estos aspectos?"
            }
          }
        },
        "task3": {
          "fr": {
            "type": Tasks.quote,
            "title": "Citation du jour !",
            "description": "Nous allons faire cela ensemble :)",
            "text":
                "LE PASSÉ EST UNE LEÇON, LE PRÉSENT EST UN CADEAU, ET L’AVENIR EST TA MOTIVATION"
          },
          "en": {
            "type": Tasks.quote,
            "title": "Quote of the day!",
            "description": "We are going to do this together :)",
            "text":
                "THE PAST IS A LESSON, THE PRESENT IS A GIFT, AND THE FUTURE IS YOUR MOTIVATION"
          },
          "ar": {
            "type": Tasks.quote,
            "title": "اقتباس اليوم!",
            "description": "سنقوم بذلك معًا :)",
            "text": "الماضي هو درس، والحاضر هو هدية، والمستقبل هو دافعك"
          },
          "es": {
            "type": Tasks.quote,
            "title": "¡Cita del día!",
            "description": "¡Vamos a hacer esto juntos :)",
            "text":
                "EL PASADO ES UNA LECCIÓN, EL PRESENTE ES UN REGALO, Y EL FUTURO ES TU MOTIVACIÓN"
          }
        },
        "task4": {
          "fr": {
            "type": Tasks.video,
            "title": "Vidéo de motivation",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FCle%CC%811.semaine1.jour1.Jeanmp4.mp4?alt=media&token=d3dfac10-95ef-4a95-ace5-e9256d12f337",
            "description": "N’AYEZ PAS PEUR DU CHANGEMENT !"
          },
          "en": {
            "type": Tasks.video,
            "title": "Video Motivation",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FCle%CC%811.semaine1.jour1.ENGLISHmp4.mp4?alt=media&token=c56b7481-435c-45bd-bd27-b019d28a17cd",
            "description": "DON'T BE AFRAID OF CHANGE!"
          },
          "ar": {
            "type": Tasks.video,
            "title": "فيديو تحفيزي",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FCle%CC%811.semaine1.jour1.ARABICp4.mp4?alt=media&token=460b3b82-7ef9-433b-ad37-e9c11ac35ea2",
            "description": "لا تخاف من التغيير!"
          },
          "es": {
            "type": Tasks.video,
            "title": "Video de motivación",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FCle%CC%811.semaine1.jour1.SPANISH.mp4?alt=media&token=84550b23-09ea-4b84-bfe3-8144bc3500fb",
            "description": "¡NO TENGAS MIEDO AL CAMBIO!"
          }
        },
      },
    },
    "day2": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.video,
            "title": "Vidéo de motivation",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FDefi1Controletesalimsem1jour2.mp4?alt=media&token=0e8d856b-37e1-40e8-ad8c-09300c9c93bb",
            "description": "Nous sommes ce que nous mangeons !"
          },
          "en": {
            "type": Tasks.video,
            "title": "Video Motivation",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/logbookVideos%2FDefi1ControleENGLISH.mp4?alt=media&token=0144b75f-37aa-4c8a-bc1f-3236d03ea560",
            "description": "We are what we eat!"
          },
          "ar": {
            "type": Tasks.video,
            "title": "فيديو تحفيزي",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/logbookVideos%2FDefi1ControletesaliARABIC.mp4?alt=media&token=6831a4e6-b2aa-48f5-b874-6179b91088b3",
            "description": "نحن ما نأكله!"
          },
          "es": {
            "type": Tasks.video,
            "title": "Video de motivación",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/logbookVideos%2FDefi1ControleSPANISH.mp4?alt=media&token=d7d47863-6ea3-40ba-8755-05ae429aa111",
            "description": "¡Somos lo que comemos!"
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.questions,
            "title": "Journal de bord",
            "description":
                "CONTROLE TES ALIMENTS, histoire de Jean CONSIGNE DÉFI “CONTRÔLER SES ALIMENTS”",
            "introText":
                "Choisissez un aliment que vous souhaitez mieux contrôler, cette semaine nous vous proposons de mieux contrôler : CHOCOLAT",
            "questions": {
              "1":
                  "À quelle fréquence et en quelle quantité en avez-vous mangé dans la journée ?",
              "2": "Dans quelles circonstances ?"
            }
          },
          "en": {
            "type": Tasks.questions,
            "title": "Logbook",
            "description":
                "CONTROL YOUR FOODS, Jean's story CHALLENGE INSTRUCTION “CONTROL YOUR FOODS”",
            "introText":
                "Choose a food that you want to control better; this week we suggest focusing on: CHOCOLATE",
            "questions": {
              "1": "How often and how much did you eat it during the day?",
              "2": "Under what circumstances?"
            }
          },
          "ar": {
            "type": Tasks.questions,
            "title": "دفتر الملاحظات",
            "description": "راقب طعامك، قصة جان تعليمات التحدي “راقب طعامك”",
            "introText":
                "اختر طعامًا ترغب في مراقبته بشكل أفضل، هذا الأسبوع نقترح التركيز على: الشوكولاتة",
            "questions": {
              "1": "كم مرة وكم كمية تناولتها في اليوم؟",
              "2": "في أي ظروف؟"
            }
          },
          "es": {
            "type": Tasks.questions,
            "title": "Diario",
            "description":
                "CONTROLAR TUS ALIMENTOS, historia de Jean INSTRUCCIÓN DEL DESAFÍO “CONTROLAR TUS ALIMENTOS”",
            "introText":
                "Elige un alimento que desees controlar mejor; esta semana te proponemos centrarte en: CHOCOLATE",
            "questions": {
              "1":
                  "¿Con qué frecuencia y en qué cantidad lo has comido durante el día?",
              "2": "¿En qué circunstancias?"
            }
          }
        },
        "task3": {
          "fr": {
            "type": Tasks.quote,
            "title": "Citation du jour !",
            "description": "Nous allons faire cela ensemble :)",
            "text": "RESPECTE-TOI, TU MÉRITES LE MEILLEUR"
          },
          "en": {
            "type": Tasks.quote,
            "title": "Quote of the day!",
            "description": "We are going to do this together :)",
            "text": "RESPECT YOURSELF, YOU DESERVE THE BEST"
          },
          "ar": {
            "type": Tasks.quote,
            "title": "اقتباس اليوم!",
            "description": "سنقوم بذلك معًا :)",
            "text": "احترم نفسك، أنت تستحق الأفضل"
          },
          "es": {
            "type": Tasks.quote,
            "title": "¡Cita del día!",
            "description": "¡Vamos a hacer esto juntos :)",
            "text": "RESPÉTATE, MERECES LO MEJOR"
          }
        },
        "task4": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Moment de selfie !",
            "description":
                "Prenez un selfie rapide, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط صورة سيلفي سريعة، نود رؤية ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora de Selfie!",
            "description":
                "¡Tómate un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        },
      },
    },
    "day3": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.questions,
            "title": "Défi Communauté Gourmande",
            "description":
                "Cuisinez une recette proposée en découvrant les ingrédients près de chez vous !",
            "introText":
                "Préparez-vous à cuisiner une recette que nous avons spécialement sélectionnée pour vous. Une vraie recette saine et réconfortante, qui pourrait aller du bœuf bourguignon à un sauté de crevettes, en passant par des pâtes carbonara. Nous avons choisi une recette que vous allez adorer apprendre à maîtriser. Une fois la recette reçue, partez à la recherche des ingrédients nécessaires au sein de votre communauté, c'est-à-dire dans un rayon de 5 à 15 km autour de chez vous. Enfilez votre plus belle paire de chaussures de sport ou prenez votre vélo pour explorer votre quartier à travers ce défi. Expliquez aux commerçants que vous rencontrez l'objectif de votre démarche. Cet exercice vous permettra de créer un véritable lien avec votre communauté, de renforcer votre sentiment d'appartenance, et de découvrir des forces insoupçonnées en vous, contribuant à votre épanouissement personnel. Cette semaine, nous vous proposons de réaliser un délicieux Bœuf Bourguignon !",
            "questions": {
              "1": "Quand et comment allez-vous préparer cet événement ?",
              "2":
                  "Qui avez-vous rencontré ? (marchand, épicier, connaissance …)",
              "3":
                  "Qu’avez-vous ressenti en cuisinant le plat, en voyant le résultat ?"
            }
          },
          "en": {
            "type": Tasks.questions,
            "title": "Gourmet Community Challenge",
            "description":
                "Cook a suggested recipe while discovering the ingredients near you!",
            "introText":
                "Get ready to cook a recipe we have specially selected for you. A truly healthy and comforting recipe, ranging from beef bourguignon to a shrimp stir-fry, or carbonara pasta. We have chosen a recipe that you will love learning to master. Once you receive the recipe, go searching for the necessary ingredients within your community, that is, within a radius of 5 to 15 km around your home. Put on your best pair of sneakers or take your bike to explore your neighborhood through this challenge. Explain to the merchants you meet the purpose of your approach. This exercise will help you create a real bond with your community, strengthen your sense of belonging, and discover unsuspected strengths within yourself, contributing to your personal growth. This week, we propose making a delicious Beef Bourguignon!",
            "questions": {
              "1": "When and how will you prepare this event?",
              "2": "Who did you meet? (merchant, grocer, acquaintance, etc.)",
              "3":
                  "What did you feel while cooking the dish and seeing the result?"
            }
          },
          "ar": {
            "type": Tasks.questions,
            "title": "تحدي مجتمع الذواقة",
            "description": "اطبخ وصفة مقترحة واكتشف المكونات بالقرب منك!",
            "introText":
                "استعد لطهي وصفة اخترناها خصيصًا لك. وصفة صحية ومريحة حقًا، قد تتراوح من لحم البقر بورغينيون إلى قريدس مقلي، أو باستا كاربونارا. لقد اخترنا وصفة ستعجبك وتحب تعلم إتقانها. بمجرد استلام الوصفة، انطلق للبحث عن المكونات الضرورية ضمن مجتمعك، أي في دائرة نصف قطرها من 5 إلى 15 كم حول منزلك. ارتدِ أفضل حذاء رياضي لديك أو استخدم دراجتك لاستكشاف منطقتك من خلال هذا التحدي. اشرح للتجار الذين تقابلهم هدفك من هذه الخطوة. سيساعدك هذا التمرين على إنشاء رابط حقيقي مع مجتمعك، وتعزيز شعورك بالانتماء، واكتشاف قوى غير متوقعة داخلك، مما يساهم في نموك الشخصي. هذا الأسبوع، نقترح عليك صنع لحم بقر بورغينيون لذيذ!",
            "questions": {
              "1": "متى وكيف ستعد لهذا الحدث؟",
              "2": "من قابلت؟ (تاجر، بائع، معارف، إلخ.)",
              "3": "ماذا شعرت أثناء طهي الطبق ورؤية النتيجة؟"
            }
          },
          "es": {
            "type": Tasks.questions,
            "title": "Desafío Comunidad Gourmet",
            "description":
                "¡Cocina una receta propuesta descubriendo los ingredientes cerca de ti!",
            "introText":
                "Prepárate para cocinar una receta que hemos seleccionado especialmente para ti. Una receta realmente saludable y reconfortante, que puede ir desde un estofado de carne de res hasta un salteado de camarones o pasta carbonara. Hemos elegido una receta que te encantará aprender a dominar. Una vez recibida la receta, sal a buscar los ingredientes necesarios dentro de tu comunidad, es decir, dentro de un radio de 5 a 15 km alrededor de tu hogar. Ponte tu mejor par de zapatillas deportivas o toma tu bicicleta para explorar tu vecindario a través de este desafío. Explica a los comerciantes que encuentres el objetivo de tu iniciativa. Este ejercicio te permitirá crear un vínculo real con tu comunidad, fortalecer tu sentido de pertenencia y descubrir fuerzas insospechadas en ti, contribuyendo a tu crecimiento personal. Esta semana, ¡te proponemos preparar un delicioso Estofado de Carne de Res!",
            "questions": {
              "1": "¿Cuándo y cómo vas a preparar este evento?",
              "2": "¿A quién conociste? (comerciante, tendero, conocido, etc.)",
              "3": "¿Qué sentiste al cocinar el plato y al ver el resultado?"
            }
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.questions,
            "title": "ÉVOLUTION PHYSIQUE",
            "description":
                "N'oubliez pas de remplir votre défi évolution physique cette semaine !",
            "introText": "Bienvenue dans votre défi physique :)",
            "questions": {
              "1": {
                "q": "Quel repas avez-vous choisi cette semaine ?",
                "a": ["Matin", "Midi", "Soir", "Collation"]
              },
              "2": {
                "q":
                    "De combien de portions avez-vous réduit votre consommation ?",
                "a": ["½", "⅓", "¼"]
              },
              "3": {
                "q": "Avez-vous remplacé les jus par de l'eau ou du thé ?",
                "a": ["Oui", "Non"]
              },
              "4": {
                "q":
                    "Avez-vous trouvé d'autres activités à faire lorsque vous aviez envie de grignoter ?",
                "a": ["Oui", "Non"]
              },
              "5":
                  "Quelles activités avez-vous choisies pour éviter le grignotage ?",
              "6":
                  "Comment vous sentez-vous par rapport à cette semaine de défi ?"
            }
          },
          "en": {
            "type": Tasks.questions,
            "title": "PHYSICAL EVOLUTION",
            "description":
                "Don't forget to complete your physical evolution challenge this week!",
            "introText": "Welcome to your physical challenge :)",
            "questions": {
              "1": {
                "q": "Which meal did you choose this week?",
                "a": ["Morning", "Lunch", "Dinner", "Snack"]
              },
              "2": {
                "q": "How many portions have you reduced in your consumption?",
                "a": ["½", "⅓", "¼"]
              },
              "3": {
                "q": "Did you replace juices with water or tea?",
                "a": ["Yes", "No"]
              },
              "4": {
                "q":
                    "Did you find other activities to do when you felt like snacking?",
                "a": ["Yes", "No"]
              },
              "5": "What activities did you choose to avoid snacking?",
              "6": "How do you feel about this week of the challenge?"
            }
          },
          "ar": {
            "type": Tasks.questions,
            "title": "تطور الجسم",
            "description": "لا تنسَ إكمال تحدي تطور الجسم هذا الأسبوع!",
            "introText": "مرحبًا بك في تحدي الجسم الخاص بك :)",
            "questions": {
              "1": {
                "q": "أي وجبة اخترت هذا الأسبوع؟",
                "a": ["صباحًا", "ظهرًا", "مساءً", "وجبة خفيفة"]
              },
              "2": {
                "q": "كم عدد الحصص التي قللتها في استهلاكك؟",
                "a": ["½", "⅓", "¼"]
              },
              "3": {
                "q": "هل استبدلت العصائر بالماء أو الشاي؟",
                "a": ["نعم", "لا"]
              },
              "4": {
                "q":
                    "هل وجدت أنشطة أخرى تفعلها عندما تشعر برغبة في تناول وجبة خفيفة؟",
                "a": ["نعم", "لا"]
              },
              "5": "ما الأنشطة التي اخترتها لتجنب تناول وجبات خفيفة؟",
              "6": "كيف تشعر حيال هذا الأسبوع من التحدي؟"
            }
          },
          "es": {
            "type": Tasks.questions,
            "title": "EVOLUCIÓN FÍSICA",
            "description":
                "¡No olvides completar tu desafío de evolución física esta semana!",
            "introText": "Bienvenido a tu desafío físico :)",
            "questions": {
              "1": {
                "q": "¿Qué comida elegiste esta semana?",
                "a": ["Mañana", "Mediodía", "Noche", "Snack"]
              },
              "2": {
                "q": "¿Cuántas porciones has reducido en tu consumo?",
                "a": ["½", "⅓", "¼"]
              },
              "3": {
                "q": "¿Has reemplazado los jugos por agua o té?",
                "a": ["Sí", "No"]
              },
              "4": {
                "q":
                    "¿Has encontrado otras actividades para hacer cuando tenías ganas de picar?",
                "a": ["Sí", "No"]
              },
              "5": "¿Qué actividades elegiste para evitar picar?",
              "6": "¿Cómo te sientes con respecto a esta semana de desafío?"
            }
          }
        },
        "task3": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Temps de Selfie !",
            "description":
                "Prenez un selfie rapide, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط سيلفي سريع، نود أن نرى ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del Selfie!",
            "description":
                "¡Tómate un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        },
      },
    },
    "day4": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.quote,
            "title": "Citation du jour !",
            "description": "Nous allons faire cela ensemble :)",
            "text":
                "Lorsque nous comprenons qui nous sommes, notre vie a un sens"
          },
          "en": {
            "type": Tasks.quote,
            "title": "Quote of the day!",
            "description": "We are going to do this together :)",
            "text": "When we understand who we are, our life has meaning"
          },
          "ar": {
            "type": Tasks.quote,
            "title": "اقتباس اليوم!",
            "description": "سنقوم بذلك معًا :)",
            "text": "عندما نفهم من نحن، تكون حياتنا لها معنى"
          },
          "es": {
            "type": Tasks.quote,
            "title": "¡Cita del día!",
            "description": "¡Vamos a hacer esto juntos :)",
            "text":
                "Cuando entendemos quiénes somos, nuestra vida tiene un sentido"
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.video,
            "title": "Vidéo de motivation",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FDefi3EvolutionPhisiq-sem1jour4.mp4?alt=media&token=7e120cbe-12ec-4e4b-843e-e5c7f308aac3",
            "description": "N’AYEZ PAS PEUR DU CHANGEMENT !"
          },
          "en": {
            "type": Tasks.video,
            "title": "Video motivation",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/logbookVideos%2FDefi3ENGLISHvolutionPhisiq-sem1jour4.mp4?alt=media&token=b0dbe268-704e-43a4-a3ea-c1c62a7bee7e",
            "description": "DON'T BE AFRAID OF CHANGE!"
          },
          "ar": {
            "type": Tasks.video,
            "title": "فيديو تحفيزي",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/logbookVideos%2FDefi3ARABICevolutionPhisiq-sem1jour4.mp4?alt=media&token=1e92a91b-b058-4620-b610-cb25960d6758",
            "description": "لا تخاف من التغيير!"
          },
          "es": {
            "type": Tasks.video,
            "title": "Vídeo de motivación",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/logbookVideos%2FDefi3SPANISHevolutionPhisiq-sem1jour4.mp4?alt=media&token=1790a68b-96cd-4459-b52c-d917d3b8a7db",
            "description": "¡NO TENGAS MIEDO AL CAMBIO!"
          }
        },
        "task3": {
          "fr": {
            "type": Tasks.questions,
            "title": "Vos sentiments !",
            "description": "Décrivez votre ressenti",
            "introText": "Bienvenue dans ton journal de bord de jour :)",
            "questions": {"1": "Comment ça va ?"}
          },
          "en": {
            "type": Tasks.questions,
            "title": "Your Feelings!",
            "description": "Describe your feeling",
            "introText": "Welcome to your daily journal :)",
            "questions": {"1": "How are you?"}
          },
          "ar": {
            "type": Tasks.questions,
            "title": "مشاعرك!",
            "description": "صف شعورك",
            "introText": "مرحبًا بك في دفتر يومياتك :)",
            "questions": {"1": "كيف حالك؟"}
          },
          "es": {
            "type": Tasks.questions,
            "title": "¡Tus Sentimientos!",
            "description": "Describe tus sentimientos",
            "introText": "Bienvenido a tu diario diario :)",
            "questions": {"1": "¿Cómo estás?"}
          }
        },
        "task4": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Temps de Selfie !",
            "description":
                "Prenez un selfie rapide, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط سيلفي سريع، نود أن نرى ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del Selfie!",
            "description":
                "¡Tómate un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        },
      },
    },
    "day5": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.quote,
            "title": "Citation du jour !",
            "description": "Nous allons faire cela ensemble :)",
            "text":
                "PRENDS L’HABITUDE DE TROUVER AU MOINS UNE CHOSE POSITIVE QUI T’EST ARRIVÉE DANS LA JOURNÉE"
          },
          "en": {
            "type": Tasks.quote,
            "title": "Quote of the day!",
            "description": "We are going to do this together :)",
            "text":
                "Get into the habit of finding at least one positive thing that happened to you today."
          },
          "ar": {
            "type": Tasks.quote,
            "title": "اقتباس اليوم!",
            "description": "سنقوم بذلك معًا :)",
            "text":
                "اعتد على العثور على شيء إيجابي واحد على الأقل حدث لك اليوم."
          },
          "es": {
            "type": Tasks.quote,
            "title": "¡Cita del día!",
            "description": "¡Vamos a hacer esto juntos :)",
            "text":
                "Acostúmbrate a encontrar al menos una cosa positiva que te haya pasado hoy."
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.questions,
            "title": "Journal de bord",
            "description": "Décrivez vos sentiments",
            "introText":
                "Bienvenue dans votre journal de bord du jour, faisons-le ensemble :)",
            "questions": {
              "1": "Comment te sens-tu aujourd'hui ?",
              "2": "Où en es-tu dans tes défis ?"
            }
          },
          "en": {
            "type": Tasks.questions,
            "title": "Journal",
            "description": "Describe your feelings",
            "introText":
                "Welcome to your daily journal, let's do it together :)",
            "questions": {
              "1": "How are you feeling today?",
              "2": "How far along are you in your challenges?"
            }
          },
          "ar": {
            "type": Tasks.questions,
            "title": "دفتر اليوميات",
            "description": "صف مشاعرك",
            "introText": "مرحبًا بك في دفتر يومياتك اليوم، لنقم بذلك معًا :)",
            "questions": {
              "1": "كيف تشعر اليوم؟",
              "2": "إلى أين وصلت في تحدياتك؟"
            }
          },
          "es": {
            "type": Tasks.questions,
            "title": "Diario",
            "description": "Describe tus sentimientos",
            "introText": "Bienvenido a tu diario diario, hagámoslo juntos :)",
            "questions": {
              "1": "¿Cómo te sientes hoy?",
              "2": "¿En qué punto estás en tus desafíos?"
            }
          }
        },
        "task3": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Temps de Selfie !",
            "description":
                "Prenez un selfie rapide, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط سيلفي سريع، نود أن نرى ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del Selfie!",
            "description":
                "¡Tómate un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        },
      },
    },
    "day6": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.quote,
            "title": "Citation du jour !",
            "description": "Nous allons faire cela ensemble :)",
            "text":
                "C’EST NORMAL DE FAIRE DES ERREURS, TANT QUE JE CONTINUE DE DONNER LE MEILLEUR DE MOI-MÊME."
          },
          "en": {
            "type": Tasks.quote,
            "title": "Quote of the day!",
            "description": "We are going to do this together :)",
            "text":
                "IT’S NORMAL TO MAKE MISTAKES, AS LONG AS I KEEP GIVING MY BEST."
          },
          "ar": {
            "type": Tasks.quote,
            "title": "اقتباس اليوم!",
            "description": "سنقوم بذلك معًا :)",
            "text":
                "من الطبيعي ارتكاب الأخطاء، طالما أنني أستمر في تقديم أفضل ما لدي."
          },
          "es": {
            "type": Tasks.quote,
            "title": "¡Cita del día!",
            "description": "¡Vamos a hacer esto juntos :)",
            "text":
                "ES NORMAL COMETER ERRORES, SIEMPRE QUE SIGA DANDO LO MEJOR DE MÍ."
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.questions,
            "title": "Journal de bord",
            "description": "Décrivez vos sentiments",
            "introText":
                "Bienvenue dans votre journal de bord du jour, faisons-le ensemble :)",
            "questions": {"1": "COMMENT SE PASSE TES OBJECTIFS ?"}
          },
          "en": {
            "type": Tasks.questions,
            "title": "Journal",
            "description": "Describe your feelings",
            "introText":
                "Welcome to your daily journal, let's do it together :)",
            "questions": {"1": "HOW ARE YOUR GOALS GOING?"}
          },
          "ar": {
            "type": Tasks.questions,
            "title": "دفتر اليوميات",
            "description": "صف مشاعرك",
            "introText": "مرحبًا بك في دفتر يومياتك اليوم، لنقم بذلك معًا :)",
            "questions": {"1": "كيف تسير أهدافك؟"}
          },
          "es": {
            "type": Tasks.questions,
            "title": "Diario",
            "description": "Describe tus sentimientos",
            "introText": "Bienvenido a tu diario diario, hagámoslo juntos :)",
            "questions": {"1": "¿CÓMO VAN TUS OBJETIVOS?"}
          }
        },
        "task3": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Temps de Selfie !",
            "description":
                "Prenez un selfie rapide, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط سيلفي سريع، نود أن نرى ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del Selfie!",
            "description":
                "¡Tómate un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        }
      },
    },
    "day7": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.generatedVideo,
            "title": "Vidéo BestOf de la semaine",
            "description":
                "Profitez des meilleurs moments de cette semaine, en espérant que ça vous plaise !"
          },
          "en": {
            "type": Tasks.generatedVideo,
            "title": "Best Of Video of the Week",
            "description":
                "Enjoy the best moments of this week, hoping you like it!"
          },
          "ar": {
            "type": Tasks.generatedVideo,
            "title": "فيديو أفضل لحظات الأسبوع",
            "description": "استمتع بأفضل لحظات هذا الأسبوع، على أمل أن يعجبك!"
          },
          "es": {
            "type": Tasks.generatedVideo,
            "title": "Video Best Of de la semana",
            "description":
                "¡Disfruta de los mejores momentos de esta semana, esperando que te guste!"
          }
        }
      },
    },
  },
  "week2": {
    "day1": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Temps de Selfie !",
            "description":
                "Prenez un selfie rapide, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط سيلفي سريع، نود أن نرى ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del Selfie!",
            "description":
                "¡Tómate un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.questions,
            "title": "Journal de bord",
            "description": "Décrivez vos sentiments",
            "introText":
                "Bienvenue dans votre journal de bord du jour, faisons-le ensemble :)",
            "questions": {"1": "Comment te sens- tu en ce début de semaine ?"}
          },
          "en": {
            "type": Tasks.questions,
            "title": "Journal",
            "description": "Describe your feelings",
            "introText":
                "Welcome to your daily journal, let's do it together :)",
            "questions": {"1": "How do you feel at the beginning of this week?"}
          },
          "ar": {
            "type": Tasks.questions,
            "title": "دفتر اليوميات",
            "description": "صف مشاعرك",
            "introText": "مرحبًا بك في دفتر يومياتك اليوم، لنقم بذلك معًا :)",
            "questions": {"1": "كيف تشعر في بداية هذا الأسبوع؟"}
          },
          "es": {
            "type": Tasks.questions,
            "title": "Diario",
            "description": "Describe tus sentimientos",
            "introText": "Bienvenido a tu diario diario, hagámoslo juntos :)",
            "questions": {"1": "¿Cómo te sientes al inicio de esta semana?"}
          }
        },
        "task3": {
          "fr": {
            "type": Tasks.video,
            "title": "Vidéo motivation",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FCle%CC%812.semaine2.jou1.Suzanne.mp4?alt=media&token=185fff2c-bb5e-46a4-b607-7b27650cf00e",
            "description": "CLE BIEN-ÊTRE 2 : CHANGEZ VOTRE REGARD"
          },
          "en": {
            "type": Tasks.video,
            "title": "Motivational Video",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FCle%CC%812.semaine2.jou1ENGLISH%20(1).mp4?alt=media&token=58836d6b-a28b-4e2c-aff3-3f431e770f4f",
            "description": "WELL-BEING KEY 2: CHANGE YOUR PERSPECTIVE"
          },
          "ar": {
            "type": Tasks.video,
            "title": "فيديو تحفيزي",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FCle%CC%812.semaine2.jou1.SuzanneARABIC.mp4?alt=media&token=1b90bf89-0155-4bdc-9ffb-3a72f1d39af4",
            "description": "المفتاح للرفاهية 2: غيّر وجهة نظرك"
          },
          "es": {
            "type": Tasks.video,
            "title": "Video motivacional",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/logbookVideos%2FCL%C3%89BIENETRE2.SPANISH.mp4?alt=media&token=ffb2bc86-cdb0-4415-9880-ee9cc1c7e089",
            "description": "CLAVE DEL BIENESTAR 2: CAMBIA TU PERSPECTIVA"
          }
        }
      },
    },
    "day2": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.questions,
            "title": "Vos émotions !",
            "description": "Décrivez vos sentiments",
            "introText":
                "Bienvenue dans votre journal de bord du jour, repensez à 3 situations et répondez aux questions suivantes qui amèneront à poser un autre regard sur les événements que vous vivez ou avez vécus :",
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
              "9":
                  "Quel aspect positif pouvez-vous tirer de cette expérience ?",
              "10":
                  "Quelles seraient les conséquences positives d'une autre manière de réagir ou d'agir ?",
              "11": "Quels enseignements pouvez-vous en tirer ?"
            }
          },
          "en": {
            "type": Tasks.questions,
            "title": "Your Feelings!",
            "description": "Describe your feelings",
            "introText":
                "Welcome to your daily journal, think back to 3 situations and answer the following questions to gain a different perspective on the events you've experienced:",
            "questions": {
              "1": "When and why did you feel angry?",
              "2": "Where were you and who was with you at that moment?",
              "3": "What exactly happened to trigger this emotion?",
              "4": "What thoughts crossed your mind during this event?",
              "5": "How did the situation end?",
              "6": "How did you feel emotionally afterward?",
              "7":
                  "In hindsight, how could you have better managed the situation?",
              "8": "What could you have done or thought differently?",
              "9": "What positive aspect can you take from this experience?",
              "10":
                  "What would be the positive consequences of reacting or acting differently?",
              "11": "What lessons can you learn from this?"
            }
          },
          "ar": {
            "type": Tasks.questions,
            "title": "مشاعرك!",
            "description": "صف مشاعرك",
            "introText":
                "مرحبًا بك في دفتر يومياتك اليوم، فكّر في 3 مواقف وأجب على الأسئلة التالية التي ستساعدك على رؤية الأحداث التي تعيشها أو شهدتها من منظور آخر:",
            "questions": {
              "1": "متى ولماذا شعرت بالغضب؟",
              "2": "أين كنت ومن كان معك في ذلك الوقت؟",
              "3": "ماذا حدث بالضبط ليؤدي إلى هذه العاطفة؟",
              "4": "ما الأفكار التي كانت تخطر على بالك خلال هذا الحدث؟",
              "5": "كيف انتهت تلك الحالة؟",
              "6": "كيف شعرت عاطفياً بعد ذلك؟",
              "7":
                  "بفضل نظره إلى الوراء، كيف كان يمكنك إدارة الموقف بشكل أفضل؟",
              "8": "ماذا كان يمكنك القيام به أو التفكير فيه بشكل مختلف؟",
              "9": "ما الجانب الإيجابي الذي يمكنك استخلاصه من هذه التجربة؟",
              "10": "ما هي العواقب الإيجابية لردة فعل أو تصرف مختلف؟",
              "11": "ما الدروس التي يمكنك تعلمها من هذا؟"
            }
          },
          "es": {
            "type": Tasks.questions,
            "title": "¡Tus sentimientos!",
            "description": "Describe tus sentimientos",
            "introText":
                "Bienvenido a tu diario del día, piensa en 3 situaciones y responde a las siguientes preguntas que te ayudarán a ver los eventos que vives o has vivido desde otra perspectiva:",
            "questions": {
              "1": "¿Cuándo y por qué te sentiste enojado?",
              "2": "¿Dónde estabas y quién estaba contigo en ese momento?",
              "3": "¿Qué pasó exactamente para desencadenar esta emoción?",
              "4":
                  "¿Qué pensamientos pasaron por tu mente durante este evento?",
              "5": "¿Cómo terminó la situación?",
              "6": "¿Cómo te sentiste emocionalmente después?",
              "7":
                  "En retrospectiva, ¿cómo podrías haber manejado mejor la situación?",
              "8": "¿Qué podrías haber hecho o pensado de manera diferente?",
              "9": "¿Qué aspecto positivo puedes extraer de esta experiencia?",
              "10":
                  "¿Cuáles serían las consecuencias positivas de reaccionar o actuar de otra manera?",
              "11": "¿Qué lecciones puedes aprender de esto?"
            }
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.quote,
            "title": "Citation du jour !",
            "description": "Nous allons le faire ensemble :)",
            "text":
                "Si cette vie t’a été donnée, c’est que tu as la force requise pour bien la vivre."
          },
          "en": {
            "type": Tasks.quote,
            "title": "Quote of the day!",
            "description": "We are going to do this together :)",
            "text":
                "If this life has been given to you, it is because you have the strength required to live it well."
          },
          "ar": {
            "type": Tasks.quote,
            "title": "اقتباس اليوم!",
            "description": "سنجعل هذا معًا :)",
            "text":
                "إذا كانت هذه الحياة قد أعطيت لك، فهذا يعني أن لديك القوة اللازمة للعيش بشكل جيد."
          },
          "es": {
            "type": Tasks.quote,
            "title": "¡Cita del día!",
            "description": "¡Vamos a hacerlo juntos :)",
            "text":
                "Si se te ha dado esta vida, es porque tienes la fuerza necesaria para vivirla bien."
          }
        },
        "task3": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Temps de Selfie !",
            "description":
                "Prenez un selfie rapide, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط سيلفي سريع، نود أن نرى ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del Selfie!",
            "description":
                "¡Tómate un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        }
      },
    },
    //day3 week2 to come back later because i confused this one
    "day3": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.video,
            "title": "Vidéo de motivation",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FvideosstyleFrench.mp4?alt=media&token=8f0fc8e4-bf9b-432f-9920-f9a21b458a46",
            "description": "Vidéo de styles de coupe de cheveux"
          },
          "en": {
            "type": Tasks.video,
            "title": "Video motivation",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FvideosstyleENGLISH.mp4?alt=media&token=a2d03fa4-3067-413b-b97e-6af867b53721",
            "description": "Haircut style video"
          },
          "ar": {
            "type": Tasks.video,
            "title": "فيديو تحفيزي",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FvideosstyleARABICmp4.mp4?alt=media&token=c967ed2e-66b9-4c81-abfe-06a0a7a14e47",
            "description": "فيديو لأنماط قصات الشعر"
          },
          "es": {
            "type": Tasks.video,
            "title": "Vídeo de motivación",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FvideosStyleSPANISH.mp4?alt=media&token=ca065558-ae15-4bb8-97bf-feb9b85a3cbf",
            "description": "Video de estilos de cortes de cabello"
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.questions,
            "title": "Journal de bord",
            "description": "Décrivez vos sentiments",
            "introText":
                "Cependant, et pour être fidèle à notre accompagnement, pendant 21 jours vous allez devoir maintenir cette saine habitude (non pas d'aller au coiffeur tous les matins) mais de prendre le temps de vous faire sentir bien par une nouvelle habitude corporelle et/ou esthétique. Exemple: si vous prenez un soin esthétique, par exemple une épilation: l'idée du défi 21 jours, est de prendre soin tous les jours en mettant de la crème sur votre partie épilée, cela aussi peut être une nouvelle habitude. *Les personnes obèses ou en surpoids ont tendance à garder les cheveux courts ou attachés, je vous mets en lien quelques modèles de coupe de rallonges qui vont très bien aux rondes et qui font sentir femmes ;)",
            "questions": {
              "1":
                  "Quel est l'objectif de maintenir une nouvelle habitude de soin personnel pendant 21 jours ?",
              "2":
                  "Comment les soins esthétiques ou corporels quotidiens peuvent-ils contribuer au bien-être à long terme ?",
              "3":
                  "Quelles sont quelques suggestions de coiffure pour les personnes cherchant à améliorer leur apparence et à se sentir plus féminines ?"
            }
          },
          "en": {
            "type": Tasks.questions,
            "title": "Journal",
            "description": "Describe your feelings",
            "introText":
                "However, to stay true to our support, for 21 days you will need to maintain this healthy habit (not going to the hairdresser every morning) but taking the time to feel good with a new body and/or aesthetic habit. Example: if you get an aesthetic treatment, such as hair removal, the idea of the 21-day challenge is to take care every day by applying cream to your waxed area, this too can be a new habit. *People who are obese or overweight tend to keep their hair short or tied up, here are some extension hairstyle models that look great on curvy women and make them feel feminine ;)",
            "questions": {
              "1":
                  "What is the goal of maintaining a new personal care habit for 21 days?",
              "2":
                  "How can daily aesthetic or body care contribute to long-term well-being?",
              "3":
                  "What are some hairstyle suggestions for people looking to enhance their appearance and feel more feminine?"
            }
          },
          "ar": {
            "type": Tasks.questions,
            "title": "دفتر اليوميات",
            "description": "صف مشاعرك",
            "introText":
                "ومع ذلك، وللتمسك بدعمنا، سوف تحتاجون إلى الحفاظ على هذه العادة الصحية (ليس الذهاب إلى صالون الحلاقة كل صباح) ولكن أخذ الوقت للشعور بالراحة من خلال عادة جديدة للجسد و/أو الجمال. على سبيل المثال: إذا حصلتم على علاج جمالي، مثل إزالة الشعر، فإن فكرة تحدي 21 يومًا هي العناية كل يوم من خلال وضع كريم على المنطقة التي تم إزالة الشعر منها، ويمكن أن تكون هذه أيضًا عادة جديدة. *عادةً ما تميل الأشخاص البدينة أو الذين يعانون من الوزن الزائد إلى الاحتفاظ بشعرهن قصيرًا أو مربوطًا، إليكم بعض نماذج قصات الشعر التي تناسب النساء البدينات وتجعلهم يشعرون بالأنوثة ;)",
            "questions": {
              "1":
                  "ما هو هدف الحفاظ على عادة جديدة للعناية الشخصية لمدة 21 يومًا؟",
              "2":
                  "كيف يمكن أن تساهم العناية الجمالية أو الجسدية اليومية في الرفاهية على المدى الطويل؟",
              "3":
                  "ما هي بعض اقتراحات تسريحات الشعر للأشخاص الذين يتطلعون إلى تحسين مظهرهم والشعور بمزيد من الأنوثة؟"
            }
          },
          "es": {
            "type": Tasks.questions,
            "title": "Diario",
            "description": "Describe tus sentimientos",
            "introText":
                "Sin embargo, para ser fieles a nuestro apoyo, durante 21 días deberán mantener este hábito saludable (no ir a la peluquería todas las mañanas), sino tomarse el tiempo para sentirse bien con un nuevo hábito corporal y/o estético. Ejemplo: si te haces un tratamiento estético, como la depilación, la idea del desafío de 21 días es cuidarte todos los días aplicando crema en la parte depilada, esto también puede ser un nuevo hábito. *Las personas obesas o con sobrepeso tienden a mantener el cabello corto o recogido, aquí hay algunos modelos de peinados de extensiones que lucen muy bien en las mujeres curvilíneas y que las hacen sentir femeninas ;)",
            "questions": {
              "1":
                  "¿Cuál es el objetivo de mantener un nuevo hábito de cuidado personal durante 21 días?",
              "2":
                  "¿Cómo pueden contribuir los cuidados estéticos o corporales diarios al bienestar a largo plazo?",
              "3":
                  "¿Cuáles son algunas sugerencias de peinados para las personas que buscan mejorar su apariencia y sentirse más femeninas?"
            }
          }
        },
        "task3": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Temps de Selfie !",
            "description":
                "Prenez un selfie rapide, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط سيلفي سريع، نود أن نرى ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del Selfie!",
            "description":
                "¡Tómate un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        }
      },
    },
    "day4": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.quote,
            "title": "Citation du jour!",
            "description": "Nous allons faire cela ensemble :)",
            "text":
                "Guérir ne veut pas dire nier ses blessures, mais bien leur enlever tout contrôle sur soi."
          },
          "en": {
            "type": Tasks.quote,
            "title": "Quote of the day!",
            "description": "We are going to do this together :)",
            "text":
                "Healing does not mean denying your wounds, but rather removing all control over yourself."
          },
          "ar": {
            "type": Tasks.quote,
            "title": "اقتباس اليوم!",
            "description": "سوف نفعل ذلك معًا :)",
            "text":
                "الشفاء لا يعني إنكار جروحك، بل يعني إزالة كل السيطرة عليها."
          },
          "es": {
            "type": Tasks.quote,
            "title": "¡Cita del día!",
            "description": "¡Vamos a hacer esto juntos :)",
            "text":
                "Sanar no significa negar tus heridas, sino quitarles todo control sobre ti."
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.questions,
            "title": "Journal de bord",
            "description":
                "CONTROLE TES ALIMENTS, histoire de jean CONSIGNE DÉFI “CONTRÔLER SES ALIMENTS”",
            "introText":
                "Choisissez un aliment que vous souhaitez mieux contrôler, cette semaine nous vous proposons de mieux contrôler : BISCUITS",
            "questions": {
              "1":
                  "À quelle fréquence et en quelle quantité en avez-vous mangé dans la journée ?",
              "2": "Dans quelles circonstances ?"
            }
          },
          "en": {
            "type": Tasks.questions,
            "title": "Journal",
            "description":
                "CONTROL YOUR FOODS, a jean story TASK INSTRUCTION “CONTROL YOUR FOODS”",
            "introText":
                "Choose a food you want to control better; this week we suggest better controlling: COOKIES",
            "questions": {
              "1": "How often and how much did you eat in a day?",
              "2": "Under what circumstances?"
            }
          },
          "ar": {
            "type": Tasks.questions,
            "title": "دفتر اليوميات",
            "description": "تحكم في طعامك، قصة جان التعليمات “التحكم في طعامك”",
            "introText":
                "اختر طعامًا ترغب في التحكم فيه بشكل أفضل؛ هذا الأسبوع نقترح عليك التحكم بشكل أفضل في: البسكويت",
            "questions": {
              "1": "كم مرة وكم كمية أكلت في اليوم؟",
              "2": "في أي ظروف؟"
            }
          },
          "es": {
            "type": Tasks.questions,
            "title": "Diario",
            "description":
                "CONTROLAR TUS ALIMENTOS, historia de jean INSTRUCCIÓN DEL DESAFÍO “CONTROLAR TUS ALIMENTOS”",
            "introText":
                "Elige un alimento que deseas controlar mejor; esta semana te sugerimos controlar mejor: GALLETAS",
            "questions": {
              "1": "¿Con qué frecuencia y cuánta cantidad comiste en un día?",
              "2": "¿En qué circunstancias?"
            }
          }
        },
        "task3": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Temps de Selfie!",
            "description":
                "Prenez un selfie rapide, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط سيلفي سريع، نود أن نرى ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del Selfie!",
            "description":
                "¡Tómate un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        }
      },
    },
    "day5": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.quote,
            "title": "Citation du jour!",
            "description": "Nous allons faire cela ensemble :)",
            "text": "Sois humble dans la victoire, et brave devant la peur."
          },
          "en": {
            "type": Tasks.quote,
            "title": "Quote of the day!",
            "description": "We are going to do this together :)",
            "text": "Be humble in victory, and brave in the face of fear."
          },
          "ar": {
            "type": Tasks.quote,
            "title": "اقتباس اليوم!",
            "description": "سوف نفعل ذلك معًا :)",
            "text": "كن متواضعًا في النصر، وشجاعًا أمام الخوف."
          },
          "es": {
            "type": Tasks.quote,
            "title": "¡Cita del día!",
            "description": "¡Vamos a hacer esto juntos :)",
            "text": "Sé humilde en la victoria y valiente ante el miedo."
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.video,
            "title": "Vidéo de motivation",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2Fsem1jour3deficulinaire2.mp4?alt=media&token=89d7b71a-0932-4727-bbd9-3c774a17f037",
            "description": "Nous sommes ce que nous mangeons !"
          },
          "en": {
            "type": Tasks.video,
            "title": "Video Motivation",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/logbookVideos%2Fdefi2ENGLISHsem1jour3.mp4?alt=media&token=fb68c64d-4ad6-4f28-bfdb-b5a5e50fe2df",
            "description": "We are what we eat!"
          },
          "ar": {
            "type": Tasks.video,
            "title": "فيديو تحفيزي",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/logbookVideos%2Fdefi2culinaire2ARABIC.mp4?alt=media&token=14253441-f36c-4598-b6a5-6fbc53abbc57",
            "description": "نحن ما نأكله!"
          },
          "es": {
            "type": Tasks.video,
            "title": "Video de motivación",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/logbookVideos%2FDefi2SPANISHsem1jour3.mp4?alt=media&token=4e576d80-65ff-4a21-b21d-0eb162a27b0d",
            "description": "¡Somos lo que comemos!"
          }
        },
        "task3": {
          "fr": {
            "type": Tasks.questions,
            "title": "ÉVOLUTION PHYSIQUE",
            "description":
                "N'oubliez pas de remplir votre défi évolution physique cette semaine !",
            "introText": "Bienvenue dans votre défi physique :)",
            "questions": {
              "1": "Comment te sens-tu aujourd'hui ?",
              "2": "Où en es-tu dans tes défis ?",
              "3": {
                "q": "Quel repas avez-vous choisi cette semaine ?",
                "a": ["Matin", "Midi", "Soir", "Collation"]
              },
              "4": {
                "q":
                    "De combien de portions avez-vous réduit votre consommation ?",
                "a": ['½', '⅓', '¼']
              },
              "5": {
                "q": "Avez-vous remplacé les jus par de l'eau ou du thé ? ",
                "a": ['Oui', 'Non']
              },
              "6": {
                "q":
                    "Avez-vous trouvé d'autres activités à faire lorsque vous aviez envie de grignoter ?",
                "a": ['Oui', 'Non']
              },
              "7":
                  "Quelles activités avez-vous choisies pour éviter le grignotage ?",
              "8":
                  "Comment vous sentez-vous par rapport à cette semaine de défi ?"
            }
          },
          "en": {
            "type": Tasks.questions,
            "title": "PHYSICAL EVOLUTION",
            "description":
                "Don't forget to fill out your physical evolution challenge this week!",
            "introText": "Welcome to your physical challenge :)",
            "questions": {
              "1": "How do you feel today?",
              "2": "How are you doing with your challenges?",
              "3": {
                "q": "What meal did you choose this week?",
                "a": ["Morning", "Afternoon", "Evening", "Snack"]
              },
              "4": {
                "q": "By how many portions have you reduced your consumption?",
                "a": ['½', '⅓', '¼']
              },
              "5": {
                "q": "Have you replaced juices with water or tea?",
                "a": ['Yes', 'No']
              },
              "6": {
                "q":
                    "Have you found other activities to do when you felt like snacking?",
                "a": ['Yes', 'No']
              },
              "7": "What activities did you choose to avoid snacking?",
              "8": "How do you feel about this week’s challenge?"
            }
          },
          "ar": {
            "type": Tasks.questions,
            "title": "تطور بدني",
            "description":
                "لا تنسَ ملء تحدي التطور البدني الخاص بك هذا الأسبوع!",
            "introText": "مرحبًا بك في تحديك البدني :)",
            "questions": {
              "1": "كيف تشعر اليوم؟",
              "2": "كيف تسير تحدياتك؟",
              "3": {
                "q": "ما الوجبة التي اخترتها هذا الأسبوع؟",
                "a": ["صباحًا", "ظهراً", "مساءً", "وجبة خفيفة"]
              },
              "4": {
                "q": "بكم قطعة قد قمت بتقليل استهلاكك؟",
                "a": ['½', '⅓', '¼']
              },
              "5": {
                "q": "هل استبدلت العصائر بالماء أو الشاي؟",
                "a": ['نعم', 'لا']
              },
              "6": {
                "q":
                    "هل وجدت أنشطة أخرى لتقوم بها عندما كنت ترغب في تناول وجبة خفيفة؟",
                "a": ['نعم', 'لا']
              },
              "7": "ما الأنشطة التي اخترتها لتجنب تناول الوجبات الخفيفة؟",
              "8": "كيف تشعر بشأن تحدي هذا الأسبوع؟"
            }
          },
          "es": {
            "type": Tasks.questions,
            "title": "EVOLUCIÓN FÍSICA",
            "description":
                "¡No olvides completar tu desafío de evolución física esta semana!",
            "introText": "Bienvenido a tu desafío físico :)",
            "questions": {
              "1": "¿Cómo te sientes hoy?",
              "2": "¿Cómo vas con tus desafíos?",
              "3": {
                "q": "¿Qué comida elegiste esta semana?",
                "a": ["Mañana", "Tarde", "Noche", "Snack"]
              },
              "4": {
                "q": "¿En cuántas porciones has reducido tu consumo?",
                "a": ['½', '⅓', '¼']
              },
              "5": {
                "q": "¿Has sustituido los zumos por agua o té?",
                "a": ['Sí', 'No']
              },
              "6": {
                "q":
                    "¿Has encontrado otras actividades para hacer cuando tenías ganas de picar?",
                "a": ['Sí', 'No']
              },
              "7": "¿Qué actividades has elegido para evitar picar?",
              "8": "¿Cómo te sientes respecto a este desafío de la semana?"
            }
          }
        },
        "task4": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Temps de Selfie!",
            "description":
                "Prenez un selfie rapide, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط سيلفي سريع، نود أن نرى ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del Selfie!",
            "description":
                "¡Tómate un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        }
      },
    },
    "day6": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.questions,
            "title": "Défi Communauté Gourmande",
            "description":
                "Cuisinez une recette proposée en découvrant les ingrédients près de chez vous !",
            "introText":
                "Préparez-vous à cuisiner une recette que nous avons spécialement sélectionnée pour vous. Une vraie recette saine et réconfortante, qui pourrait aller du bœuf bourguignon à un sauté de crevettes, en passant par des pâtes carbonara. Nous avons choisi une recette que vous allez adorer apprendre à maîtriser. Une fois la recette reçue, partez à la recherche des ingrédients nécessaires au sein de votre communauté, c'est-à-dire dans un rayon de 5 à 15 km autour de chez vous. Enfilez votre plus belle paire de chaussures de sport ou prenez votre vélo pour explorer votre quartier à travers ce défi. Expliquez aux commerçants que vous rencontrez l'objectif de votre démarche. Cet exercice vous permettra de créer un véritable lien avec votre communauté, de renforcer votre sentiment d'appartenance, et de découvrir des forces insoupçonnées en vous, contribuant à votre épanouissement personnel. Cette semaine, nous vous proposons de réaliser un délicieux Pâtes à la carbonara !",
            "questions": {
              "1": "Quand et comment allez-vous préparer cet événement ?",
              "2":
                  "Qui avez-vous rencontré ? (marchand, épicier, connaissance…)",
              "3":
                  "Qu’avez-vous ressenti en cuisinant le plat, en voyant le résultat ?"
            }
          },
          "en": {
            "type": Tasks.questions,
            "title": "Gourmet Community Challenge",
            "description":
                "Cook a recipe by discovering the ingredients near you!",
            "introText":
                "Get ready to cook a recipe we’ve specially selected for you. A true healthy and comforting recipe, which could range from beef bourguignon to shrimp stir-fry, or even carbonara pasta. We’ve chosen a recipe you’ll love learning to master. Once you receive the recipe, head out to find the necessary ingredients within your community, that is, within a 5 to 15 km radius around your home. Put on your best pair of sports shoes or take your bike to explore your neighborhood through this challenge. Explain to the shopkeepers you meet the objective of your approach. This exercise will help you create a real bond with your community, strengthen your sense of belonging, and discover hidden strengths within you, contributing to your personal growth. This week, we propose making delicious Carbonara Pasta!",
            "questions": {
              "1": "When and how will you prepare this event?",
              "2": "Who did you meet? (merchant, grocer, acquaintance…)",
              "3":
                  "How did you feel while cooking the dish, upon seeing the result?"
            }
          },
          "ar": {
            "type": Tasks.questions,
            "title": "تحدي مجتمع الذواقة",
            "description":
                "اطبخ وصفة مقترحة من خلال اكتشاف المكونات بالقرب منك!",
            "introText":
                "استعد لطهي وصفة اخترناها لك خصيصًا. وصفة صحية ومريحة، قد تتراوح من لحم البقر البورغينيون إلى قريدس مقلي، أو حتى معكرونة كاربونارا. لقد اخترنا وصفة ستحب تعلم إتقانها. بمجرد استلامك للوصفة، اخرج للبحث عن المكونات الضرورية داخل مجتمعك، أي في دائرة من 5 إلى 15 كيلومترًا حول منزلك. ارتدي أفضل حذاء رياضي لديك أو خذ دراجتك لاستكشاف حيّك من خلال هذا التحدي. اشرح للبائعين الذين تقابلهم هدف نهجك. سيساعدك هذا التمرين على إنشاء رابط حقيقي مع مجتمعك، وتعزيز شعورك بالانتماء، واكتشاف قوى غير متوقعة بداخلك، مما يساهم في نموك الشخصي. هذا الأسبوع، نقترح عليك إعداد معكرونة كاربونارا لذيذة!",
            "questions": {
              "1": "متى وكيف ستعد هذا الحدث؟",
              "2": "من قابلت؟ (تاجر، بقال، معرفة...)",
              "3": "ماذا شعرت أثناء طهي الطبق، عند رؤية النتيجة؟"
            }
          },
          "es": {
            "type": Tasks.questions,
            "title": "Desafío Comunidad Gourmet",
            "description":
                "¡Cocina una receta propuesta descubriendo los ingredientes cerca de ti!",
            "introText":
                "Prepárate para cocinar una receta que hemos seleccionado especialmente para ti. Una verdadera receta sana y reconfortante, que puede ir desde un estofado de ternera hasta un salteado de camarones, pasando por pasta carbonara. Hemos elegido una receta que amarás aprender a dominar. Una vez que recibas la receta, sal a buscar los ingredientes necesarios dentro de tu comunidad, es decir, dentro de un radio de 5 a 15 km alrededor de tu hogar. Ponte tus mejores zapatos deportivos o toma tu bicicleta para explorar tu vecindario a través de este desafío. Explica a los comerciantes que encuentres el objetivo de tu enfoque. Este ejercicio te permitirá crear un verdadero vínculo con tu comunidad, fortalecer tu sentido de pertenencia y descubrir fuerzas insospechadas en ti, contribuyendo a tu crecimiento personal. Esta semana, te proponemos hacer unas deliciosas Pasta a la Carbonara!",
            "questions": {
              "1": "¿Cuándo y cómo vas a preparar este evento?",
              "2": "¿A quién conociste? (comerciante, tendero, conocido...)",
              "3": "¿Qué sentiste al cocinar el plato, al ver el resultado?"
            }
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description":
                "Prenez un selfie rapide, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط سيلفي سريع، نود أن نرى ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del Selfie!",
            "description":
                "¡Tómate un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        }
      },
    },
    "day7": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.generatedVideo,
            "title": "Vidéo BestOf de la semaine",
            "description":
                "Profitez des meilleurs moments de cette semaine, en espérant que ça vous plaise !"
          },
          "en": {
            "type": Tasks.generatedVideo,
            "title": "BestOf Video of the Week",
            "description":
                "Enjoy the best moments of this week, hoping you like it!"
          },
          "ar": {
            "type": Tasks.generatedVideo,
            "title": "فيديو أفضل اللحظات للأسبوع",
            "description": "استمتع بأفضل لحظات هذا الأسبوع، ونأمل أن تعجبك!"
          },
          "es": {
            "type": Tasks.generatedVideo,
            "title": "Vídeo BestOf de la semana",
            "description":
                "¡Disfruta de los mejores momentos de esta semana, esperando que te guste!"
          }
        }
      },
    },
  },
  "week3": {
    "day1": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description":
                "Prenez un rapide selfie, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط سيلفي سريع، نود أن نرى ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del selfie!",
            "description":
                "¡Toma un rápido selfie, nos encantaría ver tu sonrisa!"
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.video,
            "title": "Vidéo motivation",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2Fcle3%2Csemaine3%2Cjour1%20Sophie.mp4?alt=media&token=9dae5aeb-9e9e-4863-b933-4d644715c131",
            "description":
                "CLÉ BIEN-ÊTRE 3 : VIVEZ L’INSTANT PRÉSENT : Et si vous décidiez de vivre davantage le moment présent ?"
          },
          "en": {
            "type": Tasks.video,
            "title": "Video motivation",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FCL%C3%89BIENETRE3English.mp4?alt=media&token=fd0df046-8e92-47b1-a60c-073058aec031",
            "description":
                "WELL-BEING KEY 3: LIVE IN THE PRESENT MOMENT: What if you decided to live more in the present moment?"
          },
          "ar": {
            "type": Tasks.video,
            "title": "فيديو تحفيزي",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FCLEBIENETRE3%20ARABIC.mp4?alt=media&token=709bc159-ff7d-432c-b000-f6889c30d2c9",
            "description":
                "مفتاح الرفاهية 3: عيش اللحظة الحالية: ماذا لو قررت أن تعيش أكثر في اللحظة الحالية؟"
          },
          "es": {
            "type": Tasks.video,
            "title": "Vídeo motivacional",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FCL%C3%89BIENETRE3SPANISH.mp4?alt=media&token=2c4c1813-bff1-4e5a-9c4b-1c1dafb7379d",
            "description":
                "CLAVE DE BIENESTAR 3: VIVE EL MOMENTO PRESENTE: ¿Y si decidieras vivir más en el momento presente?"
          }
        }
      },
    },
    "day2": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.quote,
            "title": "Quote of the day!",
            "description": "Nous allons faire cela ensemble :)",
            "text":
                "Nous nous plaignons souvent de ce que nous ne possédons pas, sans réaliser de la richesse et la chance de tout ce que nous possédons déjà."
          },
          "en": {
            "type": Tasks.quote,
            "title": "Quote of the day!",
            "description": "We are going to do this together :)",
            "text":
                "We often complain about what we do not have, without realizing the wealth and luck of everything we already possess."
          },
          "ar": {
            "type": Tasks.quote,
            "title": "اقتباس اليوم!",
            "description": "سنفعل هذا معًا :)",
            "text":
                "غالبًا ما نشكو مما لا نملك، دون أن ندرك الثروة والحظ لكل ما نملكه بالفعل."
          },
          "es": {
            "type": Tasks.quote,
            "title": "¡Cita del día!",
            "description": "¡Vamos a hacer esto juntos :)",
            "text":
                "A menudo nos quejamos de lo que no tenemos, sin darnos cuenta de la riqueza y la suerte de todo lo que ya poseemos."
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.video,
            "title": "Vidéo motivation",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2Fsemaine3jour2defi4prendreconscience.mp4?alt=media&token=5d7dcd5b-b019-4a42-b71f-420262e6229f",
            "description": "N’AYEZ PAS PEUR DU CHANGEMENT !"
          },
          "en": {
            "type": Tasks.video,
            "title": "Video motivation",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/logbookVideos%2Fdefi4ENGLISHprendreconscience.mp4?alt=media&token=a091b2fa-0624-4c1e-af7b-c2bc88e645f6",
            "description": "DON'T BE AFRAID OF CHANGE!"
          },
          "ar": {
            "type": Tasks.video,
            "title": "فيديو تحفيزي",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/logbookVideos%2Fdefi4ARABIC.mp4?alt=media&token=bb3a18d4-474d-4158-af41-a254f0567ac2",
            "description": "لا تخاف من التغيير!"
          },
          "es": {
            "type": Tasks.video,
            "title": "Vídeo motivacional",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/logbookVideos%2Fsemaine3jour2defi4SPANISH.mp4?alt=media&token=15066040-2eda-4b48-8dae-e2aace30066b",
            "description": "¡NO TENGAS MIEDO AL CAMBIO!"
          }
        },
        "task3": {
          "fr": {
            "type": Tasks.questions,
            "title": "Journal de bord",
            "description": "Décrivez vos sentiments",
            "introText":
                "Bienvenue dans votre journal de bord du jour, PRENDRE CONSCIENCE DE NOTRE CHANCE. Le défi émotionnel de cette semaine est ainsi fait pour vous faire conscientiser à cet adage : il est réalisé 3 fois par semaine. Vous devez sélectionner 3 événements qui vous ont fait du bien durant la journée :) Cela peut être un événement vécu ou un événement dont vous avez été témoin et qui vous a fait du bien :)",
            "questions": {
              "1": "Quel est l'événement ?",
              "2": "Où cela s’est-il passé ?",
              "3": "Comment cela vous a-t-il fait sentir ?"
            }
          },
          "en": {
            "type": Tasks.questions,
            "title": "Journal",
            "description": "Describe your feelings",
            "introText":
                "Welcome to your daily journal, AWARENESS OF OUR LUCK. The emotional challenge of this week is designed to make you aware of this saying: it is done 3 times a week. You need to select 3 events that made you feel good during the day :) This can be an event you experienced or an event you witnessed that made you feel good :)",
            "questions": {
              "1": "What is the event?",
              "2": "Where did it happen?",
              "3": "How did it make you feel?"
            }
          },
          "ar": {
            "type": Tasks.questions,
            "title": "دفتر اليومية",
            "description": "صف مشاعرك",
            "introText":
                "مرحبًا بك في دفتر اليومية الخاص بك، الوعي بحظنا. التحدي العاطفي لهذا الأسبوع مصمم لجعلك تدرك هذا القول: يتم القيام به 3 مرات في الأسبوع. تحتاج إلى اختيار 3 أحداث شعرت أنها جيدة خلال اليوم :) يمكن أن يكون حدثًا عشته أو حدثًا شهدته جعلك تشعر بالراحة :)",
            "questions": {
              "1": "ما هو الحدث؟",
              "2": "أين حدث ذلك؟",
              "3": "كيف جعلك ذلك تشعر؟"
            }
          },
          "es": {
            "type": Tasks.questions,
            "title": "Diario",
            "description": "Describe tus sentimientos",
            "introText":
                "Bienvenido a tu diario diario, CONCIENCIA DE NUESTRA SUERTE. El desafío emocional de esta semana está diseñado para que seas consciente de este dicho: se realiza 3 veces por semana. Debes seleccionar 3 eventos que te hicieron sentir bien durante el día :) Esto puede ser un evento que viviste o un evento del que fuiste testigo y que te hizo sentir bien :)",
            "questions": {
              "1": "¿Cuál es el evento?",
              "2": "¿Dónde sucedió?",
              "3": "¿Cómo te hizo sentir?"
            }
          }
        },
        "task4": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description":
                "Prenez un rapide selfie, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط سيلفي سريع، نود أن نرى ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del selfie!",
            "description":
                "¡Toma un rápido selfie, nos encantaría ver tu sonrisa!"
          }
        }
      },
    },
    "day3": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.quote,
            "title": "Défi Physique",
            "description": "PROFITEZ DU SOLEIL !",
            "text":
                "PROFITEZ DU SOLEIL ! Trouvez un endroit dans votre rayon d'habitation à l'extérieur où vous pouvez vous étendre. Installez-vous confortablement et prenez un minimum de 15 minutes de soleil par jour, cela vous permettra de vous sentir bien. Les effets sont saisissants : le soleil a généralement mauvaise presse. Mais profiter d’une belle journée ensoleillée est bon pour le moral … et pour votre provision de vitamine D!"
          },
          "en": {
            "type": Tasks.quote,
            "title": "Physical Challenge",
            "description": "ENJOY THE SUN!",
            "text":
                "ENJOY THE SUN! Find a spot outdoors within your living radius where you can lie down. Get comfortable and take at least 15 minutes of sunlight each day; it will make you feel good. The effects are striking: the sun often gets a bad rap. But enjoying a beautiful sunny day is good for your mood... and your vitamin D supply!"
          },
          "ar": {
            "type": Tasks.quote,
            "title": "تحدي جسدي",
            "description": "استمتع بالشمس!",
            "text":
                "استمتع بالشمس! ابحث عن مكان في الهواء الطلق ضمن نطاق سكنك حيث يمكنك الاستلقاء. استرخِ وخذ على الأقل 15 دقيقة من الشمس كل يوم، فهذا سيساعدك على الشعور بالراحة. الآثار واضحة: الشمس غالبًا ما تُتهم بالتسبب في مشاكل. لكن الاستمتاع بيوم مشمس جميل مفيد لمزاجك ... ومصدر فيتامين د لديك!"
          },
          "es": {
            "type": Tasks.quote,
            "title": "Desafío físico",
            "description": "¡DISFRUTA DEL SOL!",
            "text":
                "¡DISFRUTA DEL SOL! Encuentra un lugar al aire libre dentro de tu radio de vivienda donde puedas acostarte. Ponte cómodo y toma al menos 15 minutos de sol cada día; esto te hará sentir bien. Los efectos son sorprendentes: el sol a menudo tiene mala reputación. Pero disfrutar de un hermoso día soleado es bueno para tu estado de ánimo... y para tu suministro de vitamina D."
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.questions,
            "title": "Journal de bord",
            "description": "Décrivez vos sentiments",
            "introText":
                "Bienvenue dans votre journal de bord du jour, faisons-le ensemble :)",
            "questions": {
              "1": "Quand êtes-vous sorti ?",
              "2": "Combien de temps êtes-vous resté dehors ?",
              "3": "Comment vous êtes-vous senti ?"
            }
          },
          "en": {
            "type": Tasks.questions,
            "title": "Daily Journal",
            "description": "Describe your feelings",
            "introText":
                "Welcome to your daily journal, let's do this together :)",
            "questions": {
              "1": "When did you go outside?",
              "2": "How long did you stay outside?",
              "3": "How did you feel?"
            }
          },
          "ar": {
            "type": Tasks.questions,
            "title": "دفتر اليومية",
            "description": "صف مشاعرك",
            "introText":
                "مرحبًا بك في دفتر اليومية الخاص بك، دعنا نفعل ذلك معًا :)",
            "questions": {
              "1": "متى خرجت؟",
              "2": "كم من الوقت بقيت في الخارج؟",
              "3": "كيف شعرت؟"
            }
          },
          "es": {
            "type": Tasks.questions,
            "title": "Diario",
            "description": "Describe tus sentimientos",
            "introText": "Bienvenido a tu diario diario, hagámoslo juntos :)",
            "questions": {
              "1": "¿Cuándo saliste?",
              "2": "¿Cuánto tiempo estuviste afuera?",
              "3": "¿Cómo te sentiste?"
            }
          }
        },
        "task3": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description":
                "Prenez un rapide selfie, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط سيلفي سريع، نود أن نرى ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del selfie!",
            "description":
                "¡Toma un rápido selfie, nos encantaría ver tu sonrisa!"
          }
        }
      },
    },
    "day4": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.quote,
            "title": "Citation du jour !",
            "description": "Nous allons le faire ensemble :)",
            "text":
                "Fais quelque chose aujourd'hui pour laquelle tu te féliciteras plus tard."
          },
          "en": {
            "type": Tasks.quote,
            "title": "Quote of the day!",
            "description": "We are going to do this together :)",
            "text": "Do something today that you will thank yourself for later."
          },
          "ar": {
            "type": Tasks.quote,
            "title": "اقتباس اليوم!",
            "description": "سنقوم بذلك معًا :)",
            "text": "افعل شيئًا اليوم ستشكر نفسك عليه لاحقًا."
          },
          "es": {
            "type": Tasks.quote,
            "title": "Cita del día!",
            "description": "¡Vamos a hacerlo juntos :)",
            "text": "Haz algo hoy por lo que te felicitarás más tarde."
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.questions,
            "title": "Journal de bord",
            "description":
                "CONTROLE TES ALIMENTS, histoire de jean CONSIGNE DÉFI “CONTRÔLER SES ALIMENTS”",
            "introText":
                "Choisissez un aliment que vous souhaitez mieux contrôler, cette semaine nous vous proposons de mieux contrôler : BONBONS.",
            "questions": {
              "1":
                  "À quelle fréquence et en quelle quantité en avez-vous mangé dans la journée ?",
              "2": "Dans quelles circonstances ?"
            }
          },
          "en": {
            "type": Tasks.questions,
            "title": "Daily Journal",
            "description":
                "CONTROL YOUR FOOD, story of Jean, TASK INSTRUCTION “CONTROL YOUR FOOD”",
            "introText":
                "Choose a food item you want to control better; this week we suggest controlling: CANDIES.",
            "questions": {
              "1":
                  "How often and in what quantity did you eat it during the day?",
              "2": "Under what circumstances?"
            }
          },
          "ar": {
            "type": Tasks.questions,
            "title": "دفتر اليومية",
            "description":
                "تحكم في طعامك، قصة جان، تعليمات المهمة \"تحكم في طعامك\"",
            "introText":
                "اختر طعامًا ترغب في التحكم به بشكل أفضل، هذا الأسبوع نقترح التحكم في: الحلوى.",
            "questions": {
              "1": "كم مرة وكم كمية تناولته خلال اليوم؟",
              "2": "تحت أي ظروف؟"
            }
          },
          "es": {
            "type": Tasks.questions,
            "title": "Diario",
            "description":
                "CONTROLAR TUS ALIMENTOS, historia de Jean, INSTRUCCIÓN DE TAREA “CONTROLAR TUS ALIMENTOS”",
            "introText":
                "Elige un alimento que deseas controlar mejor, esta semana te proponemos controlar: DULCES.",
            "questions": {
              "1":
                  "¿Con qué frecuencia y en qué cantidad lo comiste durante el día?",
              "2": "¿En qué circunstancias?"
            }
          }
        },
        "task3": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description":
                "Prenez un rapide selfie, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط سيلفي سريع، نود أن نرى ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del selfie!",
            "description":
                "¡Toma un rápido selfie, nos encantaría ver tu sonrisa!"
          }
        }
      },
    },
    "day5": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.quote,
            "title": "Citation du jour !",
            "description": "Nous allons le faire ensemble :)",
            "text":
                "Fais-toi confiance, tu sais mieux que quiconque ce qui est bon pour toi."
          },
          "en": {
            "type": Tasks.quote,
            "title": "Quote of the day!",
            "description": "We are going to do this together :)",
            "text":
                "Trust yourself; you know better than anyone what is good for you."
          },
          "ar": {
            "type": Tasks.quote,
            "title": "اقتباس اليوم!",
            "description": "سنقوم بذلك معًا :)",
            "text": "ثق بنفسك، أنت تعرف أفضل من أي شخص آخر ما هو جيد لك."
          },
          "es": {
            "type": Tasks.quote,
            "title": "Cita del día!",
            "description": "¡Vamos a hacerlo juntos :)",
            "text":
                "Confía en ti mismo; sabes mejor que nadie lo que es bueno para ti."
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.questions,
            "title": "Défi Communauté Gourmande",
            "description":
                "Cuisinez une recette proposée en découvrant les ingrédients près de chez vous !",
            "introText":
                "Préparez-vous à cuisiner une recette que nous avons spécialement sélectionnée pour vous. Une vraie recette saine et réconfortante, qui pourrait aller du bœuf bourguignon à un sauté de crevettes, en passant par des pâtes carbonara. Nous avons choisi une recette que vous allez adorer apprendre à maîtriser. Une fois la recette reçue, partez à la recherche des ingrédients nécessaires au sein de votre communauté, c'est-à-dire dans un rayon de 5 à 15 km autour de chez vous. Enfilez votre plus belle paire de chaussures de sport ou prenez votre vélo pour explorer votre quartier à travers ce défi. Expliquez aux commerçants que vous rencontrez l'objectif de votre démarche. Cet exercice vous permettra de créer un véritable lien avec votre communauté, de renforcer votre sentiment d'appartenance, et de découvrir des forces insoupçonnées en vous, contribuant à votre épanouissement personnel. Cette semaine, nous vous proposons de réaliser un délicieux sauté de crevettes !",
            "questions": {
              "1": "Comment te sens-tu aujourd'hui ?",
              "2": "Où en es-tu dans tes défis ?",
              "3": "Quand et comment allez-vous préparer cet événement ?",
              "4":
                  "Qui avez-vous rencontré ? (marchand, épicier, connaissance…) ",
              "5":
                  "Qu’avez-vous ressenti en cuisinant le plat, en voyant le résultat ?"
            }
          },
          "en": {
            "type": Tasks.questions,
            "title": "Gourmet Community Challenge",
            "description":
                "Cook a proposed recipe while discovering ingredients near you!",
            "introText":
                "Get ready to cook a recipe we have specially selected for you. A real healthy and comforting recipe, ranging from beef bourguignon to shrimp stir-fry, including carbonara pasta. We've chosen a recipe you'll love to master. Once you receive the recipe, go out to find the necessary ingredients within your community, that is, within 5 to 15 km of your home. Put on your best pair of sneakers or take your bike to explore your neighborhood through this challenge. Explain to the merchants you meet the purpose of your endeavor. This exercise will help you create a real connection with your community, strengthen your sense of belonging, and discover unsuspected strengths within yourself, contributing to your personal growth. This week, we suggest making a delicious shrimp stir-fry!",
            "questions": {
              "1": "How do you feel today?",
              "2": "How are you doing with your challenges?",
              "3": "When and how will you prepare for this event?",
              "4": "Who did you meet? (merchant, grocer, acquaintance…)",
              "5":
                  "What did you feel while cooking the dish and seeing the result?"
            }
          },
          "ar": {
            "type": Tasks.questions,
            "title": "تحدي المجتمع الذواقة",
            "description": "اطبخ وصفة مقترحة بينما تكتشف المكونات بالقرب منك!",
            "introText":
                "استعد لطهي وصفة اخترناها خصيصًا لك. وصفة صحية ومريحة حقيقية، تتراوح من لحم البقر بوجينيون إلى قريدس مقلي، بما في ذلك باستا كاربونارا. لقد اخترنا وصفة ستحب إتقانها. بمجرد تلقي الوصفة، اخرج للبحث عن المكونات اللازمة ضمن مجتمعك، أي في دائرة شعاعها من 5 إلى 15 كم حول منزلك. ارتدِ أفضل زوج من الأحذية الرياضية أو خذ دراجتك لاستكشاف حيّك من خلال هذا التحدي. اشرح للتجار الذين تلتقي بهم هدف مسعاك. سيساعدك هذا التمرين على إنشاء ارتباط حقيقي مع مجتمعك، وتعزيز شعورك بالانتماء، واكتشاف قوى غير متوقعة بداخلك، مما يسهم في نموك الشخصي. هذا الأسبوع، نقترح عليك صنع قريدس مقلي لذيذ!",
            "questions": {
              "1": "كيف تشعر اليوم؟",
              "2": "كيف تسير تحدياتك؟",
              "3": "متى وكيف ستعد لهذا الحدث؟",
              "4": "من قابلت؟ (تاجر، بقال، معارف…)",
              "5": "ماذا شعرت أثناء طهي الطبق ورؤية النتيجة؟"
            }
          },
          "es": {
            "type": Tasks.questions,
            "title": "Desafío de la Comunidad Gourmet",
            "description":
                "¡Cocina una receta propuesta mientras descubres ingredientes cerca de ti!",
            "introText":
                "Prepárate para cocinar una receta que hemos seleccionado especialmente para ti. Una verdadera receta saludable y reconfortante, que podría ir desde un boeuf bourguignon hasta un salteado de camarones, pasando por pasta carbonara. Hemos elegido una receta que te encantará aprender a dominar. Una vez recibida la receta, sal a buscar los ingredientes necesarios dentro de tu comunidad, es decir, en un radio de 5 a 15 km alrededor de tu casa. Ponte tus mejores zapatillas o toma tu bicicleta para explorar tu vecindario a través de este desafío. Explica a los comerciantes que encuentres el objetivo de tu emprendimiento. Este ejercicio te permitirá crear un verdadero vínculo con tu comunidad, fortalecer tu sentido de pertenencia y descubrir fuerzas insospechadas en ti, contribuyendo a tu crecimiento personal. Esta semana te proponemos realizar un delicioso salteado de camarones!",
            "questions": {
              "1": "¿Cómo te sientes hoy?",
              "2": "¿Cómo vas con tus desafíos?",
              "3": "¿Cuándo y cómo vas a preparar este evento?",
              "4": "¿A quién has encontrado? (comerciante, tendero, conocido…)",
              "5": "¿Qué sentiste al cocinar el plato y ver el resultado?"
            }
          }
        },
        "task3": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description":
                "Prenez un rapide selfie, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط سيلفي سريع، نود أن نرى ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del selfie!",
            "description":
                "¡Toma un rápido selfie, nos encantaría ver tu sonrisa!"
          }
        }
      },
    },
    "day6": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.questions,
            "title": "ÉVOLUTION PHYSIQUE",
            "description":
                "N'oubliez pas de remplir votre défi évolution physique cette semaine !",
            "introText": "Bienvenue dans votre défi physique :)",
            "questions": {
              "1":
                  "Comment se passent tes objectifs de la semaine et en général ?",
              "2": {
                "q": "Quel repas avez-vous choisi cette semaine ?",
                "a": ['Matin', 'Midi', 'Soir', 'Collation']
              },
              "3": {
                "q":
                    "De combien de portions avez-vous réduit votre consommation ?",
                "a": ['½', '⅓', '¼']
              },
              "4": {
                "q": "Avez-vous remplacé les jus par de l'eau ou du thé ?",
                "a": ['Oui', 'Non']
              },
              "5": {
                "q":
                    "Avez-vous trouvé d'autres activités à faire lorsque vous aviez envie de grignoter ?",
                "a": ['Oui', 'Non']
              },
              "6":
                  "Quelles activités avez-vous choisies pour éviter le grignotage ?",
              "7":
                  "Comment vous sentez-vous par rapport à cette semaine de défi ?"
            }
          },
          "en": {
            "type": Tasks.questions,
            "title": "PHYSICAL EVOLUTION",
            "description":
                "Don't forget to fill out your physical evolution challenge this week!",
            "introText": "Welcome to your physical challenge :)",
            "questions": {
              "1": "How are your goals going this week and in general?",
              "2": {
                "q": "Which meal did you choose this week?",
                "a": ['Morning', 'Afternoon', 'Evening', 'Snack']
              },
              "3": {
                "q": "By how many portions have you reduced your intake?",
                "a": ['½', '⅓', '¼']
              },
              "4": {
                "q": "Have you replaced juices with water or tea?",
                "a": ['Yes', 'No']
              },
              "5": {
                "q":
                    "Have you found other activities to do when you felt like snacking?",
                "a": ['Yes', 'No']
              },
              "6": "What activities have you chosen to avoid snacking?",
              "7": "How do you feel about this week’s challenge?"
            }
          },
          "ar": {
            "type": Tasks.questions,
            "title": "تطور بدني",
            "description": "لا تنسَ ملء تحدي تطورك البدني هذا الأسبوع!",
            "introText": "مرحبًا بك في تحديك البدني :)",
            "questions": {
              "1": "كيف تسير أهدافك هذا الأسبوع وبشكل عام؟",
              "2": {
                "q": "أي وجبة اخترت هذا الأسبوع؟",
                "a": ["صباحًا", "ظهراً", "مساءً", "وجبة خفيفة"]
              },
              "3": {
                "q": "كم عدد الحصص التي قللت من استهلاكك؟",
                "a": ['½', '⅓', '¼']
              },
              "4": {
                "q": "هل استبدلت العصائر بالماء أو الشاي؟",
                "a": ['نعم', 'لا']
              },
              "5": {
                "q":
                    "هل وجدت أنشطة أخرى لتقوم بها عندما شعرت برغبة في تناول وجبة خفيفة؟",
                "a": ['نعم', 'لا']
              },
              "6": "ما الأنشطة التي اخترتها لتجنب تناول وجبة خفيفة؟",
              "7": "كيف تشعر تجاه تحدي هذا الأسبوع؟"
            }
          },
          "es": {
            "type": Tasks.questions,
            "title": "EVOLUCIÓN FÍSICA",
            "description":
                "¡No olvides completar tu desafío de evolución física esta semana!",
            "introText": "Bienvenido a tu desafío físico :)",
            "questions": {
              "1": "¿Cómo van tus objetivos esta semana y en general?",
              "2": {
                "q": "¿Qué comida elegiste esta semana?",
                "a": ['Mañana', 'Tarde', 'Noche', 'Snack']
              },
              "3": {
                "q": "¿En cuántas porciones has reducido tu consumo?",
                "a": ['½', '⅓', '¼']
              },
              "4": {
                "q": "¿Has sustituido los jugos por agua o té?",
                "a": ['Sí', 'No']
              },
              "5": {
                "q":
                    "¿Has encontrado otras actividades para hacer cuando tienes ganas de picar?",
                "a": ['Sí', 'No']
              },
              "6": "¿Qué actividades elegiste para evitar picar?",
              "7": "¿Cómo te sientes acerca de este desafío de la semana?"
            }
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description":
                "Prenez un rapide selfie, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط سيلفي سريع، نود أن نرى ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del selfie!",
            "description":
                "¡Toma un rápido selfie, nos encantaría ver tu sonrisa!"
          }
        }
      },
    },
    "day7": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.generatedVideo,
            "title": "Vidéo BestOf de la semaine",
            "description":
                "Profitez des meilleurs moments de cette semaine, en espérant que ça vous plaise !"
          },
          "en": {
            "type": Tasks.generatedVideo,
            "title": "Weekly BestOf Video",
            "description":
                "Enjoy the best moments of this week, hoping you like it!"
          },
          "ar": {
            "type": Tasks.generatedVideo,
            "title": "فيديو أفضل اللحظات من الأسبوع",
            "description": "استمتع بأفضل لحظات هذا الأسبوع، آمل أن يعجبك!"
          },
          "es": {
            "type": Tasks.generatedVideo,
            "title": "Video BestOf de la semana",
            "description":
                "¡Disfruta de los mejores momentos de esta semana, esperando que te guste!"
          }
        }
      },
    },
  },
  "week4": {
    "day1": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description":
                "Prenez un selfie rapide, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط سيلفي سريع، نود أن نرى ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del selfie!",
            "description":
                "¡Toma un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.video,
            "title": "Vidéo motivation",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FCle4Fsemaine4jour1Eric.mp4?alt=media&token=7aada55e-c9be-4942-9043-f1509eac4519",
            "description": "CLE BIEN-ÊTRE 4"
          },
          "en": {
            "type": Tasks.video,
            "title": "Video motivation",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FCle4ENGLISH.mp4?alt=media&token=7410d585-2f23-4a11-85d9-bae07391aa4a",
            "description": "WELLNESS KEY 4"
          },
          "ar": {
            "type": Tasks.video,
            "title": "فيديو تحفيزي",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FCLEBIENETRE4ARABIC.mp4?alt=media&token=ccad4f8e-f7bd-43aa-baae-c0c126dc86df",
            "description": "مفتاح الرفاهية 4"
          },
          "es": {
            "type": Tasks.video,
            "title": "Video motivacional",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FCle4SPANISH.mp4?alt=media&token=9d67476d-fa2e-4260-a4ab-04a2fb83b20a",
            "description": "CLAVE DE BIENESTAR 4"
          }
        }
      },
    },
    "day2": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.questions,
            "title": "Journal de bord",
            "description": "Organiser une soirée",
            "introText":
                "Le défi est d’organiser une soirée ou après-midi avec des amis, collègues, voisins, autour de jeux de connaissance qui ont pour but d'apprendre à mieux vous connaître. Vous pouvez utiliser des jeux de société ou nous vous proposons une liste sympa de jeux animés et amusants :)",
            "questions": {
              "1":
                  "Organisation de l'événement : combien de personnes sont invitées ?",
              "2": "Quelle formule, soirée à thème ou potluck ?"
            }
          },
          "en": {
            "type": Tasks.questions,
            "title": "Board Journal",
            "description": "Organize an evening",
            "introText":
                "The challenge is to organize an evening or afternoon with friends, colleagues, or neighbors, around games aimed at getting to know each other better. You can use board games, or we provide a nice list of fun and animated games :)",
            "questions": {
              "1": "Event organization: how many people are invited?",
              "2": "What format, themed evening or potluck?"
            }
          },
          "ar": {
            "type": Tasks.questions,
            "title": "سجل الأعمال",
            "description": "تنظيم أمسية",
            "introText":
                "التحدي هو تنظيم أمسية أو فترة بعد الظهر مع الأصدقاء أو الزملاء أو الجيران، حول ألعاب المعرفة التي تهدف إلى التعرف على بعضنا البعض بشكل أفضل. يمكنك استخدام ألعاب الطاولة أو نقدم لك قائمة لطيفة من الألعاب المليئة بالمرح :)",
            "questions": {
              "1": "تنظيم الحدث: كم عدد الأشخاص المدعوين؟",
              "2": "ما هي الصيغة، أمسية ذات موضوع أو تجمع؟"
            }
          },
          "es": {
            "type": Tasks.questions,
            "title": "Diario de la Junta",
            "description": "Organizar una velada",
            "introText":
                "El desafío es organizar una velada o tarde con amigos, colegas o vecinos, alrededor de juegos de conocimiento que tienen como objetivo conocerse mejor. Puedes usar juegos de mesa o te ofrecemos una lista divertida de juegos animados y entretenidos :)",
            "questions": {
              "1":
                  "Organización del evento: ¿cuántas personas están invitadas?",
              "2": "¿Qué formato, noche temática o potluck?"
            }
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.quote,
            "title": "Citation du jour!",
            "description": "Nous allons le faire ensemble :)",
            "text":
                "Tous les jours, je choisis consciemment d’améliorer ma santé physique, car c’est le seul corps qui m’est donné et il abrite mon esprit."
          },
          "en": {
            "type": Tasks.quote,
            "title": "Quote of the day!",
            "description": "We are going to do this together :)",
            "text":
                "Every day, I consciously choose to improve my physical health, for it is the only body I am given and it houses my mind."
          },
          "ar": {
            "type": Tasks.quote,
            "title": "اقتباس اليوم!",
            "description": "سنقوم بذلك معًا :)",
            "text":
                "أختار كل يوم بوعي تحسين صحتي الجسدية، لأنها الجسم الوحيد الذي أعطاني إياه وهو يحتضن ذهني."
          },
          "es": {
            "type": Tasks.quote,
            "title": "¡Cita del día!",
            "description": "¡Lo haremos juntos :)",
            "text":
                "Cada día, elijo conscientemente mejorar mi salud física, ya que es el único cuerpo que se me da y alberga mi mente."
          }
        },
        "task3": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description":
                "Prenez un selfie rapide, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط سيلفي سريع، نود أن نرى ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del selfie!",
            "description":
                "¡Toma un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        }
      },
    },
    "day3": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.questions,
            "title": "Journal de bord",
            "description": "Exercice Émotionnel",
            "introText":
                "Notez dans votre journal les sentiments et émotions que chaque personne vous fait ressentir avant, pendant et après l'événement. Recenser dans votre journal les réactions que vous avez eues, et les émotions que vous ressentez, si les amitiés que vous souhaitez créer se sont révélées positives ou négatives, à approfondir ou pas. Le maintien de cette saine habitude de vie, organiser une fois par mois ce genre d'activité avec les personnes que vous désirez connaître ou approfondir les relations, au minimum 4, vous deviendrez rapidement le roi ou la reine de soirées sympas ;)",
            "questions": {
              "1": "Avez-vous été surpris par la réaction d'un de vos amis ?"
            }
          },
          "en": {
            "type": Tasks.questions,
            "title": "Board Journal",
            "description": "Emotional Exercise",
            "introText":
                "Note in your journal the feelings and emotions that each person makes you feel before, during, and after the event. Record in your journal the reactions you've had and the emotions you feel, whether the friendships you wish to create have proven positive or negative, and whether to deepen them or not. Maintaining this healthy habit of life, organizing this kind of activity with the people you want to get to know or deepen relationships with at least 4 times a month, will quickly make you the king or queen of fun evenings ;)",
            "questions": {"1": "Were you surprised by a friend's reaction?"}
          },
          "ar": {
            "type": Tasks.questions,
            "title": "سجل الأعمال",
            "description": "تمرين عاطفي",
            "introText":
                "سجل في مذكرتك المشاعر والعواطف التي يجعلك كل شخص تشعر بها قبل وأثناء وبعد الحدث. سجل في مذكرتك ردود الفعل التي حصلت عليها والمشاعر التي تشعر بها، سواء كانت الصداقات التي ترغب في إنشائها إيجابية أو سلبية، وما إذا كان من المفيد تعميقها أم لا. من خلال الحفاظ على هذه العادة الصحية في الحياة، وتنظيم هذا النوع من الأنشطة مع الأشخاص الذين ترغب في التعرف عليهم أو تعميق العلاقات، على الأقل 4 مرات في الشهر، ستصبح بسرعة ملك أو ملكة الأمسيات الممتعة ;)",
            "questions": {"1": "هل فوجئت برد فعل أحد أصدقائك؟"}
          },
          "es": {
            "type": Tasks.questions,
            "title": "Diario de la Junta",
            "description": "Ejercicio Emocional",
            "introText":
                "Anota en tu diario los sentimientos y emociones que cada persona te hace sentir antes, durante y después del evento. Registra en tu diario las reacciones que has tenido y las emociones que sientes, si las amistades que deseas crear han resultado ser positivas o negativas, y si vale la pena profundizarlas o no. Manteniendo este hábito saludable de vida, organizar este tipo de actividades con las personas que deseas conocer o profundizar las relaciones, al menos 4 veces al mes, ¡rápidamente te convertirás en el rey o la reina de las noches divertidas ;)",
            "questions": {"1": "¿Te sorprendió la reacción de un amigo?"}
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description":
                "Prenez un selfie rapide, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط سيلفي سريع، نود أن نرى ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del selfie!",
            "description":
                "¡Toma un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        }
      },
    },
    "day4": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.reading,
            "title": "Jeux : Le portrait",
            "description": "Let's have some fun :D",
            "goal":
                "Permettre à chacun des participants du groupe de mieux se connaître. Créer, à l’intérieur du groupe, une atmosphère de camaraderie nécessaire à la formation.",
            "materials":
                "Une feuille d'énoncé par participant. Un crayon par participant.",
            "text":
                "Faire asseoir le groupe en cercle. Distribuer une feuille d'énoncé par participant. Inviter les participants à choisir sur la feuille trois énoncés (ajuster le nombre d’énoncés en fonction du nombre de participants) et à y répondre de façon individuelle. Chacun doit ensuite partager, à tour de rôle, les trois énoncés retenus au reste du groupe en expliquant ses choix. Feuille d’énoncés Consigne : Choisir trois énoncés parmi cette liste proposée. Si j’étais… un lieu, un arbre, une fleur, un animal, une œuvre d’art, une personnalité connue, un événement historique, une œuvre d’art, un tableau, un livre, un objet, un entrepreneur, sur le marché du travail. Compléter les trois phrases suivantes afin d’expliquer vos énoncés. 1. Si j’étais _______________________________ je serais ______________________________ parce que _____________________________________________________________________. 2. Si j’étais _______________________________ je serais ______________________________ parce que _____________________________________________________________________. 3. Si j’étais _______________________________ je serais ______________________________ parce que ____________________________________________________________________."
          },
          "en": {
            "type": Tasks.reading,
            "title": "Games: The Portrait",
            "description": "Let's have some fun :D",
            "goal":
                "Allow each participant in the group to get to know each other better. Create an atmosphere of camaraderie necessary for bonding within the group.",
            "materials":
                "One statement sheet per participant. One pencil per participant.",
            "text":
                "Have the group sit in a circle. Distribute a statement sheet to each participant. Invite participants to choose three statements from the sheet (adjust the number of statements based on the number of participants) and answer them individually. Each person should then share their three chosen statements with the rest of the group, explaining their choices. Statement Sheet Instructions: Choose three statements from this proposed list. If I were... a place, a tree, a flower, an animal, a work of art, a famous person, a historical event, a painting, a book, an object, an entrepreneur, in the job market. Complete the following three sentences to explain your statements. 1. If I were _______________________________ I would be ______________________________ because _____________________________________________________________________. 2. If I were _______________________________ I would be ______________________________ because _____________________________________________________________________. 3. If I were _______________________________ I would be ______________________________ because ____________________________________________________________________."
          },
          "ar": {
            "type": Tasks.reading,
            "title": "الألعاب: الصورة",
            "description": "لنستمتع قليلاً :D",
            "goal":
                "السماح لكل مشارك في المجموعة بالتعرف على بعضهم بشكل أفضل. خلق جو من الألفة اللازمة لتكوين الروابط داخل المجموعة.",
            "materials": "ورقة بيان لكل مشارك. قلم رصاص لكل مشارك.",
            "text":
                "اجعل المجموعة تجلس في دائرة. وزع ورقة بيان لكل مشارك. ادعُ المشاركين لاختيار ثلاثة بيانات من الورقة (قم بتعديل عدد البيانات بناءً على عدد المشاركين) والرد عليها بشكل فردي. يجب على كل شخص بعد ذلك مشاركة البيانات الثلاثة التي اختارها مع بقية المجموعة، موضحًا اختياراته. ورقة البيان التعليمات: اختر ثلاثة بيانات من هذه القائمة المقترحة. إذا كنت... مكانًا، شجرة، زهرة، حيوان، عمل فني، شخصية مشهورة، حدث تاريخي، لوحة، كتاب، جسم، رائد أعمال، في سوق العمل. أكمل الجمل الثلاث التالية لشرح بياناتك. 1. إذا كنت _______________________________ سأكون ______________________________ لأن _____________________________________________________________________. 2. إذا كنت _______________________________ سأكون ______________________________ لأن _____________________________________________________________________. 3. إذا كنت _______________________________ سأكون ______________________________ لأن ____________________________________________________________________."
          },
          "es": {
            "type": Tasks.reading,
            "title": "Juegos: El retrato",
            "description": "¡Divirtámonos :D!",
            "goal":
                "Permitir que cada uno de los participantes del grupo se conozca mejor. Crear, dentro del grupo, una atmósfera de camaradería necesaria para el vínculo.",
            "materials":
                "Una hoja de declaraciones por participante. Un lápiz por participante.",
            "text":
                "Hacer que el grupo se siente en círculo. Distribuir una hoja de declaraciones a cada participante. Invitar a los participantes a elegir tres declaraciones de la hoja (ajustar el número de declaraciones según el número de participantes) y a responderlas de forma individual. Cada uno debe compartir, por turno, las tres declaraciones elegidas con el resto del grupo, explicando sus elecciones. Hoja de declaraciones Instrucciones: Elegir tres declaraciones de esta lista propuesta. Si yo fuera... un lugar, un árbol, una flor, un animal, una obra de arte, una persona famosa, un evento histórico, una pintura, un libro, un objeto, un emprendedor, en el mercado laboral. Completa las tres frases siguientes para explicar tus declaraciones. 1. Si yo fuera _______________________________ sería ______________________________ porque _____________________________________________________________________. 2. Si yo fuera _______________________________ sería ______________________________ porque _____________________________________________________________________. 3. Si yo fuera _______________________________ sería ______________________________ porque ____________________________________________________________________."
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.reading,
            "title": "Jeux : Le maître du ballon",
            "description": "Let's have some fun :D",
            "goal":
                "Le but du jeu est d'être la dernière personne dont le ballon n'est pas crevé, avec une durée de 5 à 10 minutes.",
            "materials":
                "Ficelle et suffisamment de ballons pour en donner un à chaque personne.",
            "text":
                "Demandez aux participants de gonfler un ballon et d’y attacher le bout d’une ficelle (d’environ 60 cm). Puis, demandez‐leur d’attacher l’autre extrémité de la ficelle autour de leur cheville. Les joueurs doivent ensuite courir et tenter de crever le ballon des autres en sautant dessus. La dernière personne dont le ballon est intact gagne! Pour faire durer le plaisir, le jeu peut se dérouler en plusieurs manches."
          },
          "en": {
            "type": Tasks.reading,
            "title": "Games: The Ball Master",
            "description": "Let's have some fun :D",
            "goal":
                "The goal of the game is to be the last person whose balloon is not popped, lasting 5 to 10 minutes.",
            "materials":
                "String and enough balloons to give one to each person.",
            "text":
                "Ask participants to inflate a balloon and tie one end of a string (about 60 cm) to it. Then, have them tie the other end of the string around their ankle. Players must then run and try to pop each other's balloons by jumping on them. The last person with an intact balloon wins! To keep the fun going, the game can be played in several rounds."
          },
          "ar": {
            "type": Tasks.reading,
            "title": "الألعاب: سيد الكرة",
            "description": "لنستمتع قليلاً :D",
            "goal":
                "هدف اللعبة هو أن تكون آخر شخص لم تنفجر بالونته، وذلك لمدة 5 إلى 10 دقائق.",
            "materials": "خيط وعدد كافٍ من البالونات لإعطاء واحدة لكل شخص.",
            "text":
                "اطلب من المشاركين نفخ بالون وربط أحد طرفي الخيط (حوالي 60 سم) به. ثم اجعلهم يربطون الطرف الآخر من الخيط حول كاحلهم. يجب على اللاعبين بعد ذلك الركض ومحاولة فرقعة بالونات الآخرين عن طريق القفز عليها. آخر شخص يحتفظ بالبالون سليمًا هو الفائز! للاستمرار في المتعة، يمكن لعب اللعبة في عدة جولات."
          },
          "es": {
            "type": Tasks.reading,
            "title": "Juegos: El maestro del globo",
            "description": "¡Divirtámonos :D!",
            "goal":
                "El objetivo del juego es ser la última persona cuyo globo no se ha pinchado, con una duración de 5 a 10 minutos.",
            "materials":
                "Cuerda y suficientes globos para dar uno a cada persona.",
            "text":
                "Pide a los participantes que inflen un globo y ata un extremo de una cuerda (de aproximadamente 60 cm) a él. Luego, pídeles que ataquen el otro extremo de la cuerda alrededor de su tobillo. Los jugadores deben correr e intentar pinchar los globos de los demás saltando sobre ellos. ¡La última persona cuyo globo permanezca intacto gana! Para prolongar la diversión, el juego puede jugarse en varias rondas."
          }
        },
        "task3": {
          "fr": {
            "type": Tasks.reading,
            "title": "Jeux : Moi",
            "description": "Let's have some fun :D",
            "goal":
                "Les participants devinent ce que les dates et les mots révèlent sur vous.",
            "materials":
                "des dates et mots qui vous caractérisent, écrits au tableau ou sur une feuille.",
            "text":
                "Les participants devinent en remue-méninges ce que les dates et les mots écrits leur apprennent sur vous, par exemple : bleu (ma couleur préférée), Egypte (j’ai habité en Egypte), Danser (j’aime danser), Patrice (mon frère), 11 (mon adresse), Épinards (je déteste), Ferrari (je voudrais une Ferrari), Vélo (j’ai un vélo), 44 (année de naissance de ma mère), etc. Ensuite, les participants peuvent écrire des mots les caractérisant pour que les autres les devinent."
          },
          "en": {
            "type": Tasks.reading,
            "title": "Games: Me",
            "description": "Let's have some fun :D",
            "goal":
                "Participants guess what the dates and words reveal about you.",
            "materials":
                "Dates and words that characterize you, written on a board or a sheet.",
            "text":
                "Participants brainstorm what the written dates and words tell them about you, for example: blue (my favorite color), Egypt (I lived in Egypt), Dance (I love to dance), Patrice (my brother), 11 (my address), Spinach (I hate), Ferrari (I want a Ferrari), Bike (I have a bike), 44 (my mother’s birth year), etc. Then, participants can write words that characterize them for others to guess."
          },
          "ar": {
            "type": Tasks.reading,
            "title": "الألعاب: أنا",
            "description": "لنستمتع قليلاً :D",
            "goal": "يخمن المشاركون ما تكشفه التواريخ والكلمات عنك.",
            "materials":
                "التواريخ والكلمات التي تميزك، مكتوبة على السبورة أو على ورقة.",
            "text":
                "يخمن المشاركون ما تخبرهم به التواريخ والكلمات المكتوبة عنك، على سبيل المثال: الأزرق (لونك المفضل)، مصر (لقد عشت في مصر)، الرقص (أحب الرقص)، باتريس (أخي)، 11 (عنواني)، السبانخ (أكرهها)، فيراري (أريد فيراري)، دراجة (لدي دراجة)، 44 (سنة ميلاد أمي)، إلخ. ثم يمكن للمشاركين كتابة كلمات تميزهم ليخمنها الآخرون."
          },
          "es": {
            "type": Tasks.reading,
            "title": "Juegos: Yo",
            "description": "¡Divirtámonos :D!",
            "goal":
                "Los participantes adivinan lo que las fechas y las palabras revelan sobre ti.",
            "materials":
                "Fechas y palabras que te caracterizan, escritas en una pizarra o en una hoja.",
            "text":
                "Los participantes adivinan en una lluvia de ideas lo que las fechas y las palabras escritas les enseñan sobre ti, por ejemplo: azul (mi color favorito), Egipto (viví en Egipto), bailar (me encanta bailar), Patrice (mi hermano), 11 (mi dirección), espinacas (las odio), Ferrari (quiero una Ferrari), bicicleta (tengo una bicicleta), 44 (año de nacimiento de mi madre), etc. Luego, los participantes pueden escribir palabras que los caracterizan para que los demás las adivinen."
          }
        },
        "task4": {
          "fr": {
            "type": Tasks.questions,
            "title": "Journal de bord",
            "description":
                "CONTROLE TES ALIMENTS , histoire de Jean CONSIGNE DÉFI “ CONTRÔLER SES ALIMENTS”",
            "introText":
                "Choisissez un aliment que vous souhaitez mieux contrôler, cette semaine nous vous proposons de mieux contrôler : BONBONS",
            "questions": {
              "1":
                  "À quelle fréquence et en quelle quantité en avez-vous mangé dans la journée ?",
              "2": "Dans quelles circonstances ?",
              "3":
                  "Qu'en penses-tu ? Écris tes impressions dans ton journal de bord."
            }
          },
          "en": {
            "type": Tasks.questions,
            "title": "Board Journal",
            "description":
                "CONTROL YOUR FOOD, Jean's Story CHALLENGE INSTRUCTION “CONTROL YOUR FOOD”",
            "introText":
                "Choose a food item you want to monitor better; this week we suggest focusing on: CANDY.",
            "questions": {
              "1":
                  "How often and in what quantity did you eat it during the day?",
              "2": "Under what circumstances?",
              "3":
                  "What do you think about it? Write your impressions in your journal."
            }
          },
          "ar": {
            "type": Tasks.questions,
            "title": "سجل الأعمال",
            "description":
                "تحكم في طعامك، قصة جان التعليمات التحدي “تحكم في طعامك”",
            "introText":
                "اختر نوع الطعام الذي تريد مراقبته بشكل أفضل، هذا الأسبوع نقترح التركيز على: الحلوى.",
            "questions": {
              "1": "كم مرة وبكم كمية أكلته خلال اليوم؟",
              "2": "في أي ظروف؟",
              "3": "ما رأيك في ذلك؟ اكتب انطباعاتك في سجل الأعمال."
            }
          },
          "es": {
            "type": Tasks.questions,
            "title": "Diario de la Junta",
            "description":
                "CONTROLAR TU COMIDA, la historia de Jean INSTRUCCIÓN DEL DESAFÍO “CONTROLAR TU COMIDA”",
            "introText":
                "Elige un alimento que quieras controlar mejor; esta semana te sugerimos centrarte en: DULCES.",
            "questions": {
              "1":
                  "¿Con qué frecuencia y en qué cantidad lo comiste durante el día?",
              "2": "¿En qué circunstancias?",
              "3":
                  "¿Qué piensas al respecto? Escribe tus impresiones en tu diario."
            }
          }
        },
        "task5": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description":
                "Prenez un selfie rapide, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط سيلفي سريع، نود أن نرى ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del selfie!",
            "description":
                "¡Toma un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        }
      },
    },
    "day5": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.quote,
            "title": "Citation du jour !",
            "description": "Nous allons faire cela ensemble :)",
            "text":
                "Des choses extraordinaires se produisent quand on s'éloigne de la négativité"
          },
          "en": {
            "type": Tasks.quote,
            "title": "Quote of the Day!",
            "description": "We are going to do this together :)",
            "text":
                "Extraordinary things happen when we distance ourselves from negativity."
          },
          "ar": {
            "type": Tasks.quote,
            "title": "اقتباس اليوم!",
            "description": "سوف نقوم بذلك معًا :)",
            "text": "تحدث أشياء استثنائية عندما نبتعد عن السلبية."
          },
          "es": {
            "type": Tasks.quote,
            "title": "¡Cita del día!",
            "description": "¡Vamos a hacer esto juntos :)",
            "text":
                "Se producen cosas extraordinarias cuando nos alejamos de la negatividad."
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.questions,
            "title": "Défi Communauté Gourmande",
            "description":
                "Cuisinez une recette proposée en découvrant les ingrédients près de chez vous !",
            "introText":
                "Préparez-vous à cuisiner une recette que nous avons spécialement sélectionnée pour vous. Une vraie recette saine et réconfortante, qui pourrait aller du bœuf bourguignon à un sauté de crevettes, en passant par des pâtes carbonara. Nous avons choisi une recette que vous allez adorer apprendre à maîtriser. Une fois la recette reçue, partez à la recherche des ingrédients nécessaires au sein de votre communauté, c'est-à-dire dans un rayon de 5 à 15 km autour de chez vous. Enfilez votre plus belle paire de chaussures de sport ou prenez votre vélo pour explorer votre quartier à travers ce défi. Expliquez aux commerçants que vous rencontrez l'objectif de votre démarche. Cet exercice vous permettra de créer un véritable lien avec votre communauté, de renforcer votre sentiment d'appartenance, et de découvrir des forces insoupçonnées en vous, contribuant à votre épanouissement personnel. Cette semaine, nous vous proposons de réaliser un délicieux Rôti de Porc, pomme et érable !",
            "questions": {
              "1": "Comment te sens-tu aujourd'hui ?",
              "2": "Où en es-tu dans tes défis ?",
              "3": "Quand et comment allez-vous préparer cet événement ?",
              "4":
                  "Qui avez-vous rencontré ? (marchand, épicier, connaissance…)",
              "5":
                  "Qu’avez-vous ressenti en cuisinant le plat, en voyant le résultat ?"
            }
          },
          "en": {
            "type": Tasks.questions,
            "title": "Gourmet Community Challenge",
            "description":
                "Cook a proposed recipe by discovering ingredients near you!",
            "introText":
                "Get ready to cook a recipe we've specially selected for you. A truly healthy and comforting recipe, ranging from beef bourguignon to shrimp stir-fry, to carbonara pasta. We have chosen a recipe you will love to master. Once you receive the recipe, set out to find the necessary ingredients within your community, that is, within a radius of 5 to 15 km around your home. Put on your best pair of sports shoes or take your bike to explore your neighborhood through this challenge. Explain to the merchants you meet your objective. This exercise will allow you to create a genuine bond with your community, strengthen your sense of belonging, and discover untapped strengths within yourself, contributing to your personal growth. This week, we suggest you prepare a delicious Pork Roast with apple and maple!",
            "questions": {
              "1": "How do you feel today?",
              "2": "Where are you in your challenges?",
              "3": "When and how will you prepare this event?",
              "4": "Who did you meet? (merchant, grocer, acquaintance…)",
              "5":
                  "What did you feel while cooking the dish, upon seeing the result?"
            }
          },
          "ar": {
            "type": Tasks.questions,
            "title": "تحدي المجتمع الذواقة",
            "description":
                "قم بطهي وصفة مقترحة من خلال اكتشاف المكونات بالقرب منك!",
            "introText":
                "استعد لطهي وصفة اخترناها لك خصيصًا. وصفة صحية ومريحة حقًا، قد تتراوح من لحم البقر بورغينيون إلى قلاية الجمبري، مرورًا بمكرونة كاربونارا. لقد اخترنا وصفة ستحب تعلم إتقانها. بمجرد استلامك للوصفة، انطلق للبحث عن المكونات الضرورية داخل مجتمعك، أي ضمن دائرة نصف قطرها 5 إلى 15 كيلومترًا حول منزلك. ارتدِ أفضل حذاء رياضي لديك أو خذ دراجتك لاستكشاف حيّك من خلال هذا التحدي. اشرح للتجار الذين تقابلهم الهدف من مسعاك. ستساعدك هذه التمرين في بناء رابط حقيقي مع مجتمعك، وتعزيز شعورك بالانتماء، واكتشاف قوى غير متوقعة بداخلك، مما يساهم في نموك الشخصي. هذا الأسبوع، نقترح عليك تحضير لحم خنزير مشوي لذيذ مع التفاح والقيقب!",
            "questions": {
              "1": "كيف تشعر اليوم؟",
              "2": "أين وصلت في تحدياتك؟",
              "3": "متى وكيف ستقوم بتحضير هذا الحدث؟",
              "4": "من قابلت؟ (تاجر، بائع، معرفة…)",
              "5": "ماذا شعرت أثناء طهي الطبق، عند رؤية النتيجة؟"
            }
          },
          "es": {
            "type": Tasks.questions,
            "title": "Desafío Comunidad Gourmet",
            "description":
                "¡Cocina una receta propuesta descubriendo ingredientes cerca de ti!",
            "introText":
                "Prepárate para cocinar una receta que hemos seleccionado especialmente para ti. Una verdadera receta saludable y reconfortante, que puede ir desde un beef bourguignon hasta un salteado de camarones, pasando por pasta carbonara. Hemos elegido una receta que te encantará aprender a dominar. Una vez que recibas la receta, sal a buscar los ingredientes necesarios en tu comunidad, es decir, dentro de un radio de 5 a 15 km alrededor de tu casa. Ponte tu mejor par de zapatos deportivos o toma tu bicicleta para explorar tu vecindario a través de este desafío. Explica a los comerciantes que encuentres el objetivo de tu actividad. Este ejercicio te permitirá crear un vínculo genuino con tu comunidad, fortalecer tu sentido de pertenencia y descubrir fuerzas insospechadas en ti, contribuyendo a tu desarrollo personal. Esta semana, te proponemos realizar un delicioso asado de cerdo con manzana y jarabe de arce.",
            "questions": {
              "1": "¿Cómo te sientes hoy?",
              "2": "¿Dónde estás en tus desafíos?",
              "3": "¿Cuándo y cómo vas a preparar este evento?",
              "4": "¿A quién has conocido? (comerciante, tendero, conocido…)",
              "5": "¿Qué sentiste al cocinar el plato, al ver el resultado?"
            }
          }
        },
        "task3": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description":
                "Prenez un selfie rapide, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط سيلفي سريع، نود أن نرى ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del selfie!",
            "description":
                "¡Toma un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        }
      },
    },
    "day6": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.quote,
            "title": "Citation du jour !",
            "description": "Nous allons faire cela ensemble :)",
            "text": "Entoure toi de gens qui te font évoluer"
          },
          "en": {
            "type": Tasks.quote,
            "title": "Quote of the Day!",
            "description": "We are going to do this together :)",
            "text": "Surround yourself with people who help you grow."
          },
          "ar": {
            "type": Tasks.quote,
            "title": "اقتباس اليوم!",
            "description": "سوف نقوم بذلك معًا :)",
            "text": "احط نفسك بأشخاص يساعدونك على التطور."
          },
          "es": {
            "type": Tasks.quote,
            "title": "¡Cita del día!",
            "description": "¡Vamos a hacer esto juntos :)",
            "text": "Rodéate de personas que te hagan crecer."
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.questions,
            "title": "ÉVOLUTION PHYSIQUE",
            "description":
                "N'oubliez pas de remplir votre défi évolution physique cette semaine !",
            "introText": "Bienvenue dans votre défi physique :)",
            "questions": {
              "1":
                  "Comment se passent tes objectifs de la semaine et en général ?",
              "2": {
                "q": "Quel repas avez-vous choisi cette semaine ?",
                "a": ["Matin", "Midi", "Soir", "Collation"]
              },
              "3": {
                "q":
                    "De combien de portions avez-vous réduit votre consommation ?",
                "a": ['½', '⅓', '¼']
              },
              "4": {
                "q": "Avez-vous remplacé les jus par de l'eau ou du thé ? ",
                "a": ['Oui', 'Non']
              },
              "5": {
                "q":
                    "Avez-vous trouvé d'autres activités à faire lorsque vous aviez envie de grignoter ?",
                "a": ['Oui', 'Non']
              },
              "6":
                  "Quelles activités avez-vous choisies pour éviter le grignotage ?",
              "7":
                  "Comment vous sentez-vous par rapport à cette semaine de défi ?"
            }
          },
          "en": {
            "type": Tasks.questions,
            "title": "PHYSICAL EVOLUTION",
            "description":
                "Don't forget to complete your physical evolution challenge this week!",
            "introText": "Welcome to your physical challenge :)",
            "questions": {
              "1": "How are your goals going this week and in general?",
              "2": {
                "q": "Which meal did you choose this week?",
                "a": ["Morning", "Afternoon", "Evening", "Snack"]
              },
              "3": {
                "q": "By how many servings have you reduced your intake?",
                "a": ['½', '⅓', '¼']
              },
              "4": {
                "q": "Have you replaced juices with water or tea?",
                "a": ['Yes', 'No']
              },
              "5": {
                "q":
                    "Have you found other activities to do when you felt like snacking?",
                "a": ['Yes', 'No']
              },
              "6": "What activities did you choose to avoid snacking?",
              "7": "How do you feel about this week of the challenge?"
            }
          },
          "ar": {
            "type": Tasks.questions,
            "title": "التطور البدني",
            "description": "لا تنسى ملء تحدي التطور البدني هذا الأسبوع!",
            "introText": "مرحبًا بك في تحديك البدني :)",
            "questions": {
              "1": "كيف تسير أهدافك هذا الأسبوع وعامةً؟",
              "2": {
                "q": "أي وجبة اخترت هذا الأسبوع؟",
                "a": ["صباحًا", "ظهراً", "مساءً", "وجبة خفيفة"]
              },
              "3": {
                "q": "كم عدد الحصص التي قللت استهلاكك منها؟",
                "a": ['½', '⅓', '¼']
              },
              "4": {
                "q": "هل استبدلت العصائر بالماء أو الشاي؟",
                "a": ['نعم', 'لا']
              },
              "5": {
                "q":
                    "هل وجدت أنشطة أخرى تفعلها عندما تشعر بالرغبة في تناول وجبة خفيفة؟",
                "a": ['نعم', 'لا']
              },
              "6": "ما الأنشطة التي اخترتها لتجنب تناول الوجبات الخفيفة؟",
              "7": "كيف تشعر حيال أسبوع التحدي هذا؟"
            }
          },
          "es": {
            "type": Tasks.questions,
            "title": "EVOLUCIÓN FÍSICA",
            "description":
                "¡No olvides completar tu desafío de evolución física esta semana!",
            "introText": "Bienvenido a tu desafío físico :)",
            "questions": {
              "1": "¿Cómo van tus objetivos esta semana y en general?",
              "2": {
                "q": "¿Qué comida elegiste esta semana?",
                "a": ["Mañana", "Tarde", "Noche", "Snack"]
              },
              "3": {
                "q": "¿Cuántas porciones has reducido de tu consumo?",
                "a": ['½', '⅓', '¼']
              },
              "4": {
                "q": "¿Has reemplazado los jugos por agua o té?",
                "a": ['Sí', 'No']
              },
              "5": {
                "q":
                    "¿Has encontrado otras actividades para hacer cuando tenías ganas de picar?",
                "a": ['Sí', 'No']
              },
              "6": "¿Qué actividades elegiste para evitar picar?",
              "7": "¿Cómo te sientes respecto a esta semana de desafío?"
            }
          }
        },
        "task3": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description":
                "Prenez un selfie rapide, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط سيلفي سريع، نود أن نرى ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del selfie!",
            "description":
                "¡Toma un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        }
      },
    },
    "day7": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.generatedVideo,
            "title": "Vidéo BestOf de la semaine",
            "description":
                "Profitez des meilleurs moments de cette semaine, en espérant que ça vous plaise !"
          },
          "en": {
            "type": Tasks.generatedVideo,
            "title": "Weekly Best Of Video",
            "description":
                "Enjoy the best moments of this week, hoping you like it!"
          },
          "ar": {
            "type": Tasks.generatedVideo,
            "title": "فيديو أفضل لحظات الأسبوع",
            "description": "استمتع بأفضل لحظات هذا الأسبوع، نأمل أن تعجبك!"
          },
          "es": {
            "type": Tasks.generatedVideo,
            "title": "Video Lo Mejor de la Semana",
            "description":
                "¡Disfruta de los mejores momentos de esta semana, esperando que te guste!"
          }
        }
      },
    },
  },
  "week5": {
    "day1": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description":
                "Prenez un rapide selfie, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط سيلفي سريع، نود أن نرى ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del Selfie!",
            "description":
                "¡Toma un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.video,
            "title": "Vidéo motivation",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2Fcle5Semaine5-jour1_acceptersesimper.mp4?alt=media&token=586526bf-5d28-4775-ba7f-0e0532622aa1",
            "description": "CLE BIEN-ÊTRE 5"
          },
          "en": {
            "type": Tasks.video,
            "title": "Video motivation",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2Fcle5ENGLISH.mp4?alt=media&token=45373d52-7eea-4b3c-ad30-39a8594be7ed",
            "description": "WELLNESS KEY 5"
          },
          "ar": {
            "type": Tasks.video,
            "title": "فيديو تحفيزي",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2Fcle5ARABIC.mp4?alt=media&token=197249d7-9026-4b73-8161-fa1077d039ec",
            "description": "مفتاح الرفاهية 5"
          },
          "es": {
            "type": Tasks.video,
            "title": "Video motivacional",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2Fcle5SPANISH.mp4?alt=media&token=0dad4bb6-5d6c-4569-babc-ab3dbc30567e",
            "description": "CLAVE DE BIENESTAR 5"
          }
        }
      },
    },
    "day2": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.video,
            "title": "Vidéo motivation",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2Fdefi6Oserrevercestos.mp4?alt=media&token=e6c631ef-b76c-4bea-a328-2125bdcf8200",
            "description": "N’AYEZ PAS PEUR DU CHANGEMENT !"
          },
          "en": {
            "type": Tasks.video,
            "title": "Video motivation",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2Fdefi6OserreverENGLISH.mp4?alt=media&token=a936993f-145b-4cd6-b1bf-ff748d9a9313",
            "description": "DON'T BE AFRAID OF CHANGE!"
          },
          "ar": {
            "type": Tasks.video,
            "title": "فيديو تحفيزي",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2Fdefi6ARABIC.mp4?alt=media&token=77db15de-ebf2-4215-b120-141dc5af9425",
            "description": "لا تخاف من التغيير!"
          },
          "es": {
            "type": Tasks.video,
            "title": "Video motivacional",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2Fdefi6OserreverSPANISH.mp4?alt=media&token=2087fe2e-18db-4ff9-8a25-8a50775f2fd6",
            "description": "¡NO TENGAS MIEDO AL CAMBIO!"
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.questions,
            "title": "Journal de bord",
            "description": "Oser rêver, c'est oser vivre !",
            "introText":
                "Bienvenue dans votre journal de bord du jour, durant votre cheminement, prenez le temps de rêver et de constater l'évolution de ces rêveries et trouver les moyens pour les réaliser en complétant les questions.",
            "questions": {
              "1": "Quelles sont les réalisations que vous souhaitez vivre ?",
              "2": "Est-ce que c'est réalisable ?",
              "3":
                  "Quels sont les moyens que vous vous donnez pour réaliser ces rêves ?"
            }
          },
          "en": {
            "type": Tasks.questions,
            "title": "Board Journal",
            "description": "Dare to dream, it's daring to live!",
            "introText":
                "Welcome to your daily journal, during your journey, take time to dream and observe the evolution of these dreams, and find ways to achieve them by completing the questions.",
            "questions": {
              "1": "What are the achievements you wish to experience?",
              "2": "Is it achievable?",
              "3": "What means do you give yourself to realize these dreams?"
            }
          },
          "ar": {
            "type": Tasks.questions,
            "title": "دفتر اليوميات",
            "description": "الجرأة على الحلم هي الجرأة على الحياة!",
            "introText":
                "مرحبًا بك في دفتر يومياتك اليوم، خلال رحلتك، خذ وقتك في الحلم وملاحظة تطور هذه الأحلام، وابحث عن طرق لتحقيقها من خلال إكمال الأسئلة.",
            "questions": {
              "1": "ما الإنجازات التي ترغب في تجربتها؟",
              "2": "هل هي قابلة للتحقيق؟",
              "3": "ما الوسائل التي تقدمها لتحقيق هذه الأحلام؟"
            }
          },
          "es": {
            "type": Tasks.questions,
            "title": "Diario de a bordo",
            "description": "¡Atreverse a soñar es atreverse a vivir!",
            "introText":
                "Bienvenido a tu diario del día, durante tu camino, tómate el tiempo para soñar y observar la evolución de esos sueños y encontrar las maneras de realizarlos completando las preguntas.",
            "questions": {
              "1": "¿Cuáles son los logros que deseas vivir?",
              "2": "¿Es realizable?",
              "3": "¿Qué medios te das para realizar estos sueños?"
            }
          }
        },
        "task3": {
          "fr": {
            "type": Tasks.quote,
            "title": "Quote of the day!",
            "description": "We are going to do this together :)",
            "text":
                "Lorsqu'on traite tous les êtres vivants avec respect, ils nous respectent en retour."
          },
          "en": {
            "type": Tasks.quote,
            "title": "Quote of the day!",
            "description": "We are going to do this together :)",
            "text":
                "When we treat all living beings with respect, they respect us in return."
          },
          "ar": {
            "type": Tasks.quote,
            "title": "اقتباس اليوم!",
            "description": "سنتعاون في هذا :)",
            "text":
                "عندما نتعامل مع جميع الكائنات الحية باحترام، فإنها تحترمنا بدورها."
          },
          "es": {
            "type": Tasks.quote,
            "title": "Cita del día!",
            "description": "Lo haremos juntos :)",
            "text":
                "Cuando tratamos a todos los seres vivos con respeto, ellos nos respetan a cambio."
          }
        },
        "task4": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description":
                "Prenez un rapide selfie, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط سيلفي سريع، نود أن نرى ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del Selfie!",
            "description":
                "¡Toma un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        }
      },
    },
    "day3": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.questions,
            "title": "Journal de bord",
            "description": "Décrivez vos sentiments",
            "introText":
                "Bienvenue dans votre journal de bord du jour. Faites quelque chose que vous n'avez jamais osé faire ! Un saut en parachute, du bungee ou, plus simplement, allez à la piscine, faites du jardinage, de la poterie. Maintenant que vous commencez à élargir votre cercle social, invitez une personne à vous accompagner dans cette aventure.",
            "questions": {
              "1": "Comment te sens-tu aujourd'hui ?",
              "2": "Où en es-tu dans tes défis ?"
            }
          },
          "en": {
            "type": Tasks.questions,
            "title": "Board Journal",
            "description": "Describe your feelings",
            "introText":
                "Welcome to your daily journal. Do something you’ve never dared to do! A parachute jump, bungee jumping, or something simpler like going to the pool, gardening, or pottery. Now that you’re starting to expand your social circle, invite someone to join you on this adventure.",
            "questions": {
              "1": "How are you feeling today?",
              "2": "Where are you in your challenges?"
            }
          },
          "ar": {
            "type": Tasks.questions,
            "title": "دفتر اليوميات",
            "description": "صف مشاعرك",
            "introText":
                "مرحبًا بك في دفتر يومياتك اليوم. قم بشيء لم تجرؤ أبدًا على القيام به! قفزة بالمظلة، أو قفز بالحبال أو، بشكل أبسط، اذهب إلى المسبح، أو زرع، أو صنع الفخار. الآن بعد أن بدأت في توسيع دائرتك الاجتماعية، ادعُ شخصًا للانضمام إليك في هذه المغامرة.",
            "questions": {"1": "كيف تشعر اليوم؟", "2": "أين أنت في تحدياتك؟"}
          },
          "es": {
            "type": Tasks.questions,
            "title": "Diario de a bordo",
            "description": "Describe tus sentimientos",
            "introText":
                "Bienvenido a tu diario del día. ¡Haz algo que nunca te has atrevido a hacer! Un salto en paracaídas, puenting o algo más simple como ir a la piscina, jardinería o cerámica. Ahora que comienzas a ampliar tu círculo social, invita a alguien a acompañarte en esta aventura.",
            "questions": {
              "1": "¿Cómo te sientes hoy?",
              "2": "¿Dónde estás en tus desafíos?"
            }
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.quote,
            "title": "Quote of the day!",
            "description": "We are going to do this together :)",
            "text":
                "Il est préférable d'avancer lentement que de rester immobile."
          },
          "en": {
            "type": Tasks.quote,
            "title": "Quote of the day!",
            "description": "We are going to do this together :)",
            "text": "It is better to move slowly than to remain still."
          },
          "ar": {
            "type": Tasks.quote,
            "title": "اقتباس اليوم!",
            "description": "سنتعاون في هذا :)",
            "text": "من الأفضل أن تتقدم ببطء من أن تبقى ثابتًا."
          },
          "es": {
            "type": Tasks.quote,
            "title": "Cita del día!",
            "description": "Lo haremos juntos :)",
            "text": "Es mejor avanzar lentamente que quedarse inmóvil."
          }
        },
        "task3": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description":
                "Prenez un rapide selfie, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط سيلفي سريع، نود أن نرى ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del Selfie!",
            "description":
                "¡Toma un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        }
      },
    },
    "day4": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.quote,
            "title": "Quote of the day!",
            "description": "We are going to do this together :)",
            "text":
                "Ce ne sont pas toutes les tempêtes qui viennent perturber ta vie. Certaines sont là pour dégager ton chemin."
          },
          "en": {
            "type": Tasks.quote,
            "title": "Quote of the day!",
            "description": "We are going to do this together :)",
            "text":
                "Not all storms come to disrupt your life. Some are here to clear your path."
          },
          "ar": {
            "type": Tasks.quote,
            "title": "اقتباس اليوم!",
            "description": "سنتعاون في هذا :)",
            "text": "ليست كل العواصف تأتي لتعطيل حياتك. بعضها هنا لتصفية طريقك."
          },
          "es": {
            "type": Tasks.quote,
            "title": "Cita del día!",
            "description": "¡Lo haremos juntos :)",
            "text":
                "No todas las tormentas vienen a interrumpir tu vida. Algunas están aquí para despejar tu camino."
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.questions,
            "title": "Journal de bord",
            "description":
                "CONTROL YOUR FOODS, Jean's story CHALLENGE INSTRUCTION “CONTROL YOUR FOODS”",
            "introText":
                "Choisissez un aliment que vous souhaitez mieux contrôler. Cette semaine, nous vous proposons de mieux contrôler : PRODUITS TRANSFORMÉS.",
            "questions": {
              "1":
                  "À quelle fréquence et en quelle quantité en avez-vous mangé dans la journée ?",
              "2": "Dans quelles circonstances ?"
            }
          },
          "en": {
            "type": Tasks.questions,
            "title": "Board Journal",
            "description":
                "CONTROL YOUR FOODS, Jean's story CHALLENGE INSTRUCTION “CONTROL YOUR FOODS”",
            "introText":
                "Choose a food you want to better control. This week we suggest controlling: PROCESSED FOODS.",
            "questions": {
              "1": "How often and how much did you eat in a day?",
              "2": "Under what circumstances?"
            }
          },
          "ar": {
            "type": Tasks.questions,
            "title": "دفتر اليوميات",
            "description":
                "تحكم في طعامك، قصة جان تعليمات التحدي “تحكم في طعامك”",
            "introText":
                "اختر طعامًا ترغب في التحكم فيه بشكل أفضل. هذا الأسبوع نقترح التحكم في: الأطعمة المعالجة.",
            "questions": {
              "1": "كم مرة وكم كمية تناولت في اليوم؟",
              "2": "تحت أي ظروف؟"
            }
          },
          "es": {
            "type": Tasks.questions,
            "title": "Diario de a bordo",
            "description":
                "CONTROLAR TUS ALIMENTOS, la historia de Jean INSTRUCCIÓN DEL DESAFÍO “CONTROLAR TUS ALIMENTOS”",
            "introText":
                "Elige un alimento que desees controlar mejor. Esta semana te sugerimos controlar: ALIMENTOS PROCESADOS.",
            "questions": {
              "1":
                  "¿Con qué frecuencia y cuánta cantidad has comido en el día?",
              "2": "¿En qué circunstancias?"
            }
          }
        },
        "task3": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description":
                "Prenez un rapide selfie, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط سيلفي سريع، نود أن نرى ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del Selfie!",
            "description":
                "¡Toma un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        }
      },
    },
    "day5": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.quote,
            "title": "Quote of the day!",
            "description": "We are going to do this together :)",
            "text": "Aimes-toi suffisamment pour adopter un mode de vie sain."
          },
          "en": {
            "type": Tasks.quote,
            "title": "Quote of the day!",
            "description": "We are going to do this together :)",
            "text": "Love yourself enough to adopt a healthy lifestyle."
          },
          "ar": {
            "type": Tasks.quote,
            "title": "اقتباس اليوم!",
            "description": "سنتعاون في هذا :)",
            "text": "أحب نفسك بما يكفي لتبني أسلوب حياة صحي."
          },
          "es": {
            "type": Tasks.quote,
            "title": "Cita del día!",
            "description": "¡Lo haremos juntos :)",
            "text":
                "Ámate lo suficiente como para adoptar un estilo de vida saludable."
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.questions,
            "title": "Défi Communauté Gourmande",
            "description":
                "Cuisinez une recette proposée en découvrant les ingrédients près de chez vous !",
            "introText":
                "Préparez-vous à cuisiner une recette que nous avons spécialement sélectionnée pour vous. Une vraie recette saine et réconfortante, qui pourrait aller du bœuf bourguignon à un sauté de crevettes, en passant par des pâtes carbonara. Nous avons choisi une recette que vous allez adorer apprendre à maîtriser. Une fois la recette reçue, partez à la recherche des ingrédients nécessaires au sein de votre communauté, c'est-à-dire dans un rayon de 5 à 15 km autour de chez vous. Enfilez votre plus belle paire de chaussures de sport ou prenez votre vélo pour explorer votre quartier à travers ce défi. Expliquez aux commerçants que vous rencontrez l'objectif de votre démarche. Cet exercice vous permettra de créer un véritable lien avec votre communauté, de renforcer votre sentiment d'appartenance, et de découvrir des forces insoupçonnées en vous, contribuant à votre épanouissement personnel. Cette semaine, nous vous proposons de réaliser un délicieux Bœuf Bourguignon !",
            "questions": {
              "1": "Comment te sens-tu aujourd'hui ?",
              "2": "Où en es-tu dans tes défis ?",
              "3": "Quand et comment allez-vous préparer cet événement ?",
              "4":
                  "Qui avez-vous rencontré ? (marchand, épicier, connaissance…)",
              "5":
                  "Qu’avez-vous ressenti en cuisinant le plat, en voyant le résultat ?"
            }
          },
          "en": {
            "type": Tasks.questions,
            "title": "Gourmet Community Challenge",
            "description":
                "Cook a proposed recipe while discovering ingredients near you!",
            "introText":
                "Get ready to cook a recipe we have specially selected for you. A truly healthy and comforting recipe, ranging from beef bourguignon to shrimp stir-fry, or carbonara pasta. We've chosen a recipe that you're going to love mastering. Once you receive the recipe, go out to find the necessary ingredients within your community, meaning within a 5 to 15 km radius around you. Put on your best pair of sports shoes or take your bike to explore your neighborhood through this challenge. Explain to the merchants you meet the purpose of your approach. This exercise will help you create a real connection with your community, strengthen your sense of belonging, and discover unsuspected strengths within you, contributing to your personal development. This week, we propose to make a delicious Beef Bourguignon!",
            "questions": {
              "1": "How do you feel today?",
              "2": "Where are you in your challenges?",
              "3": "When and how will you prepare this event?",
              "4": "Who did you meet? (merchant, grocer, acquaintance…)",
              "5":
                  "What did you feel while cooking the dish, seeing the result?"
            }
          },
          "ar": {
            "type": Tasks.questions,
            "title": "تحدي المجتمع الذواقة",
            "description": "اطبخ وصفة مقترحة أثناء اكتشاف المكونات بالقرب منك!",
            "introText":
                "استعد لطهي وصفة اخترناها خصيصًا لك. وصفة صحية ومريحة حقًا، تتراوح من لحم البقر البورغينيون إلى قلاية الجمبري، أو معكرونة الكاربونارا. لقد اخترنا وصفة ستحب تعلم إتقانها. بمجرد استلامك الوصفة، اخرج للبحث عن المكونات اللازمة داخل مجتمعك، أي في دائرة قطرها 5 إلى 15 كم حولك. ارتدِ أفضل زوج من أحذية الرياضة لديك أو خذ دراجتك لاستكشاف حيّك من خلال هذا التحدي. اشرح للتجار الذين تلتقي بهم الهدف من نهجك. سيساعدك هذا التمرين في إنشاء ارتباط حقيقي مع مجتمعك، وتعزيز شعورك بالانتماء، واكتشاف قوى غير متوقعة بداخلك، مما يساهم في تطورك الشخصي. هذا الأسبوع، نقترح عليك إعداد لحم البقر البورغينيون اللذيذ!",
            "questions": {
              "1": "كيف تشعر اليوم؟",
              "2": "أين أنت في تحدياتك؟",
              "3": "متى وكيف ستعد لهذا الحدث؟",
              "4": "من قابلت؟ (تاجر، بقال، معرفة…)",
              "5": "ماذا شعرت أثناء طهي الطبق، عند رؤية النتيجة؟"
            }
          },
          "es": {
            "type": Tasks.questions,
            "title": "Desafío Comunidad Gourmet",
            "description":
                "¡Cocina una receta propuesta mientras descubres ingredientes cerca de ti!",
            "introText":
                "Prepárate para cocinar una receta que hemos seleccionado especialmente para ti. Una receta realmente saludable y reconfortante, que podría ir desde el buey bourguignon hasta un salteado de camarones, pasando por pasta carbonara. Hemos elegido una receta que vas a amar aprender a dominar. Una vez que recibas la receta, sal a buscar los ingredientes necesarios dentro de tu comunidad, es decir, en un radio de 5 a 15 km alrededor de ti. Ponte tus mejores zapatillas deportivas o toma tu bicicleta para explorar tu vecindario a través de este desafío. Explica a los comerciantes que encuentres el objetivo de tu enfoque. Este ejercicio te ayudará a crear un vínculo real con tu comunidad, fortalecer tu sentido de pertenencia y descubrir fuerzas insospechadas dentro de ti, contribuyendo a tu desarrollo personal. Esta semana te proponemos realizar un delicioso Buey Bourguignon!",
            "questions": {
              "1": "¿Cómo te sientes hoy?",
              "2": "¿En qué parte estás de tus desafíos?",
              "3": "¿Cuándo y cómo vas a preparar este evento?",
              "4": "¿A quién conociste? (comerciante, tendero, conocido...)",
              "5": "¿Qué sentiste al cocinar el plato, al ver el resultado?"
            }
          }
        },
        "task3": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description":
                "Prenez un rapide selfie, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط سيلفي سريع، نود أن نرى ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del Selfie!",
            "description":
                "¡Toma un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        }
      },
    },
    "day6": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.questions,
            "title": "ÉVOLUTION PHYSIQUE",
            "description":
                "N'oubliez pas de remplir votre défi évolution physique cette semaine !",
            "introText": "Bienvenue dans votre défi physique :)",
            "questions": {
              "1":
                  "Comment se passent tes objectifs de la semaine et en général ?",
              "2": {
                "q": "Quel repas avez-vous choisi cette semaine ?",
                "a": ["Matin", "Midi", "Soir", "Collation"]
              },
              "3": {
                "q":
                    "De combien de portions avez-vous réduit votre consommation ?",
                "a": ["½", "⅓", "¼"]
              },
              "4": {
                "q": "Avez-vous remplacé les jus par de l'eau ou du thé ?",
                "a": ["Oui", "Non"]
              },
              "5": {
                "q":
                    "Avez-vous trouvé d'autres activités à faire lorsque vous aviez envie de grignoter ?",
                "a": ["Oui", "Non"]
              },
              "6":
                  "Quelles activités avez-vous choisies pour éviter le grignotage ?"
            }
          },
          "en": {
            "type": Tasks.questions,
            "title": "PHYSICAL EVOLUTION",
            "description":
                "Don't forget to complete your physical evolution challenge this week!",
            "introText": "Welcome to your physical challenge :)",
            "questions": {
              "1": "How are your goals for the week and in general going?",
              "2": {
                "q": "Which meal did you choose this week?",
                "a": ["Morning", "Afternoon", "Evening", "Snack"]
              },
              "3": {
                "q": "By how many portions have you reduced your intake?",
                "a": ["½", "⅓", "¼"]
              },
              "4": {
                "q": "Did you replace juices with water or tea?",
                "a": ["Yes", "No"]
              },
              "5": {
                "q":
                    "Did you find other activities to do when you wanted to snack?",
                "a": ["Yes", "No"]
              },
              "6": "What activities did you choose to avoid snacking?"
            }
          },
          "ar": {
            "type": Tasks.questions,
            "title": "التطور البدني",
            "description": "لا تنسَ إكمال تحدي تطورك البدني هذا الأسبوع!",
            "introText": "مرحبًا بك في تحديك البدني :)",
            "questions": {
              "1": "كيف تسير أهدافك لهذا الأسبوع وعامةً؟",
              "2": {
                "q": "أي وجبة اخترت هذا الأسبوع؟",
                "a": ["صباحًا", "ظهراً", "مساءً", "وجبة خفيفة"]
              },
              "3": {
                "q": "بكم حصة قمت بتقليل استهلاكك؟",
                "a": ["½", "⅓", "¼"]
              },
              "4": {
                "q": "هل استبدلت العصائر بالماء أو الشاي؟",
                "a": ["نعم", "لا"]
              },
              "5": {
                "q":
                    "هل وجدت أنشطة أخرى تقوم بها عندما تشعر بالرغبة في تناول وجبة خفيفة؟",
                "a": ["نعم", "لا"]
              },
              "6": "ما الأنشطة التي اخترتها لتجنب تناول الوجبات الخفيفة؟"
            }
          },
          "es": {
            "type": Tasks.questions,
            "title": "EVOLUCIÓN FÍSICA",
            "description":
                "¡No olvides completar tu desafío de evolución física esta semana!",
            "introText": "Bienvenido a tu desafío físico :)",
            "questions": {
              "1": "¿Cómo van tus objetivos de la semana y en general?",
              "2": {
                "q": "¿Qué comida elegiste esta semana?",
                "a": ["Mañana", "Tarde", "Noche", "Snack"]
              },
              "3": {
                "q": "¿En cuántas porciones has reducido tu consumo?",
                "a": ["½", "⅓", "¼"]
              },
              "4": {
                "q": "¿Has reemplazado los jugos por agua o té?",
                "a": ["Sí", "No"]
              },
              "5": {
                "q":
                    "¿Has encontrado otras actividades para hacer cuando tenías ganas de picar?",
                "a": ["Sí", "No"]
              },
              "6": "¿Qué actividades elegiste para evitar picar?"
            }
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description":
                "Prenez un rapide selfie, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط سيلفي سريع، نود أن نرى ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del Selfie!",
            "description":
                "¡Toma un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        }
      },
    },
    "day7": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.generatedVideo,
            "title": "Vidéo BestOf de la semaine",
            "description":
                "Profitez des meilleurs moments de cette semaine, en espérant que ça vous plaise !"
          },
          "en": {
            "type": Tasks.generatedVideo,
            "title": "BestOf Video of the Week",
            "description":
                "Enjoy the best moments of this week, hoping you like it!"
          },
          "ar": {
            "type": Tasks.generatedVideo,
            "title": "فيديو أفضل لحظات الأسبوع",
            "description": "استمتع بأفضل لحظات هذا الأسبوع، نأمل أن يعجبك!"
          },
          "es": {
            "type": Tasks.generatedVideo,
            "title": "Video Resumen de la Semana",
            "description":
                "¡Disfruta de los mejores momentos de esta semana, esperamos que te guste!"
          }
        }
      },
    },
  },
  "week6": {
    "day1": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description":
                "Prenez un selfie rapide, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط سيلفي سريع، نود رؤية ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del Selfie!",
            "description":
                "¡Tómate un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.video,
            "title": "Vidéo motivation",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FCl6semaine6jour1soph.mp4?alt=media&token=fe7552cb-6047-42ff-a30e-1060ac2c96f6",
            "description": "CLE BIEN-ÊTRE 6"
          },
          "en": {
            "type": Tasks.video,
            "title": "Motivational Video",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FCLE6ENGLISH.mp4?alt=media&token=0b10362d-dc6a-4368-8e71-3dca7207d560",
            "description": "WELLNESS KEY 6"
          },
          "ar": {
            "type": Tasks.video,
            "title": "فيديو تحفيزي",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FCLE6ARABIC.mp4?alt=media&token=2a19cd8a-7973-4a20-b773-60329dd63db8",
            "description": "مفتاح العافية 6"
          },
          "es": {
            "type": Tasks.video,
            "title": "Video Motivacional",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FCLE6SPANISH.mp4?alt=media&token=bf4f1ec0-d833-4b99-9e0b-4c18291e5518",
            "description": "CLAVE DE BIENESTAR 6"
          }
        },
        "task3": {
          "fr": {
            "type": Tasks.questions,
            "title": "Journal de bord",
            "description": "Décrivez vos sentiments",
            "introText":
                "Le soutien de vos proches est primordial dans la réussite de votre démarche. Au mieux, ce défi resserra les liens avec vos proches, (ce que je souhaite ardemment) au pire vous allez découvrir les vrais visages de ce qui vous aimes et vous soutiennent de ceux qui ne vous soutiennent pas. À ce stade, vous devriez ressentir quelques changements significatifs dans la perception de vous-même. Il est temps de révéler votre nouveau vous, et votre nouveau chemin à vos proches !",
            "questions": {"1": "Que pensez-vous du soutien de votre famille ?"}
          },
          "en": {
            "type": Tasks.questions,
            "title": "Board Journal",
            "description": "Describe your feelings",
            "introText":
                "The support of your loved ones is crucial to your success. At best, this challenge will strengthen your bonds with them (which I truly hope for); at worst, you'll discover the true faces of those who love and support you versus those who don't. At this stage, you should feel some significant changes in how you perceive yourself. It's time to reveal your new self and your new path to your loved ones!",
            "questions": {"1": "What do you think about your family's support?"}
          },
          "ar": {
            "type": Tasks.questions,
            "title": "دفتر اليومية",
            "description": "صف مشاعرك",
            "introText":
                "دعم أحبائك ضروري لنجاحك. في أفضل الأحوال، ستعزز هذه التحديات روابطك معهم (وهذا ما آمله بشدة)، وفي أسوأ الأحوال، ستكتشف الوجوه الحقيقية لأولئك الذين يحبونك ويدعمونك مقابل أولئك الذين لا يدعمونك. في هذه المرحلة، يجب أن تشعر ببعض التغييرات الكبيرة في كيفية رؤيتك لنفسك. حان الوقت للكشف عن نفسك الجديدة وطريقك الجديد لأحبائك!",
            "questions": {"1": "ماذا تعتقد في دعم عائلتك؟"}
          },
          "es": {
            "type": Tasks.questions,
            "title": "Diario",
            "description": "Describe tus sentimientos",
            "introText":
                "El apoyo de tus seres queridos es fundamental para tu éxito. En el mejor de los casos, este desafío fortalecerá tus lazos con ellos (lo que realmente espero); en el peor de los casos, descubrirás las verdaderas caras de quienes te aman y te apoyan frente a quienes no lo hacen. En esta etapa, deberías sentir algunos cambios significativos en cómo te percibes a ti mismo. ¡Es hora de revelar tu nuevo yo y tu nuevo camino a tus seres queridos!",
            "questions": {"1": "¿Qué piensas sobre el apoyo de tu familia?"}
          }
        }
      },
    },
    "day2": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.questions,
            "title": "Journal de board",
            "description": "Décrivez vos sentiments",
            "introText":
                "Vous devez inviter vos proches à un repas que vous aurez préparé, en demandant des conseils à vos épiciers pour satisfaire tous vos invités ; profitez-en pour proposer un jeu et vous affirmer, en refaisant les jeux de la semaine 4 ou en consultant la liste à venir, et préparez cet événement en choisissant le repas et les activités pour la soirée.",
            "questions": {
              "1": "Comment te sens-tu aujourd'hui ?",
              "2": "Où en es-tu dans tes défis ?"
            }
          },
          "en": {
            "type": Tasks.questions,
            "title": "Board Journal",
            "description": "Describe your feelings",
            "introText":
                "You need to invite your loved ones to a meal you will prepare, asking your grocers for advice to satisfy all your guests; take the opportunity to propose a game and assert yourself by repeating the games from week 4 or consulting the upcoming list, and prepare this event by choosing the meal and activities for the evening.",
            "questions": {
              "1": "How do you feel today?",
              "2": "Where are you in your challenges?"
            }
          },
          "ar": {
            "type": Tasks.questions,
            "title": "دفتر اليومية",
            "description": "صف مشاعرك",
            "introText":
                "يجب أن تدعو أحبائك إلى وجبة ستعدها، واطلب نصائح من بقالينك لإرضاء جميع ضيوفك؛ اغتنم الفرصة لاقتراح لعبة والتأكيد على نفسك، من خلال إعادة الألعاب من الأسبوع 4 أو من خلال مراجعة القائمة القادمة، وتحضير هذا الحدث من خلال اختيار الوجبة والأنشطة للمساء.",
            "questions": {"1": "كيف تشعر اليوم؟", "2": "أين أنت في تحدياتك؟"}
          },
          "es": {
            "type": Tasks.questions,
            "title": "Diario",
            "description": "Describe tus sentimientos",
            "introText":
                "Debes invitar a tus seres queridos a una comida que prepararás, pidiendo consejos a tus tenderos para satisfacer a todos tus invitados; aprovecha para proponer un juego y afirmarte, repitiendo los juegos de la semana 4 o consultando la lista que vendrá, y prepara este evento eligiendo la comida y las actividades para la noche.",
            "questions": {
              "1": "¿Cómo te sientes hoy?",
              "2": "¿Dónde estás en tus desafíos?"
            }
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description":
                "Prenez un selfie rapide, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط سيلفي سريع، نود رؤية ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del Selfie!",
            "description":
                "¡Tómate un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        }
      },
    },
    "day3": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.questions,
            "title": "Journal de board",
            "description": "Décrivez vos sentiments",
            "introText": "Révèle ton parcours à tes proches, comment tu te sentais avant et comment tu te sens maintenant. L'idée n'est pas de régler des comptes avec les membres de la famille qui t'ont fait sentir mal, mais plutôt de partager où tu en es arrivé et de demander leur soutien pour avancer. Note dans ton journal les réactions que tu as reçues et les émotions que tu ressens. Note 3 qualités que tu reconnais en toi-même ou que les autres reconnaissent en toi. Dis chaque qualité à haute voix (je suis quelqu'un qui écoute bien, accueillant, généreux, loyal...). Note 3 défauts. Sois honnête avec toi-même. Ne te juge pas, car ce n'est pas le sujet. Que peux-tu faire pour les atténuer ? Parle-en avec tes proches ; ils révéleront leur bienveillance. Maintenir cette habitude de vie saine implique d'organiser ce genre d'activité avec les membres de la famille une fois par mois, avec ceux avec qui tu souhaites maintenir et approfondir les relations.",
            "questions": {
              "1": "Comment te sens-tu aujourd'hui ?",
              "2": "Où en es-tu dans tes défis ?",
              "3": "Avez-vous été surpris par la réaction d'un de vos proches ?"
            }
          },
          "en": {
            "type": Tasks.questions,
            "title": "Board Journal",
            "description": "Describe your feelings",
            "introText": "Reveal your journey to your loved ones, how you felt before and how you feel now. The idea is not to settle scores with family members who have made you feel bad, but rather to share where you have come and to ask for their support going forward. Record in your journal the reactions you received and the emotions you feel. Note 3 qualities you recognize in yourself or that others recognize in you. Say each quality out loud (I am someone who listens well, welcoming, generous, loyal...). Note 3 faults. Be honest with yourself. Do not judge yourself as it is not the subject. What can you do to mitigate them? Talk about it with your loved ones; they will reveal their kindness. Maintaining this healthy lifestyle habit involves organizing this kind of activity with family members once a month, with whom you wish to maintain and deepen relationships.",
            "questions": {
              "1": "How do you feel today?",
              "2": "Where are you in your challenges?",
              "3": "Were you surprised by a loved one's reaction?"
            }
          },
          "ar": {
            "type": Tasks.questions,
            "title": "دفتر اليومية",
            "description": "صف مشاعرك",
            "introText": "اكشف رحلتك لأحبائك، كيف كنت تشعر قبل وكيف تشعر الآن. الفكرة ليست تصفية الحسابات مع أفراد العائلة الذين جعلوك تشعر بالسوء، بل مشاركة ما وصلت إليه وطلب دعمهم للمضي قدمًا. دوّن في دفتر يومياتك ردود الفعل التي تلقيتها والمشاعر التي شعرت بها. لاحظ 3 صفات تعترف بها في نفسك أو يعترف بها الآخرون فيك. قل كل صفة بصوت عالٍ (أنا شخص يستمع جيدًا، مضياف، كريم، مخلص...). لاحظ 3 عيوب. كن صادقًا مع نفسك. لا تحكم على نفسك لأن هذا ليس الموضوع. ماذا يمكنك أن تفعل للتخفيف منها؟ تحدث عن ذلك مع أحبائك؛ سيظهرون لطفهم. الحفاظ على هذا العادة الصحية يتضمن تنظيم هذا النوع من النشاط مع أفراد العائلة مرة واحدة في الشهر، مع أولئك الذين ترغب في الحفاظ على العلاقات معهم وتعميقها.",
            "questions": {
              "1": "كيف تشعر اليوم؟",
              "2": "أين أنت في تحدياتك؟",
              "3": "هل فوجئت برد فعل أحد أحبائك؟"
            }
          },
          "es": {
            "type": Tasks.questions,
            "title": "Diario",
            "description": "Describe tus sentimientos",
            "introText": "Revela tu viaje a tus seres queridos, cómo te sentías antes y cómo te sientes ahora. La idea no es ajustar cuentas con los miembros de la familia que te han hecho sentir mal, sino más bien compartir hasta dónde has llegado y pedir su apoyo para seguir adelante. Anota en tu diario las reacciones que recibiste y las emociones que sentiste. Nota 3 cualidades que reconoces en ti mismo o que otros reconocen en ti. Di cada cualidad en voz alta (soy alguien que escucha bien, acogedor, generoso, leal...). Nota 3 defectos. Sé honesto contigo mismo. No te juzgues, ya que ese no es el tema. ¿Qué puedes hacer para mitigarlos? Habla de ello con tus seres queridos; ellos revelarán su bondad. Mantener este hábito de estilo de vida saludable implica organizar este tipo de actividad con los miembros de la familia una vez al mes, con quienes deseas mantener y profundizar las relaciones.",
            "questions": {
              "1": "¿Cómo te sientes hoy?",
              "2": "¿Dónde estás en tus desafíos?",
              "3": "¿Te sorprendió la reacción de algún ser querido?"
            }
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description":
                "Prenez un selfie rapide, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط سيلفي سريع، نود رؤية ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del Selfie!",
            "description":
                "¡Tómate un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        }
      },
    },
    "day4": {
      "tasks": {
        "task1": {
          "fr": {
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
          "en": {
            "type": Tasks.reading,
            "title": "Games: The Dictionary King",
            "description": "Let's have some fun :D",
            "goal":
                "Guess the definitions of unknown words to become the king of the dictionary.",
            "materials":
                "Each player has a piece of paper and a pen, and a dictionary is needed to look up the words.",
            "text":
                "One player chooses an unknown word from the dictionary and reads it to the group; each player writes the word and proposes a definition, while the player with the dictionary notes the correct definition. The papers are then mixed, and the definitions are read aloud. Players vote for the definition they think is correct, and points are awarded based on the votes. The game continues until one player accumulates the most points and becomes the king of the dictionary. If you have teens: https://www.jeuxetcompagnie.fr/mafia-jeu-role-les-ados/"
          },
          "ar": {
            "type": Tasks.reading,
            "title": "الألعاب: ملك القاموس",
            "description": "دعونا نمرح :D",
            "goal": "خمن تعريفات الكلمات غير المعروفة لتصبح ملك القاموس.",
            "materials":
                "كل لاعب لديه قطعة من الورق وقلم، ويحتاج القاموس للبحث عن الكلمات.",
            "text":
                "يختار أحد اللاعبين كلمة غير معروفة من القاموس ويقرأها للمجموعة؛ كل لاعب يكتب الكلمة ويقترح تعريفًا، بينما يسجل اللاعب الذي لديه القاموس التعريف الصحيح. ثم تُخلط الأوراق وتُقرأ التعريفات بصوت عالٍ. يصوت اللاعبون على التعريف الذي يعتقدون أنه صحيح، ويتم منح النقاط بناءً على الأصوات. تستمر اللعبة حتى يجمع لاعب واحد أكبر عدد من النقاط ويصبح ملك القاموس. إذا كان لديك مراهقين: https://www.jeuxetcompagnie.fr/mafia-jeu-role-les-ados/"
          },
          "es": {
            "type": Tasks.reading,
            "title": "Juegos: El Rey del Diccionario",
            "description": "¡Divirtámonos :D!",
            "goal":
                "Adivina las definiciones de palabras desconocidas para convertirte en el rey del diccionario.",
            "materials":
                "Cada jugador tiene un trozo de papel y un bolígrafo, y se necesita un diccionario para buscar las palabras.",
            "text":
                "Un jugador elige una palabra desconocida del diccionario y la lee al grupo; cada jugador escribe la palabra y propone una definición, mientras que el jugador con el diccionario anota la definición correcta. Luego, se mezclan los papeles y se leen las definiciones en voz alta. Los jugadores votan por la definición que creen que es correcta, y se otorgan puntos según los votos. El juego continúa hasta que un jugador acumule la mayor cantidad de puntos y se convierta en el rey del diccionario. Si tienes adolescentes: https://www.jeuxetcompagnie.fr/mafia-jeu-role-les-ados/"
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.reading,
            "title": "Jeux : Le Siège Chaud",
            "description": "Let's have some fun :D",
            "goal":
                "Révéler votre nouveau vous à vos proches en apprenant à mieux vous connaître.",
            "materials": "Aucun matériel spécifique n'est requis.",
            "text":
                "Une personne s’assoit sur la sellette et tout le monde pose des questions ; commencez par vous et assurez-vous que les questions restent respectueuses."
          },
          "en": {
            "type": Tasks.reading,
            "title": "Games: The Hot Seat",
            "description": "Let's have some fun :D",
            "goal":
                "Reveal your new self to your loved ones by getting to know yourself better.",
            "materials": "No specific materials are required.",
            "text":
                "One person sits in the hot seat, and everyone asks questions; start with yourself and make sure the questions remain respectful."
          },
          "ar": {
            "type": Tasks.reading,
            "title": "الألعاب: الكرسي الساخن",
            "description": "دعونا نمرح :D",
            "goal":
                "كشف نفسك الجديدة لأحبائك من خلال التعرف على نفسك بشكل أفضل.",
            "materials": "لا حاجة لمواد محددة.",
            "text":
                "يجلس شخص واحد على الكرسي الساخن، ويسأل الجميع أسئلة؛ ابدأ بنفسك وتأكد من أن الأسئلة تبقى محترمة."
          },
          "es": {
            "type": Tasks.reading,
            "title": "Juegos: La Silla Caliente",
            "description": "¡Divirtámonos :D!",
            "goal":
                "Revele su nuevo yo a sus seres queridos al conocerse mejor.",
            "materials": "No se requieren materiales específicos.",
            "text":
                "Una persona se sienta en la silla caliente y todos hacen preguntas; empieza por ti mismo y asegúrate de que las preguntas se mantengan respetuosas."
          }
        },
        "task3": {
          "fr": {
            "type": Tasks.reading,
            "title": "Jeux : Questions Bizarres",
            "description": "Let's have some fun :D",
            "goal":
                "Découvrir vos invités en leur posant des questions amusantes et inattendues.",
            "materials": "Aucun matériel spécifique n'est requis.",
            "text":
                "Posez des questions étranges aux invités, comme 'Préféreriez-vous avoir le pouvoir de voler ou de vous téléporter ?' ou 'Effacerez-vous toutes les guerres de l’histoire ou trouverez-vous un remède contre le cancer ?' pour favoriser des échanges amusants et intéressants."
          },
          "en": {
            "type": Tasks.reading,
            "title": "Games: Weird Questions",
            "description": "Let's have some fun :D",
            "goal":
                "Discover your guests by asking them funny and unexpected questions.",
            "materials": "No specific materials are required.",
            "text":
                "Ask strange questions to the guests, such as 'Would you rather have the power to fly or to teleport?' or 'Would you erase all wars in history or find a cure for cancer?' to encourage fun and interesting exchanges."
          },
          "ar": {
            "type": Tasks.reading,
            "title": "الألعاب: أسئلة غريبة",
            "description": "دعونا نمرح :D",
            "goal": "اكتشف ضيوفك من خلال طرح أسئلة ممتعة وغير متوقعة.",
            "materials": "لا حاجة لمواد محددة.",
            "text":
                "اسأل الضيوف أسئلة غريبة، مثل 'هل تفضل أن تمتلك القدرة على الطيران أو الانتقال الفوري؟' أو 'هل ستقوم بإزالة جميع الحروب في التاريخ أو ستجد علاجًا للسرطان؟' لتشجيع المناقشات الممتعة والمثيرة."
          },
          "es": {
            "type": Tasks.reading,
            "title": "Juegos: Preguntas Raras",
            "description": "¡Divirtámonos :D!",
            "goal":
                "Descubre a tus invitados haciéndoles preguntas divertidas e inesperadas.",
            "materials": "No se requieren materiales específicos.",
            "text":
                "Haz preguntas extrañas a los invitados, como '¿Preferirías tener el poder de volar o teletransportarte?' o '¿Borrarías todas las guerras de la historia o encontrarías una cura para el cáncer?' para fomentar intercambios divertidos e interesantes."
          }
        },
        "task4": {
          "fr": {
            "type": Tasks.questions,
            "title": "Journal de bord",
            "description":
                "CONTROLE TES ALIMENTS, histoire de jean CONSIGNE DÉFI “ CONTRÔLER SES ALIMENTS”",
            "introText":
                "Choisissez un aliment que vous souhaitez mieux contrôler, cette semaine nous vous proposons de mieux contrôler : PAIN",
            "questions": {
              "1":
                  "À quelle fréquence et en quelle quantité en avez-vous mangé dans la journée ?",
              "2": "Dans quelles circonstances ?"
            }
          },
          "en": {
            "type": Tasks.questions,
            "title": "Logbook",
            "description":
                "CONTROL YOUR FOODS, the jean story ASSIGNMENT CHALLENGE “CONTROL YOUR FOODS”",
            "introText":
                "Choose a food you want to better control; this week we suggest you focus on: BREAD",
            "questions": {
              "1":
                  "How often and in what quantity did you eat it during the day?",
              "2": "Under what circumstances?"
            }
          },
          "ar": {
            "type": Tasks.questions,
            "title": "دفتر اليومية",
            "description": "تحكم في طعامك، قصة جان مهمة التحدي 'تحكم في طعامك'",
            "introText":
                "اختر طعامًا ترغب في التحكم فيه بشكل أفضل، هذا الأسبوع نقترح عليك التحكم في: الخبز",
            "questions": {
              "1": "كم مرة وكم كمية تناولته خلال اليوم؟",
              "2": "في أي ظروف؟"
            }
          },
          "es": {
            "type": Tasks.questions,
            "title": "Diario",
            "description":
                "CONTROLAR SUS ALIMENTOS, la historia de jean DESAFÍO DE TAREA 'CONTROLAR SUS ALIMENTOS'",
            "introText":
                "Elige un alimento que quieras controlar mejor; esta semana te sugerimos centrarte en: PAN",
            "questions": {
              "1":
                  "¿Con qué frecuencia y en qué cantidad lo comiste durante el día?",
              "2": "¿En qué circunstancias?"
            }
          }
        },
        "task5": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description":
                "Prenez un selfie rapide, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط سيلفي سريع، نود رؤية ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del Selfie!",
            "description":
                "¡Tómate un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        }
      },
    },
    "day5": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.questions,
            "title": "Défi Communauté Gourmande",
            "description":
                "Cuisinez une recette proposée en découvrant les ingrédients près de chez vous !",
            "introText":
                "Préparez-vous à cuisiner une recette que nous avons spécialement sélectionnée pour vous. Une vraie recette saine et réconfortante, qui pourrait aller du bœuf bourguignon à un sauté de crevettes, en passant par des pâtes carbonara. Nous avons choisi une recette que vous allez adorer apprendre à maîtriser. Une fois la recette reçue, partez à la recherche des ingrédients nécessaires au sein de votre communauté, c'est-à-dire dans un rayon de 5 à 15 km autour de chez vous. Enfilez votre plus belle paire de chaussures de sport ou prenez votre vélo pour explorer votre quartier à travers ce défi. Expliquez aux commerçants que vous rencontrez l'objectif de votre démarche. Cet exercice vous permettra de créer un véritable lien avec votre communauté, de renforcer votre sentiment d'appartenance, et de découvrir des forces insoupçonnées en vous, contribuant à votre épanouissement personnel. Cette semaine, nous vous proposons de réaliser un délicieux Hachis parmentier à la dinde !",
            "questions": {
              "1": "Quand et comment allez-vous préparer cet événement ?",
              "2":
                  "Qui avez-vous rencontré ? (marchand, épicier, connaissance…) ",
              "3":
                  "Qu’avez-vous ressenti en cuisinant le plat, en voyant le résultat ?"
            }
          },
          "en": {
            "type": Tasks.questions,
            "title": "Gourmet Community Challenge",
            "description":
                "Cook a recipe by discovering the ingredients near you!",
            "introText":
                "Get ready to cook a recipe that we have specially selected for you. A truly healthy and comforting recipe, which could range from beef bourguignon to shrimp stir-fry, or carbonara pasta. We’ve chosen a recipe that you will love to learn to master. Once you receive the recipe, go out and find the necessary ingredients within your community, that is, within a 5 to 15 km radius around you. Put on your best pair of sneakers or take your bike to explore your neighborhood through this challenge. Explain to the merchants you meet the purpose of your approach. This exercise will help you create a real connection with your community, strengthen your sense of belonging, and discover hidden strengths within yourself, contributing to your personal growth. This week, we propose you make a delicious Turkey Shepherd's Pie!",
            "questions": {
              "1": "When and how will you prepare this event?",
              "2": "Who did you meet? (merchant, grocer, acquaintance...)",
              "3": "How did you feel cooking the dish and seeing the result?"
            }
          },
          "ar": {
            "type": Tasks.questions,
            "title": "تحدي المجتمع الذواقة",
            "description": "قم بطهي وصفة من خلال اكتشاف المكونات القريبة منك!",
            "introText":
                "استعد لطهي وصفة اخترناها خصيصًا لك. وصفة صحية ومريحة حقًا، قد تتراوح من لحم البقر البورغينيون إلى قريدس المقلي، أو باستا الكاربونارا. لقد اخترنا وصفة ستحب تعلم إتقانها. بمجرد تلقيك الوصفة، انطلق للبحث عن المكونات اللازمة داخل مجتمعك، أي في دائرة قطرها من 5 إلى 15 كيلومترًا حولك. ارتدِ أفضل حذاء رياضي لديك أو اركب دراجتك لاستكشاف حيّك من خلال هذا التحدي. اشرح للتجار الذين تقابلهم الهدف من نهجك. سيساعدك هذا التمرين على إنشاء رابط حقيقي مع مجتمعك، وتعزيز شعورك بالانتماء، واكتشاف قوى خفية في داخلك، مما يساهم في نمائك الشخصي. هذا الأسبوع، نقترح عليك تحضير طبق هاشيس بارمانتييه بالدجاج اللذيذ!",
            "questions": {
              "1": "متى وكيف ستقوم بتحضير هذا الحدث؟",
              "2": "من التقيت؟ (تاجر، بقال، معرفة...)",
              "3": "ماذا شعرت أثناء طهي الطبق ورؤية النتيجة؟"
            }
          },
          "es": {
            "type": Tasks.questions,
            "title": "Desafío de Comunidad Gourmet",
            "description":
                "¡Cocina una receta descubriendo los ingredientes cerca de ti!",
            "introText":
                "Prepárate para cocinar una receta que hemos seleccionado especialmente para ti. Una verdadera receta saludable y reconfortante, que podría ir desde el boeuf bourguignon hasta un salteado de camarones o pasta carbonara. Hemos elegido una receta que te encantará aprender a dominar. Una vez que recibas la receta, sal a buscar los ingredientes necesarios dentro de tu comunidad, es decir, en un radio de 5 a 15 km a tu alrededor. Ponte tus mejores zapatillas deportivas o toma tu bicicleta para explorar tu vecindario a través de este desafío. Explica a los comerciantes que encuentres el objetivo de tu iniciativa. Este ejercicio te permitirá crear un verdadero vínculo con tu comunidad, fortalecer tu sentido de pertenencia y descubrir fortalezas insospechadas en ti, contribuyendo a tu crecimiento personal. Esta semana, te proponemos preparar un delicioso Hachis Parmentier de Pavo!",
            "questions": {
              "1": "¿Cuándo y cómo vas a preparar este evento?",
              "2": "¿A quién conociste? (comerciante, vendedor, conocido...)",
              "3": "¿Qué sentiste al cocinar el plato al ver el resultado?"
            }
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.quote,
            "title": "Citation du jour!",
            "description": "Nous allons le faire ensemble :)",
            "text":
                "Une des choses les plus bénéfiques à faire, c’est de se reconnecter avec ses origines."
          },
          "en": {
            "type": Tasks.quote,
            "title": "Quote of the day!",
            "description": "We are going to do this together :)",
            "text":
                "One of the most beneficial things to do is to reconnect with your roots."
          },
          "ar": {
            "type": Tasks.quote,
            "title": "اقتباس اليوم!",
            "description": "سنقوم بذلك معًا :)",
            "text": "أحد أكثر الأشياء فائدة هو إعادة الاتصال بجذورك."
          },
          "es": {
            "type": Tasks.quote,
            "title": "¡Cita del día!",
            "description": "Vamos a hacerlo juntos :)",
            "text":
                "Una de las cosas más beneficiosas que puedes hacer es reconectarte con tus raíces."
          }
        },
        "task3": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description":
                "Prenez un selfie rapide, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط سيلفي سريع، نود رؤية ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del Selfie!",
            "description":
                "¡Tómate un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        }
      },
    },
    "day6": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.questions,
            "title": "ÉVOLUTION PHYSIQUE",
            "description":
                "N'oubliez pas de remplir votre défi évolution physique cette semaine !",
            "introText": "Bienvenue dans votre défi physique :)",
            "questions": {
              "1":
                  "Comment se passent tes objectifs de la semaine et en général ?",
              "2": {
                "q": "Quel repas avez-vous choisi cette semaine ?",
                "a": ["Matin", "Midi", "Soir", "Collation"]
              },
              "3": {
                "q":
                    "De combien de portions avez-vous réduit votre consommation ?",
                "a": ['½', '⅓', '¼']
              },
              "4": {
                "q": "Avez-vous remplacé les jus par de l'eau ou du thé ?",
                "a": ['Oui', 'Non']
              },
              "5": {
                "q":
                    "Avez-vous trouvé d'autres activités à faire lorsque vous aviez envie de grignoter ?",
                "a": ['Oui', 'Non']
              },
              "6":
                  "Quelles activités avez-vous choisies pour éviter le grignotage ?",
              "7":
                  "Comment vous sentez-vous par rapport à cette semaine de défi ?"
            }
          },
          "en": {
            "type": Tasks.questions,
            "title": "PHYSICAL EVOLUTION",
            "description":
                "Don't forget to complete your physical evolution challenge this week!",
            "introText": "Welcome to your physical challenge :)",
            "questions": {
              "1": "How are your goals for this week and in general going?",
              "2": {
                "q": "Which meal did you choose this week?",
                "a": ["Morning", "Afternoon", "Evening", "Snack"]
              },
              "3": {
                "q": "By how many servings have you reduced your intake?",
                "a": ['½', '⅓', '¼']
              },
              "4": {
                "q": "Have you replaced juices with water or tea?",
                "a": ['Yes', 'No']
              },
              "5": {
                "q":
                    "Did you find other activities to do when you felt like snacking?",
                "a": ['Yes', 'No']
              },
              "6": "What activities did you choose to avoid snacking?",
              "7": "How do you feel about this week of the challenge?"
            }
          },
          "ar": {
            "type": Tasks.questions,
            "title": "تطور بدني",
            "description": "لا تنسَ إكمال تحدي التطور البدني هذا الأسبوع!",
            "introText": "مرحبًا بك في تحديك البدني :)",
            "questions": {
              "1": "كيف تسير أهدافك لهذا الأسبوع وبشكل عام؟",
              "2": {
                "q": "أي وجبة اخترت هذا الأسبوع؟",
                "a": ["صباحًا", "ظهراً", "مساءً", "وجبة خفيفة"]
              },
              "3": {
                "q": "بكم عدد الحصص التي خفضت من استهلاكك؟",
                "a": ['½', '⅓', '¼']
              },
              "4": {
                "q": "هل استبدلت العصائر بالماء أو الشاي؟",
                "a": ['نعم', 'لا']
              },
              "5": {
                "q":
                    "هل وجدت أنشطة أخرى تقوم بها عندما تشعر برغبة في تناول وجبة خفيفة؟",
                "a": ['نعم', 'لا']
              },
              "6": "ما الأنشطة التي اخترتها لتجنب تناول الوجبات الخفيفة؟",
              "7": "كيف تشعر حيال هذا الأسبوع من التحدي؟"
            }
          },
          "es": {
            "type": Tasks.questions,
            "title": "EVOLUCIÓN FÍSICA",
            "description":
                "¡No olvides completar tu desafío de evolución física esta semana!",
            "introText": "Bienvenido a tu desafío físico :)",
            "questions": {
              "1": "¿Cómo van tus objetivos de esta semana y en general?",
              "2": {
                "q": "¿Qué comida elegiste esta semana?",
                "a": ["Mañana", "Tarde", "Noche", "Snack"]
              },
              "3": {
                "q": "¿Cuántas porciones has reducido en tu consumo?",
                "a": ['½', '⅓', '¼']
              },
              "4": {
                "q": "¿Has reemplazado los jugos por agua o té?",
                "a": ['Sí', 'No']
              },
              "5": {
                "q":
                    "¿Has encontrado otras actividades para hacer cuando tienes ganas de picar?",
                "a": ['Sí', 'No']
              },
              "6": "¿Qué actividades elegiste para evitar picar?",
              "7": "¿Cómo te sientes con respecto a esta semana del desafío?"
            }
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description":
                "Prenez un selfie rapide, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط سيلفي سريع، نود رؤية ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del Selfie!",
            "description":
                "¡Tómate un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        }
      },
    },
    "day7": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.generatedVideo,
            "title": "Vidéo BestOf de la semaine",
            "description":
                "Profitez des meilleurs moments de cette semaine, en espérant que ça vous plaise !"
          },
          "en": {
            "type": Tasks.generatedVideo,
            "title": "Best of the Week Video",
            "description":
                "Enjoy the best moments of this week, hoping you like it!"
          },
          "ar": {
            "type": Tasks.generatedVideo,
            "title": "فيديو أفضل لحظات الأسبوع",
            "description": "استمتع بأفضل لحظات هذا الأسبوع، نأمل أن يعجبك!"
          },
          "es": {
            "type": Tasks.generatedVideo,
            "title": "Video Lo Mejor de la Semana",
            "description":
                "Disfruta de los mejores momentos de esta semana, ¡esperamos que te guste!"
          }
        }
      },
    },
  },
  "week7": {
    "day1": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description":
                "Prenez un selfie rapide, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "خذ سيلفي سريع، نود أن نرى ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del Selfie!",
            "description":
                "¡Toma un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.video,
            "title": "Vidéo motivation",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FCle7Semaine7jour1Jea.mp4?alt=media&token=f931a1eb-648e-4845-b28e-59e61484df30",
            "description": "CLE BIEN-ÊTRE 7"
          },
          "en": {
            "type": Tasks.video,
            "title": "Video Motivation",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FCle7ENGLISH.mp4?alt=media&token=f1a8db44-9f39-437e-a299-0293e3f7f2c8",
            "description": "WELLNESS KEY 7"
          },
          "ar": {
            "type": Tasks.video,
            "title": "فيديو تحفيزي",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FCle7ARABIC.mp4?alt=media&token=41b4b7d8-d2fe-467d-a8c7-7e9b4d00a50f",
            "description": "مفتاح الرفاهية 7"
          },
          "es": {
            "type": Tasks.video,
            "title": "Video Motivación",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FCle7SPANISH.mp4?alt=media&token=44b5aaea-bd19-469b-bfa2-be9252206c35",
            "description": "CLAVE DE BIENESTAR 7"
          }
        }
      },
    },
    "day2": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.questions,
            "title": "Journal de board",
            "description": "Décrivez vos sentiments",
            "introText":
                "Le DEFI PHYSIQUE est donc de trouver cette activité culturelle qui vous intéresse. Pour éviter tout désagrément, n'hésitez pas à communiquer avec les organisateurs pour savoir si l’endroit et les équipements sont adaptés. Vous vous sentez un peu fébrile ? demandez à un de vos proches de vous accompagner et amusez-vous :) ",
            "questions": {
              "1":
                  "Activités choisies, date, avec qui allez-vous faire cette activité ?",
              "2": "Comment te sens-tu aujourd'hui ?",
              "3": "Où en es-tu dans tes défis ?"
            }
          },
          "en": {
            "type": Tasks.questions,
            "title": "Board Journal",
            "description": "Describe your feelings",
            "introText":
                "The PHYSICAL CHALLENGE is to find that cultural activity that interests you. To avoid any inconvenience, feel free to communicate with the organizers to find out if the location and equipment are suitable. Feeling a bit anxious? Ask one of your friends or family to accompany you and have fun :)",
            "questions": {
              "1":
                  "Chosen activities, date, who will you do this activity with?",
              "2": "How are you feeling today?",
              "3": "Where are you in your challenges?"
            }
          },
          "ar": {
            "type": Tasks.questions,
            "title": "مذكرات الأنشطة",
            "description": "صف مشاعرك",
            "introText":
                "التحدي البدني هو العثور على هذه النشاط الثقافي الذي يهمك. لتجنب أي إزعاج، لا تتردد في التواصل مع المنظمين لمعرفة ما إذا كان المكان والمعدات مناسبة. هل تشعر قليلاً بالتوتر؟ اطلب من أحد المقربين منك أن يرافقك واستمتع :)",
            "questions": {
              "1": "الأنشطة المختارة، التاريخ، مع من ستقوم بهذا النشاط؟",
              "2": "كيف تشعر اليوم؟",
              "3": "أين وصلت في تحدياتك؟"
            }
          },
          "es": {
            "type": Tasks.questions,
            "title": "Diario de Actividades",
            "description": "Describe tus sentimientos",
            "introText":
                "El DESAFÍO FÍSICO es encontrar esa actividad cultural que te interese. Para evitar cualquier inconveniente, no dudes en comunicarte con los organizadores para saber si el lugar y los equipos son adecuados. ¿Te sientes un poco ansioso? Pídele a uno de tus amigos que te acompañe y diviértete :)",
            "questions": {
              "1":
                  "Actividades elegidas, fecha, ¿con quién harás esta actividad?",
              "2": "¿Cómo te sientes hoy?",
              "3": "¿Dónde estás en tus desafíos?"
            }
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description":
                "Prenez un selfie rapide, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "خذ سيلفي سريع، نود أن نرى ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del Selfie!",
            "description":
                "¡Toma un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        }
      },
    },
    "day3": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.questions,
            "title": "Journal de board",
            "description": "Décrivez vos sentiments",
            "introText":
                "Bienvenue dans votre journal de bord du jour. Si vous répondez non aux première et deuxième questions, vous comprenez que la perception du danger est exagérée et vous pouvez relativiser. Si vous répondez oui à la première et deuxième questions, alors vous devez convenir avec la question 3 ce qu'il convient de faire. L’Action vous permettra d'être en contrôle et de diminuer votre anxiété.",
            "questions": {
              "1": "Ma sécurité est-elle en danger ?",
              "2": "Est-ce grave ?",
              "3":
                  "Que puis-je faire d'utile et d'adapté pour régler le conflit ?"
            }
          },
          "en": {
            "type": Tasks.questions,
            "title": "Board Journal",
            "description": "Describe your feelings",
            "introText":
                "Welcome to your daily board journal. If you answer no to the first two questions, you understand that the perception of danger is exaggerated and you can put it into perspective. If you answer yes to the first two questions, then you need to agree with question 3 on what is appropriate to do. Action will allow you to be in control and reduce your anxiety.",
            "questions": {
              "1": "Is my safety at risk?",
              "2": "Is it serious?",
              "3":
                  "What can I do that is useful and appropriate to resolve the conflict?"
            }
          },
          "ar": {
            "type": Tasks.questions,
            "title": "مذكرات الأنشطة",
            "description": "صف مشاعرك",
            "introText":
                "مرحبًا بك في مذكرتك اليومية. إذا كنت تجيب بلا على السؤالين الأول والثاني، فأنت تدرك أن تصور الخطر مبالغ فيه ويمكنك أن تأخذ الأمر بنظرة مختلفة. إذا كنت تجيب بنعم على السؤالين الأول والثاني، فعليك أن تتفق مع السؤال الثالث على ما يجب القيام به. سيسمح لك اتخاذ الإجراءات بالتحكم وتقليل قلقك.",
            "questions": {
              "1": "هل أمانك في خطر؟",
              "2": "هل الأمر خطير؟",
              "3": "ماذا يمكنني أن أفعل من شيء مفيد ومناسب لحل النزاع؟"
            }
          },
          "es": {
            "type": Tasks.questions,
            "title": "Diario de Actividades",
            "description": "Describe tus sentimientos",
            "introText":
                "Bienvenido a tu diario de actividades del día. Si respondes no a las dos primeras preguntas, entiendes que la percepción del peligro está exagerada y puedes ponerlo en perspectiva. Si respondes sí a las dos primeras preguntas, entonces debes acordar con la pregunta 3 lo que es apropiado hacer. La acción te permitirá tener control y reducir tu ansiedad.",
            "questions": {
              "1": "¿Está en peligro mi seguridad?",
              "2": "¿Es grave?",
              "3":
                  "¿Qué puedo hacer que sea útil y apropiado para resolver el conflicto?"
            }
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.quote,
            "title": "Citation du jour !",
            "description": "Nous allons faire cela ensemble :)",
            "text":
                "Lève-toi et vénère le sol sur lequel tu chemines, laisse-toi guider vers de nouvelles aventures."
          },
          "en": {
            "type": Tasks.quote,
            "title": "Quote of the day!",
            "description": "We are going to do this together :)",
            "text":
                "Rise up and honor the ground you walk on; let yourself be guided toward new adventures."
          },
          "ar": {
            "type": Tasks.quote,
            "title": "اقتباس اليوم!",
            "description": "سوف نفعل هذا معًا :)",
            "text":
                "انهض وكرم الأرض التي تسير عليها، دع نفسك تتوجه نحو مغامرات جديدة."
          },
          "es": {
            "type": Tasks.quote,
            "title": "¡Cita del día!",
            "description": "Vamos a hacer esto juntos :)",
            "text":
                "Levántate y honra la tierra sobre la que caminas, déjate guiar hacia nuevas aventuras."
          }
        },
        "task3": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description":
                "Prenez un selfie rapide, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "خذ سيلفي سريع، نود أن نرى ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del Selfie!",
            "description":
                "¡Toma un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        }
      },
    },
    "day4": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.quote,
            "title": "Citation du jour !",
            "description": "Nous allons faire cela ensemble :)",
            "text": "Prendre soin de soi permet de se réapproprier son pouvoir."
          },
          "en": {
            "type": Tasks.quote,
            "title": "Quote of the day!",
            "description": "We are going to do this together :)",
            "text": "Taking care of oneself allows one to reclaim their power."
          },
          "ar": {
            "type": Tasks.quote,
            "title": "اقتباس اليوم!",
            "description": "سوف نفعل هذا معًا :)",
            "text": "يتيح العناية بالنفس استعادة القوة."
          },
          "es": {
            "type": Tasks.quote,
            "title": "¡Cita del día!",
            "description": "Vamos a hacer esto juntos :)",
            "text": "Cuidarse permite reclamar su poder."
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.questions,
            "title": "Journal de bord",
            "description":
                "CONTROLE TES ALIMENTS, histoire de jean CONSIGNE DÉFI “CONTRÔLER SES ALIMENTS”",
            "introText":
                "Choisissez un aliment que vous souhaitez mieux contrôler, cette semaine nous vous proposons de mieux contrôler : BISCUITS.",
            "questions": {
              "1":
                  "À quelle fréquence et en quelle quantité en avez-vous mangé dans la journée ?",
              "2": "Dans quelles circonstances ?"
            }
          },
          "en": {
            "type": Tasks.questions,
            "title": "Board Journal",
            "description":
                "CONTROL YOUR FOOD, story of Jean TASK INSTRUCTION “CONTROL YOUR FOOD”",
            "introText":
                "Choose a food you want to control better; this week we suggest focusing on: COOKIES.",
            "questions": {
              "1":
                  "How often and in what quantity did you eat it during the day?",
              "2": "In what circumstances?"
            }
          },
          "ar": {
            "type": Tasks.questions,
            "title": "مذكرات الأنشطة",
            "description": "تحكم في طعامك، قصة جان مهمة “تحكم في طعامك”",
            "introText":
                "اختر طعامًا ترغب في التحكم فيه بشكل أفضل، هذا الأسبوع نقترح التركيز على: البسكويت.",
            "questions": {
              "1": "كم مرة وكم كمية تناولته خلال اليوم؟",
              "2": "في أي ظروف؟"
            }
          },
          "es": {
            "type": Tasks.questions,
            "title": "Diario de Actividades",
            "description":
                "CONTROL DE TU ALIMENTO, historia de Jean INSTRUCCIÓN DE TAREA “CONTROLAR TU ALIMENTO”",
            "introText":
                "Elige un alimento que quieras controlar mejor; esta semana sugerimos enfocarse en: GALLETAS.",
            "questions": {
              "1":
                  "¿Con qué frecuencia y en qué cantidad lo comiste durante el día?",
              "2": "¿En qué circunstancias?"
            }
          }
        },
        "task3": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description":
                "Prenez un selfie rapide, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "خذ سيلفي سريع، نود أن نرى ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del Selfie!",
            "description":
                "¡Toma un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        }
      },
    },
    "day5": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.quote,
            "title": "Citation du jour !",
            "description": "Nous allons faire cela ensemble :)",
            "text": "Toute épreuve fait grandir."
          },
          "en": {
            "type": Tasks.quote,
            "title": "Quote of the day!",
            "description": "We are going to do this together :)",
            "text": "Every challenge helps us grow."
          },
          "ar": {
            "type": Tasks.quote,
            "title": "اقتباس اليوم!",
            "description": "سوف نفعل هذا معًا :)",
            "text": "كل تجربة تجعلنا ننمو."
          },
          "es": {
            "type": Tasks.quote,
            "title": "¡Cita del día!",
            "description": "Vamos a hacer esto juntos :)",
            "text": "Cada desafío nos hace crecer."
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.questions,
            "title": "Défi Communauté Gourmande",
            "description":
                "Cuisinez une recette proposée en découvrant les ingrédients près de chez vous !",
            "introText":
                "Préparez-vous à cuisiner une recette que nous avons spécialement sélectionnée pour vous. Une vraie recette saine et réconfortante, qui pourrait aller du bœuf bourguignon à un sauté de crevettes, en passant par des pâtes carbonara. Nous avons choisi une recette que vous allez adorer apprendre à maîtriser. Une fois la recette reçue, partez à la recherche des ingrédients nécessaires au sein de votre communauté, c'est-à-dire dans un rayon de 5 à 15 km autour de chez vous. Enfilez votre plus belle paire de chaussures de sport ou prenez votre vélo pour explorer votre quartier à travers ce défi. Expliquez aux commerçants que vous rencontrez l'objectif de votre démarche. Cet exercice vous permettra de créer un véritable lien avec votre communauté, de renforcer votre sentiment d'appartenance, et de découvrir des forces insoupçonnées en vous, contribuant à votre épanouissement personnel. Cette semaine, nous vous proposons de réaliser un délicieux Hachis Parmentier à la Dinde !",
            "questions": {
              "1": "Quand et comment allez-vous préparer cet événement ?",
              "2":
                  "Qui avez-vous rencontré ? (marchand, épicier, connaissance…)",
              "3":
                  "Qu’avez-vous ressenti en cuisinant le plat, en voyant le résultat ?"
            }
          },
          "en": {
            "type": Tasks.questions,
            "title": "Gourmet Community Challenge",
            "description":
                "Cook a suggested recipe while discovering local ingredients!",
            "introText":
                "Get ready to cook a recipe we've specially selected for you. A truly healthy and comforting recipe, ranging from beef bourguignon to shrimp stir-fry, or carbonara pasta. We have chosen a recipe that you will love mastering. Once you receive the recipe, go out and find the necessary ingredients within your community, which means within a 5 to 15 km radius of your home. Put on your best sneakers or take your bike to explore your neighborhood through this challenge. Explain to the merchants you meet the objective of your journey. This exercise will allow you to create a genuine connection with your community, strengthen your sense of belonging, and discover hidden strengths within yourself, contributing to your personal growth. This week, we suggest making a delicious Turkey Hachis Parmentier!",
            "questions": {
              "1": "When and how will you prepare this event?",
              "2": "Who did you meet? (merchant, grocer, acquaintance…)",
              "3": "How did you feel cooking the dish and seeing the result?"
            }
          },
          "ar": {
            "type": Tasks.questions,
            "title": "تحدي المجتمع الذواقة",
            "description": "اطبخ وصفة مقترحة واكتشف المكونات المحلية!",
            "introText":
                "استعد لطهي وصفة اخترناها لك خصيصًا. وصفة صحية مريحة، قد تتراوح من لحم البقر بورغينيون إلى القريدس المقلي، أو باستا كاربونارا. لقد اخترنا وصفة ستعجبك تعلم إتقانها. بمجرد استلامك للوصفة، انطلق للبحث عن المكونات اللازمة داخل مجتمعك، أي ضمن نطاق 5 إلى 15 كيلومترًا من منزلك. ارتدي أفضل حذائك الرياضي أو خذ دراجتك لاستكشاف حيّك من خلال هذا التحدي. اشرح للتجار الذين تقابلهم هدف رحلتك. ستسمح لك هذه التجربة بإنشاء اتصال حقيقي مع مجتمعك، وتعزيز شعورك بالانتماء، واكتشاف قوى خفية بداخلك، مما يساهم في نموك الشخصي. هذا الأسبوع، نقترح عليك تحضير هاتشيس بارمانتييه الديك الرومي اللذيذ!",
            "questions": {
              "1": "متى وكيف ستعد لهذا الحدث؟",
              "2": "من قابلت؟ (تاجر، بقال، معرفة…)",
              "3": "ماذا شعرت أثناء طهي الطبق ورؤية النتيجة؟"
            }
          },
          "es": {
            "type": Tasks.questions,
            "title": "Desafío de la Comunidad Gourmet",
            "description":
                "¡Cocina una receta propuesta mientras descubres ingredientes locales!",
            "introText":
                "Prepárate para cocinar una receta que hemos seleccionado especialmente para ti. Una receta verdaderamente saludable y reconfortante, que puede ir desde un boeuf bourguignon hasta un salteado de camarones, pasando por pasta carbonara. Hemos elegido una receta que te encantará dominar. Una vez que recibas la receta, sal a buscar los ingredientes necesarios dentro de tu comunidad, es decir, dentro de un radio de 5 a 15 km de tu hogar. Ponte tus mejores zapatillas o toma tu bicicleta para explorar tu vecindario a través de este desafío. Explica a los comerciantes que encuentres el objetivo de tu viaje. Este ejercicio te permitirá crear un verdadero vínculo con tu comunidad, fortalecer tu sentido de pertenencia y descubrir fuerzas insospechadas dentro de ti, contribuyendo a tu crecimiento personal. Esta semana, te sugerimos hacer un delicioso Hachis Parmentier de pavo.",
            "questions": {
              "1": "¿Cuándo y cómo vas a preparar este evento?",
              "2": "¿A quién conociste? (comerciante, tendero, conocido…)",
              "3": "¿Qué sentiste al cocinar el plato y ver el resultado?"
            }
          }
        },
        "task3": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description":
                "Prenez un selfie rapide, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "خذ سيلفي سريع، نود أن نرى ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del Selfie!",
            "description":
                "¡Toma un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        }
      },
    },
    "day6": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.questions,
            "title": "ÉVOLUTION PHYSIQUE",
            "description":
                "N'oubliez pas de remplir votre défi évolution physique cette semaine !",
            "introText": "Bienvenue dans votre défi physique :)",
            "questions": {
              "1":
                  "Comment se passent tes objectifs de la semaine et en général ?",
              "2": {
                "q": "Quel repas avez-vous choisi cette semaine ?",
                "a": ["Matin", "Midi", "Soir", "Collation"]
              },
              "3": {
                "q":
                    "De combien de portions avez-vous réduit votre consommation ?",
                "a": ["½", "⅓", "¼"]
              },
              "4": {
                "q": "Avez-vous remplacé les jus par de l'eau ou du thé ?",
                "a": ["Oui", "Non"]
              },
              "5": {
                "q":
                    "Avez-vous trouvé d'autres activités à faire lorsque vous aviez envie de grignoter ?",
                "a": ["Oui", "Non"]
              },
              "6":
                  "Quelles activités avez-vous choisies pour éviter le grignotage ?",
              "7":
                  "Comment vous sentez-vous par rapport à cette semaine de défi ?"
            }
          },
          "en": {
            "type": Tasks.questions,
            "title": "PHYSICAL EVOLUTION",
            "description":
                "Don't forget to complete your physical evolution challenge this week!",
            "introText": "Welcome to your physical challenge :)",
            "questions": {
              "1": "How are your goals going this week and overall?",
              "2": {
                "q": "Which meal did you choose this week?",
                "a": ["Morning", "Afternoon", "Evening", "Snack"]
              },
              "3": {
                "q": "How many portions have you reduced your intake?",
                "a": ["½", "⅓", "¼"]
              },
              "4": {
                "q": "Have you replaced juices with water or tea?",
                "a": ["Yes", "No"]
              },
              "5": {
                "q":
                    "Have you found other activities to do when you felt like snacking?",
                "a": ["Yes", "No"]
              },
              "6": "What activities did you choose to avoid snacking?",
              "7": "How do you feel about this week’s challenge?"
            }
          },
          "ar": {
            "type": Tasks.questions,
            "title": "تطور بدني",
            "description": "لا تنسَ إكمال تحدي التطور البدني هذا الأسبوع!",
            "introText": "مرحبًا بك في تحدي اللياقة البدنية الخاص بك :)",
            "questions": {
              "1": "كيف تسير أهدافك هذا الأسبوع وعامةً؟",
              "2": {
                "q": "أي وجبة اخترت هذا الأسبوع؟",
                "a": ["صباحًا", "ظهراً", "مساءً", "وجبة خفيفة"]
              },
              "3": {
                "q": "كم عدد الحصص التي قللت من تناولها؟",
                "a": ["½", "⅓", "¼"]
              },
              "4": {
                "q": "هل استبدلت العصائر بالماء أو الشاي؟",
                "a": ["نعم", "لا"]
              },
              "5": {
                "q":
                    "هل وجدت أنشطة أخرى تفعلها عندما تشعر بالرغبة في تناول الوجبات الخفيفة؟",
                "a": ["نعم", "لا"]
              },
              "6": "ما الأنشطة التي اخترتها لتجنب تناول الوجبات الخفيفة؟",
              "7": "كيف تشعر بشأن تحدي هذا الأسبوع؟"
            }
          },
          "es": {
            "type": Tasks.questions,
            "title": "EVOLUCIÓN FÍSICA",
            "description":
                "¡No olvides completar tu desafío de evolución física esta semana!",
            "introText": "Bienvenido a tu desafío físico :)",
            "questions": {
              "1": "¿Cómo van tus objetivos esta semana y en general?",
              "2": {
                "q": "¿Qué comida elegiste esta semana?",
                "a": ["Mañana", "Tarde", "Noche", "Snack"]
              },
              "3": {
                "q": "¿Cuántas porciones has reducido de tu consumo?",
                "a": ["½", "⅓", "¼"]
              },
              "4": {
                "q": "¿Has reemplazado los jugos por agua o té?",
                "a": ["Sí", "No"]
              },
              "5": {
                "q":
                    "¿Has encontrado otras actividades para hacer cuando tenías ganas de picar?",
                "a": ["Sí", "No"]
              },
              "6": "¿Qué actividades elegiste para evitar picar?",
              "7": "¿Cómo te sientes respecto a este desafío de la semana?"
            }
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description":
                "Prenez un selfie rapide, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "خذ سيلفي سريع، نود أن نرى ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del Selfie!",
            "description":
                "¡Toma un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        }
      },
    },
    "day7": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.generatedVideo,
            "title": "Vidéo BestOf de la semaine",
            "description":
                "Profitez des meilleurs moments de cette semaine, en espérant que ça vous plaise !"
          },
          "en": {
            "type": Tasks.generatedVideo,
            "title": "BestOf Video of the Week",
            "description":
                "Enjoy the best moments of this week, hoping you like it!"
          },
          "ar": {
            "type": Tasks.generatedVideo,
            "title": "فيديو أفضل لحظات الأسبوع",
            "description": "استمتع بأفضل لحظات هذا الأسبوع، آمل أن يعجبك!"
          },
          "es": {
            "type": Tasks.generatedVideo,
            "title": "Video de lo Mejor de la Semana",
            "description":
                "¡Disfruta de los mejores momentos de esta semana, esperando que te guste!"
          }
        }
      },
    },
  },
  "week8": {
    "day1": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description":
                "Prenez un rapide selfie, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط سيلفي سريع، نود رؤية ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del Selfie!",
            "description":
                "¡Toma un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.questions,
            "title": "Journal de bord",
            "description": "Décrivez vos sentiments",
            "introText":
                "Bienvenue dans votre journal de bord du jour, faisons-le ensemble :)",
            "questions": {
              "1": "Comment te sens-tu en ce début de semaine ?",
              "2": "Où en es-tu dans tes défis ?"
            }
          },
          "en": {
            "type": Tasks.questions,
            "title": "Journal Entry",
            "description": "Describe your feelings",
            "introText":
                "Welcome to your journal entry for today, let's do this together :)",
            "questions": {
              "1": "How are you feeling at the start of this week?",
              "2": "Where are you in your challenges?"
            }
          },
          "ar": {
            "type": Tasks.questions,
            "title": "دفتر اليوميات",
            "description": "صف مشاعرك",
            "introText":
                "مرحبًا بك في دفتر يومياتك لهذا اليوم، دعنا نفعل ذلك معًا :)",
            "questions": {
              "1": "كيف تشعر في بداية هذا الأسبوع؟",
              "2": "أين أنت في تحدياتك؟"
            }
          },
          "es": {
            "type": Tasks.questions,
            "title": "Diario",
            "description": "Describe tus sentimientos",
            "introText": "Bienvenido a tu diario de hoy, ¡hagámoslo juntos :)",
            "questions": {
              "1": "¿Cómo te sientes al comienzo de esta semana?",
              "2": "¿En qué punto estás en tus desafíos?"
            }
          }
        },
        "task3": {
          "fr": {
            "type": Tasks.video,
            "title": "Vidéo motivation",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FCle8semaine8jour1jea.mp4?alt=media&token=e4020c48-eda4-466e-af8d-e77a01dc08fe",
            "description": "CLE BIEN-ÊTRE 8"
          },
          "en": {
            "type": Tasks.video,
            "title": "Motivation Video",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FCle8ENGLISH.mp4?alt=media&token=79416b91-0a44-4591-be90-fce69db99c52",
            "description": "WELLNESS KEY 8"
          },
          "ar": {
            "type": Tasks.video,
            "title": "فيديو تحفيزي",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FCle8ARABIC.mp4?alt=media&token=93476fb0-9f0a-4755-93ee-c0964a87adff",
            "description": "مفتاح الرفاهية 8"
          },
          "es": {
            "type": Tasks.video,
            "title": "Video de Motivación",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FCle8SPANISH.mp4?alt=media&token=0e747921-cecd-413a-8834-586333f05cbd",
            "description": "CLAVE DE BIENESTAR 8"
          }
        }
      },
    },
    "day2": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.questions,
            "title": "Journal de bord",
            "description": "Décrivez vos sentiments",
            "introText":
                "Pour le défi émotionnel, vous êtes libre de choisir ce qui vous convient le plus, ou bien d'en inventer pour continuer la découverte vers vous-même. L'idée étant de vous reprendre en main et de vous offrir l'autonomie de vivre !",
            "questions": {"1": "Comment te sens-tu aujourd'hui ?"}
          },
          "en": {
            "type": Tasks.questions,
            "title": "Journal Entry",
            "description": "Describe your feelings",
            "introText":
                "For the emotional challenge, you are free to choose what suits you best or even invent some to continue your self-discovery. The idea is to take control and give yourself the autonomy to live!",
            "questions": {"1": "How are you feeling today?"}
          },
          "ar": {
            "type": Tasks.questions,
            "title": "دفتر اليوميات",
            "description": "صف مشاعرك",
            "introText":
                "في التحدي العاطفي، لديك الحرية في اختيار ما يناسبك، أو حتى ابتكار شيء لمواصلة اكتشاف نفسك. الفكرة هي استعادة السيطرة ومنح نفسك الاستقلالية للعيش!",
            "questions": {"1": "كيف تشعر اليوم؟"}
          },
          "es": {
            "type": Tasks.questions,
            "title": "Diario",
            "description": "Describe tus sentimientos",
            "introText":
                "Para el desafío emocional, eres libre de elegir lo que más te convenga o incluso inventar algo para continuar tu autodescubrimiento. La idea es retomar el control y darte la autonomía para vivir.",
            "questions": {"1": "¿Cómo te sientes hoy?"}
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description":
                "Prenez un rapide selfie, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط سيلفي سريع، نود رؤية ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del Selfie!",
            "description":
                "¡Toma un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        }
      },
    },
    "day3": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.questions,
            "title": "Journal de bord",
            "description": "Décrivez vos sentiments",
            "introText":
                "Votre défi physique de cette semaine est de choisir le défi que vous avez le plus aimé, celui qui vous a fait vous sentir transformé et vous a permis de recommencer. C'est votre cadeau :)",
            "questions": {"1": "Comment te sens-tu aujourd'hui ?"}
          },
          "en": {
            "type": Tasks.questions,
            "title": "Journal Entry",
            "description": "Describe your feelings",
            "introText":
                "Your physical challenge this week is to choose the challenge you liked the most, the one that made you feel transformed and allowed you to start over. It's your gift :)",
            "questions": {"1": "How are you feeling today?"}
          },
          "ar": {
            "type": Tasks.questions,
            "title": "دفتر اليوميات",
            "description": "صف مشاعرك",
            "introText":
                "تحديك البدني هذا الأسبوع هو اختيار التحدي الذي أحببته أكثر، والذي جعلك تشعر بالتحول وأتاح لك فرصة البدء من جديد. إنها هديتك :)",
            "questions": {"1": "كيف تشعر اليوم؟"}
          },
          "es": {
            "type": Tasks.questions,
            "title": "Diario",
            "description": "Describe tus sentimientos",
            "introText":
                "Tu desafío físico esta semana es elegir el desafío que más te gustó, el que te hizo sentir transformado y te permitió comenzar de nuevo. ¡Es tu regalo! :)",
            "questions": {"1": "¿Cómo te sientes hoy?"}
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description":
                "Prenez un rapide selfie, nous aimerions voir votre sourire !"
          },
          "en": {
            "type": Tasks.takePhoto,
            "title": "Selfie Time!",
            "description": "Take a quick selfie, we'd love to see your smile!"
          },
          "ar": {
            "type": Tasks.takePhoto,
            "title": "وقت السيلفي!",
            "description": "التقط سيلفي سريع، نود رؤية ابتسامتك!"
          },
          "es": {
            "type": Tasks.takePhoto,
            "title": "¡Hora del Selfie!",
            "description":
                "¡Toma un selfie rápido, nos encantaría ver tu sonrisa!"
          }
        }
      },
    },
    "day4": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.generatedVideo,
            "title": "Vos Sentiments !",
            "description":
                "Récapitulatif des moments extérieurs, vidéos et photos des jours 2 et 3 de chaque semaine."
          },
          "en": {
            "type": Tasks.generatedVideo,
            "title": "Your Feelings!",
            "description":
                "Recap of the outdoor moments, videos, and photos from days 2 and 3 of each week."
          },
          "ar": {
            "type": Tasks.generatedVideo,
            "title": "مشاعرك!",
            "description":
                "ملخص لحظات خارجية، مقاطع فيديو وصور من اليومين 2 و 3 من كل أسبوع."
          },
          "es": {
            "type": Tasks.generatedVideo,
            "title": "¡Tus Sentimientos!",
            "description":
                "Resumen de los momentos al aire libre, videos y fotos de los días 2 y 3 de cada semana."
          }
        }
      },
    },
    "day5": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.generatedVideo,
            "title": "Vos Sentiments !",
            "description":
                "Récapitulatif des vidéos et photos des jours 4 et 5 de chaque semaine."
          },
          "en": {
            "type": Tasks.generatedVideo,
            "title": "Your Feelings!",
            "description":
                "Recap of the videos and photos from days 4 and 5 of each week."
          },
          "ar": {
            "type": Tasks.generatedVideo,
            "title": "مشاعرك!",
            "description":
                "ملخص لمقاطع الفيديو والصور من اليومين 4 و 5 من كل أسبوع."
          },
          "es": {
            "type": Tasks.generatedVideo,
            "title": "¡Tus Sentimientos!",
            "description":
                "Resumen de los videos y fotos de los días 4 y 5 de cada semana."
          }
        }
      },
    },
    "day6": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.generatedVideo,
            "title": "Vos Sentiments !",
            "description": "Récapitulatif des vidéos et photos du jour 6."
          },
          "en": {
            "type": Tasks.generatedVideo,
            "title": "Your Feelings!",
            "description": "Recap of the videos and photos from day 6."
          },
          "ar": {
            "type": Tasks.generatedVideo,
            "title": "مشاعرك!",
            "description": "ملخص لمقاطع الفيديو والصور من اليوم 6."
          },
          "es": {
            "type": Tasks.generatedVideo,
            "title": "¡Tus Sentimientos!",
            "description": "Resumen de los videos y fotos del día 6."
          }
        }
      },
    },
    "day7": {
      "tasks": {
        "task1": {
          "fr": {
            "type": Tasks.generatedVideo,
            "title": "Vos Sentiments !",
            "description": "Récapitulatif du jour 1 de chaque semaine."
          },
          "en": {
            "type": Tasks.generatedVideo,
            "title": "Your Feelings!",
            "description": "Recap of day 1 of each week."
          },
          "ar": {
            "type": Tasks.generatedVideo,
            "title": "مشاعرك!",
            "description": "ملخص لليوم 1 من كل أسبوع."
          },
          "es": {
            "type": Tasks.generatedVideo,
            "title": "¡Tus Sentimientos!",
            "description": "Resumen del día 1 de cada semana."
          }
        },
        "task2": {
          "fr": {
            "type": Tasks.video,
            "title": "Vidéo de Fin",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/taskVideos%2FFelicitationVideo.mp4?alt=media&token=125ef43c-46dd-42f3-b275-c8199df5e9d6",
            "description": "Félicitations :D"
          },
          "en": {
            "type": Tasks.video,
            "title": "End Video",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/logbookVideos%2FFelicitationENGLISH.mp4?alt=media&token=92074dd0-3597-4bef-8a41-db42098bce90",
            "description": "Congratulations :D"
          },
          "ar": {
            "type": Tasks.video,
            "title": "فيديو النهاية",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/logbookVideos%2FFelicitationARABIC.mp4?alt=media&token=590b7f02-629d-4357-adfe-ec9a25477ac8",
            "description": "تهانينا :D"
          },
          "es": {
            "type": Tasks.video,
            "title": "Video de Fin",
            "videoUrl":
                "https://firebasestorage.googleapis.com/v0/b/illimited-app.appspot.com/o/logbookVideos%2FFelicitationSPANISH.mp4?alt=media&token=4e0b7334-a24e-4324-a872-d5d25a6def7c",
            "description": "¡Felicidades! :D"
          }
        }
      },
    },
  },
};