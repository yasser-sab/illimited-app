import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/main.dart';
import 'package:illimited_app/router/router_names.dart';
import 'package:illimited_app/screens/task_details.dart';
import 'package:illimited_app/utils/utils.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TaskCard extends StatelessWidget {
  const TaskCard(
      {super.key,
      required this.status,
      required this.taskData,
      required this.onRefresh,
      required this.isLastTask,
      required this.isLastDay});
  final VoidCallback onRefresh;
  final Status status;
  final Map<String, dynamic> taskData;
  final bool isLastTask;
  final bool isLastDay;
  @override
  Widget build(BuildContext context) {
    double borderRadius = 10;
    double cardHeight = 150;
    double topRight_Radius = 0;
    double topLeft_Radius = 0;
    double bottomRight_Radius = 0;
    double bottomLeft_Radius = 0;

    Locale currentLocale = Localizations.localeOf(context);
    String languageCode = currentLocale.languageCode;

    if (languageCode == "ar") {
      topRight_Radius = borderRadius;
      bottomRight_Radius = borderRadius;
    } else {
      topLeft_Radius = borderRadius;
      bottomLeft_Radius = borderRadius;
    }

    Color sidePanel;
    String statusImagePath;

    switch (status) {
      case Status.completed:
        sidePanel = Colors.green;
        statusImagePath = "assets/icon/checkGreen.png";
        break;
      case Status.inProgress:
        sidePanel = Colors.orange;
        statusImagePath = "assets/icon/checkGreen.png";
        break;
      case Status.locked:
        sidePanel = Colors.grey;
        statusImagePath = "assets/icon/padlock.png";
    }

    return GestureDetector(
      onTap: () async {
        log((taskData["type"] as Tasks).name);
        final bool? shouldRefresh =
            await context.pushNamed(RouteNames.taskDetails, extra: {
          "taskType": taskData["type"],
          "isLastTask": isLastTask,
          "isLastDay": isLastDay,
          "taskData": taskData,
        });
        if (shouldRefresh != null && shouldRefresh) {
          onRefresh();
        }
      },
      child: SizedBox(
        height: cardHeight,
        child: Card(
          color: Colors.transparent,
          margin: EdgeInsets.all(12),
          elevation: 4,
          // elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
          child: Row(
            children: [
              Container(
                height: cardHeight,
                // height: cardHeight/1.4,
                width: getScreenWidth(context) * 0.15,
                decoration: BoxDecoration(
                  color: sidePanel,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(topLeft_Radius),
                    bottomLeft: Radius.circular(bottomLeft_Radius),
                    topRight: Radius.circular(topRight_Radius),
                    bottomRight: Radius.circular(bottomRight_Radius),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.task,
                      style: TextStyle(fontSize: 13),
                    ),
                    Text(taskData['taskNumber'])
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(topLeft_Radius),
                      bottomRight: Radius.circular(bottomLeft_Radius),
                      topLeft: Radius.circular(topRight_Radius),
                      bottomLeft: Radius.circular(bottomRight_Radius),
                    ),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black, spreadRadius: 0, blurRadius: 1)
                    ],
                  ),
                  child: Container(
                    child: Center(
                      child: ListTile(
                        contentPadding: EdgeInsets.all(8),
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            taskData['title'],
                            style: getFontStyle(context).copyWith(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        subtitle: Text(
                          taskData["description"],
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: getFontStyle(context).copyWith(
                            fontSize: 14,
                            color: const Color.fromARGB(162, 0, 0, 0),
                          ),
                        ),
                        trailing: status == Status.inProgress
                            ? const RippleAnimation(
                                minRadius: 15,
                                duration: Duration(milliseconds: 3500),
                                delay: Duration(milliseconds: 1000),
                                repeat: true,
                                ripplesCount: 3,
                                color: Colors.orange,
                                child: SizedBox(
                                  width: 40,
                                  child: Icon(
                                    Icons.circle,
                                    color: Colors.orange,
                                    size: 20,
                                  ),
                                ),
                              )
                            : Image.asset(
                                statusImagePath,
                                width: 40,
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
