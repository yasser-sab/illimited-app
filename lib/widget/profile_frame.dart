import 'package:flutter/material.dart';

class ProfileFrame extends StatelessWidget {
  final String? image;
  final double size;
  final bool canEditPicture;
  final VoidCallback? onPressed;
  final bool isLoading;
  const ProfileFrame(
      {super.key,
      this.image,
      this.size = 100,
      this.canEditPicture = false,
      this.onPressed,
      this.isLoading = false});


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFFD7D7D7),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(width: 1)),
            width: size,
            height: size,
            child: ClipOval(
              child: isLoading
                  ? Container(
                      width: 100,
                      height: 100,
                      color: Colors.grey,
                    )
                  : image != null
                      ? Image.network(
                          image!,
                          fit: BoxFit.cover,
                        )
                      : Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset(
                            image ?? "assets/icon/defaultUser.png",
                            width: size * 0.8,
                            height: size * 0.8,
                            fit: BoxFit.contain,
                          ),
                        ),
            ),
          ),
        ),
        Visibility(
          visible: canEditPicture,
          child: Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: onPressed,
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.cyan,
                    border: Border.all(width: 2, color: Colors.white)),
                child: Center(
                  child: SizedBox(
                      width: 20,
                      height: 20,
                      child: Image.asset(
                        "assets/icon/pencil.png",
                      )),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
