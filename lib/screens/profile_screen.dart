import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/router/router_names.dart';
import 'package:illimited_app/services/authentication_service.dart';
import 'package:illimited_app/services/user_repository.dart';
import 'package:illimited_app/utils/utils.dart';
import 'package:illimited_app/widget/primary_button.dart';
import 'package:illimited_app/widget/profile_frame.dart';
import 'package:illimited_app/widget/top_snackbar.dart';
import 'package:lottie/lottie.dart';
import 'package:modern_textfield/modern_textfield.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _fNameController = TextEditingController();
  TextEditingController _lNameController = TextEditingController();
  TextEditingController _emailNameController = TextEditingController();

  Color _fontColor = Colors.black;
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      AuthService().signOut();
    }
    String userDisplayName = user!.displayName!;

    if (user.displayName != null) {
      if (user.displayName!.split(" ").length == 1) {
        _fNameController.text = user.displayName!.split(" ")[0];
      } else {
        _fNameController.text = user.displayName!.split(" ")[0];
        _lNameController.text = user.displayName!.split(" ")[1];
      }
    }
    _emailNameController.text = user.email!;

    return SafeArea(
      child: PopScope(
        canPop: false,
        child: Scaffold(
          appBar: AppBar(
            leading: InkWell(
                onTap: () {
                  if (isEditing) {
                    showConfirmationDialog(context,
                        "Are you sure you want to discard changes ?", true);
                  } else {
                    context.pop();
                  }
                },
                child: const Icon(Icons.arrow_back)),
            actions: [
              Visibility(
                visible: !isEditing,
                child: InkWell(
                  onTap: () => openEdit(),
                  child: const Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Icon(Icons.edit),
                  ),
                ),
              )
            ],
            backgroundColor: Colors.transparent,
          ),
          body: Stack(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Column(
                  children: [
                    ProfileFrame(
                      image: user.photoURL,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      userDisplayName,
                      style:
                          GoogleFonts.aBeeZee(fontSize: 20, color: _fontColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 20,
                    ),
                    AbsorbPointer(
                      absorbing: !isEditing,
                      child: ModernTextField(
                        textFieldTextStyle: getFontStyle(context).copyWith(
                            color: isEditing
                                ? Colors.black
                                : const Color.fromARGB(255, 177, 177, 177),
                            fontSize: 18),
                        textEditingController: _fNameController,
                        iconBackgroundColor: isEditing
                            ? primaryColor
                            : primaryColor.withOpacity(0.2),
                        borderRadius: 20,
                        customTextFieldIcon: const Icon(
                          Icons.person_rounded,
                          color: Colors.white,
                        ),
                        hintText: "First Name",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AbsorbPointer(
                      absorbing: !isEditing,
                      child: ModernTextField(
                        textFieldTextStyle: getFontStyle(context).copyWith(
                            color: isEditing
                                ? Colors.black
                                : const Color.fromARGB(255, 177, 177, 177),
                            fontSize: 18),
                        textEditingController: _lNameController,
                        iconBackgroundColor: isEditing
                            ? primaryColor
                            : primaryColor.withOpacity(0.2),
                        borderRadius: 20,
                        customTextFieldIcon: const Icon(
                          Icons.person_rounded,
                          color: Colors.white,
                        ),
                        hintText: "Last Name",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Tooltip(
                      triggerMode: TooltipTriggerMode.tap,
                      message: _emailNameController.text,
                      child: AbsorbPointer(
                        absorbing: true,
                        child: ModernTextField(
                          textFieldTextStyle: getFontStyle(context).copyWith(
                              color: const Color.fromARGB(255, 177, 177, 177),
                              fontSize: 18),
                          textEditingController: _emailNameController,
                          iconBackgroundColor: primaryOrange.withOpacity(0.2),
                          borderRadius: 20,
                          customTextFieldIcon: const Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          hintText: "Email",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              Visibility(
                visible: isEditing,
                child: Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: PrimaryButton(
                          color: errorColor,
                          text: "Cancel",
                          onPressed: () {
                            showConfirmationDialog(
                                context,
                                "Are you sure you want to discard changes ?",
                                false);
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 3,
                        child: PrimaryButton(
                          text: "Save",
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            String firstName = _fNameController.text.trim();
                            String lastName = _lNameController.text.trim();
                            if (firstName.length < 2 || lastName.length < 2) {
                              mySnackBar(
                                  context: context,
                                  message: "Name must be at least 2 character",
                                  snackBarType: SnackBarType.info);
                            } else {
                              setState(() {
                                isEditing = false;
                              });
                  
                              user.updateDisplayName("$firstName $lastName").then(
                                (value) {
                                  mySnackBar(
                                      context: context,
                                      message: "Profile Updated Successfully!");
                  
                                  _fNameController.text = firstName;
                                  _lNameController.text = lastName;
                  
                                  setState(() {
                                    userDisplayName = "$firstName $lastName";
                                  });
                                  UserRepository().update({
                                    'firstname': firstName,
                                    'lastname': lastName,
                                  });
                                },
                              ).onError(
                                (error, stackTrace) {
                                  mySnackBar(
                                      context: context,
                                      message: "Profile Updated Successfully!",
                                      snackBarType: SnackBarType.failure);
                                  log("ERROR UPDATING PROFILE : $error");
                                },
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openEdit() {
    setState(() {
      isEditing = true;
    });
  }

  void showConfirmationDialog(
      BuildContext context, String message, bool isPoping) {
    Widget yesButton = PrimaryButton(
      text: "Discard",
      onPressed: () {
        setState(() {
          isEditing = false;
          context.pop();
          if (isPoping) {
            context.pop();
          }
        });
      },
      width: getScreenWidth(context) * 0.30,
      color: errorColor,
    );

    Widget noButton = PrimaryButton(
      text: "No",
      color: Colors.grey,
      onPressed: () {
        context.pop();
      },
      width: getScreenWidth(context) * 0.30,
    );

    AlertDialog alert = AlertDialog(
      actionsOverflowButtonSpacing: 20,
      icon: Lottie.asset(
        "assets/lottie/info.json",
        height: 100,
        // width: 10,
      ),
      backgroundColor: Color.fromARGB(255, 213, 236, 255),
      content: Text(
        message,
        style: getFontStyle(context).copyWith(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        textAlign: TextAlign.center,
      ),
      actions: [noButton, yesButton],
      actionsAlignment: MainAxisAlignment.center,
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
