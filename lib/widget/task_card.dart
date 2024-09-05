import 'package:flutter/material.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/utils/utils.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.status});
  final Status status;

  @override
  Widget build(BuildContext context) {
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
    double borderRadius = 10;
    double cardHeight = 150;
    return SizedBox(
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
                  topLeft: Radius.circular(borderRadius),
                  bottomLeft: Radius.circular(borderRadius),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Task",
                    style: TextStyle(fontSize: 13),
                  ),
                  Text("1")
                ],
              ),
            ),

            // Title section
            Expanded(
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(borderRadius),
                    bottomRight: Radius.circular(borderRadius),
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
                          "Take a selfie",
                          style: getFontStyle(context).copyWith(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      subtitle: Text(
                        "This task need asd asd asdasd ad asdasd  asd sa asd asd  sdfsfs sdf s sdfsdf  sdfsto take a selfie with your camera",
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
    );
  }
}
