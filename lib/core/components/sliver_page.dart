import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieeewie/core/themes/color.dart';

class SLiverPage extends StatelessWidget {
  final Widget body;
  final String title;
  const SLiverPage({required this.body,required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context,isScrolled){
            return [
              SliverAppBar(
                backgroundColor: AppColors.darkBackground,
                elevation: 0,
                centerTitle: true,
                snap: true,
                floating: true,
                title: Text(
                  title,
                  style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    height: 0,
                  ),
                ),
              )
            ];
          },
          body: body,
      ),
    );
  }
}
