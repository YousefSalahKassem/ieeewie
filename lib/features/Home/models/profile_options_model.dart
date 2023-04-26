import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ieeewie/core/routes/router.gr.dart';

class ProfileOptionsModel {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  ProfileOptionsModel({required this.icon, required this.title,required this.onTap});

  static  List<ProfileOptionsModel> settings (BuildContext context) => [
    ProfileOptionsModel(icon: Icons.edit_outlined, title: "Edit Profile", onTap:() => context.navigateTo(const EditProfileRoute())),
    ProfileOptionsModel(icon: Icons.chat_outlined, title: "Contact Us", onTap:() => context.navigateTo(const ContactUsRoute())),
  ];

  static List<ProfileOptionsModel> options (BuildContext context) => [
    ProfileOptionsModel(icon: Icons.info_outline_rounded, title: "About Us" , onTap:() => context.navigateTo(const AboutUsRoute())),
    ProfileOptionsModel(icon: Icons.people_outline, title: "Board" , onTap:() => context.navigateTo(const BoardRoute())),
    ProfileOptionsModel(icon: Icons.rocket_launch_outlined, title: "Mission" , onTap:() => context.navigateTo(const MissionRoute())),
    ProfileOptionsModel(icon: Icons.remove_red_eye_outlined, title: "Vision" , onTap:() => context.navigateTo(const VisionRoute())),
    ProfileOptionsModel(icon: Icons.card_membership_outlined, title: "Membership" , onTap:() => context.navigateTo(const MemberShipRoute())),
  ];
}
