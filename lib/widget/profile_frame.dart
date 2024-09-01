import 'package:flutter/material.dart';

class ProfileFrame extends StatelessWidget {
  final String? image;
  final double size;
  const ProfileFrame({super.key, this.image, this.size = 100});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Color(0xFFD7D7D7),
              borderRadius: BorderRadius.circular(50),
              border: Border.all(width: 1)),
          width: size,
          height: size,
          child: ClipOval(
            child: image != null
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
        // Positioned(
        //   bottom: 0,
        //   right: 0,
        //   child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)), child: Icon(Icons.edit)),
        // ),
      ],
    );
  }
}
