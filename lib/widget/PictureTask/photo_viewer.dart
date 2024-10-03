import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:photo_view/photo_view.dart';

class FullScreenImageView extends StatelessWidget {
  final String imageUrl;
final String heroTag;
  const FullScreenImageView({Key? key, required this.imageUrl, required this.heroTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        toolbarHeight: 80,
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          'Photo',
          style:
              GoogleFonts.roboto().copyWith(fontSize: 27, letterSpacing: 1.5),
        ),
      ),
      body: Center(
        child: Hero(
          tag: heroTag,
          child: PhotoView(
            minScale: PhotoViewComputedScale.contained,
            imageProvider: NetworkImage(imageUrl),
            backgroundDecoration: const BoxDecoration(
              color: Colors.white, // Change to match your theme or background
            ),
          ),
        ),
      ),
    );
  }
}
