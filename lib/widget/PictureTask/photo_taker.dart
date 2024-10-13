import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/utils/utils.dart';
import 'package:illimited_app/widget/primary_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class PhotoTaker extends StatefulWidget {
  final Function(bool, File?) isPhotoTaken;
  const PhotoTaker({super.key, required this.isPhotoTaken});

  @override
  State<PhotoTaker> createState() => _PhotoTakerState();
}

class _PhotoTakerState extends State<PhotoTaker> {
  File? _selectedImage;

  final ImagePicker _picker = ImagePicker();
  Future<void> _takeSelfie() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
      widget.isPhotoTaken(true, _selectedImage);
    }
  }

  void _removeImage() {
    setState(() {
      _selectedImage = null;
    });
    widget.isPhotoTaken(false, null);
  }

  @override
  Widget build(BuildContext context) {
    double borderRadius = 12;
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DottedBorder(
            color: Colors.green,
            radius: Radius.circular(borderRadius),
            borderType: BorderType.RRect,
            dashPattern: [15, _selectedImage == null ? 6 : 0],
            strokeWidth: 3,
            padding: const EdgeInsets.all(1),
            strokeCap: StrokeCap.round,
            child: Container(
              width: double.infinity,
              height: getScreenHeight(context) * 0.4,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: _selectedImage != null
                  ? Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(borderRadius),
                          child: Image.file(
                            frameBuilder: (BuildContext context, Widget child,
                                int? frame, bool wasSynchronouslyLoaded) {
                              if (wasSynchronouslyLoaded) {
                                return child;
                              }
                              return frame == null
                                  ? const Center(
                                      child: SpinKitFoldingCube(
                                        color: Color.fromARGB(139, 0, 0, 0),
                                        size: 35,
                                      ),
                                    )
                                  : child;
                            },
                            _selectedImage!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 5,
                          right: 5,
                          child: GestureDetector(
                            onTap: _removeImage,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red.withOpacity(0.8),
                              ),
                              child: const Icon(Icons.close,
                                  color: Colors.white, size: 24),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            "assets/icon/imageUp.png",
                            width: 60,
                            color: const Color.fromARGB(160, 0, 0, 0),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            AppLocalizations.of(context)!.takePhotoToPreview,
                            style: getFontStyle(context).copyWith(
                                color: const Color.fromARGB(125, 0, 0, 0),
                                fontSize: 16),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          PrimaryButton(
                            width: getScreenWidth(context) * 0.22,
                            color: primaryColor.withOpacity(0.6),
                            height: 40,
                            fontSize: 16.5,
                            onPressed: _takeSelfie,
                            text: AppLocalizations.of(context)!.take,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Icon(Icons.warning_rounded, color: Colors.orange.withOpacity(0.6),),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                                AppLocalizations.of(context)!.pleaseTakePortraitPhotos,
                              textAlign: TextAlign.center,
                              style: getFontStyle(context).copyWith(
                                  color: const Color.fromARGB(225, 255, 153, 0).withOpacity(0.6),
                                  fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
