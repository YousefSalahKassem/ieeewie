import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieeewie/core/components/custom_app_bar.dart';
import 'package:ieeewie/core/themes/color.dart';
import 'package:ieeewie/features/AboutUs/model/about_us.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MissionScreen extends StatelessWidget {
  const MissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mission = AboutUs.mission.points!;
    return Scaffold(
      appBar: const CustomAppBar(title: "Mission"),
      body: SingleChildScrollView(
        child: FadeInUp(
          child: Container(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Column(
              children: [
                //1
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.1,
                  isFirst: true,
                  indicatorStyle: IndicatorStyle(
                    width: 40,
                    height: 40,
                    indicator: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.secondaryColor,
                      ),
                      child: const Center(
                        child: Text(
                          "1",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  afterLineStyle:
                      const LineStyle(color: AppColors.secondaryColor),
                  endChild: Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                      left: 40,
                      right: 10,
                      bottom: 10,
                    ),
                    child: Text(
                      mission[0],
                      textAlign: TextAlign.right,
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const TimelineDivider(
                  thickness: 4,
                  begin: 0.1,
                  end: 0.9,
                  color: AppColors.secondaryColor,
                ),
                //2
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.9,
                  beforeLineStyle:
                      const LineStyle(color: AppColors.secondaryColor),
                  afterLineStyle:
                      const LineStyle(color: AppColors.secondaryColor),
                  indicatorStyle: IndicatorStyle(
                    width: 40,
                    height: 40,
                    indicator: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.secondaryColor,
                      ),
                      child: const Center(
                        child: Text(
                          "2",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  startChild: Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      bottom: 10,
                      left: 10,
                      right: 40,
                    ),
                    child: Text(
                      mission[1],
                      textAlign: TextAlign.left,
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const TimelineDivider(
                  thickness: 4,
                  color: AppColors.secondaryColor,
                  begin: 0.055,
                  end: 0.9,
                ),

                //3
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.01,
                  indicatorStyle: IndicatorStyle(
                    width: 40,
                    height: 40,
                    indicator: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.secondaryColor,
                      ),
                      child: const Center(
                        child: Text(
                          "3",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  beforeLineStyle:
                      const LineStyle(color: AppColors.secondaryColor),
                  endChild: Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                      left: 50,
                      right: 10,
                    ),
                    child: Text(
                      mission[2],
                      textAlign: TextAlign.right,
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const TimelineDivider(
                  thickness: 4,
                  color: AppColors.secondaryColor,
                  begin: 0.055,
                  end: 0.945,
                ),

                //4
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.99,
                  indicatorStyle: IndicatorStyle(
                    width: 40,
                    height: 40,
                    indicator: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.secondaryColor,
                      ),
                      child: const Center(
                        child: Text(
                          "4",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  beforeLineStyle:
                      const LineStyle(color: AppColors.secondaryColor),
                  afterLineStyle:
                      const LineStyle(color: AppColors.secondaryColor),
                  startChild: Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                      bottom: 10,
                      left: 50,
                      right: 20,
                    ),
                    child: Text(
                      mission[3],
                      textAlign: TextAlign.left,
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const TimelineDivider(
                  begin: 0.055,
                  end: 0.945,
                  thickness: 4,
                  color: AppColors.secondaryColor,
                ),
                //5
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.01,
                  indicatorStyle: IndicatorStyle(
                    width: 40,
                    height: 40,
                    indicator: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.secondaryColor,
                      ),
                      child: const Center(
                        child: Text(
                          "5",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  beforeLineStyle:
                      const LineStyle(color: AppColors.secondaryColor),
                  endChild: Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                      left: 50,
                      right: 10,
                    ),
                    child: Text(
                      mission[4],
                      textAlign: TextAlign.right,
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const TimelineDivider(
                  thickness: 4,
                  color: AppColors.secondaryColor,
                  begin: 0.055,
                  end: 0.945,
                ),

                //6
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.99,
                  indicatorStyle: IndicatorStyle(
                    width: 40,
                    height: 40,
                    indicator: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.secondaryColor,
                      ),
                      child: const Center(
                        child: Text(
                          "6",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  beforeLineStyle:
                      const LineStyle(color: AppColors.secondaryColor),
                  afterLineStyle:
                      const LineStyle(color: AppColors.secondaryColor),
                  startChild: Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                      bottom: 10,
                      left: 50,
                      right: 20,
                    ),
                    child: Text(
                      mission[5],
                      textAlign: TextAlign.left,
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const TimelineDivider(
                  begin: 0.055,
                  end: 0.945,
                  thickness: 4,
                  color: AppColors.secondaryColor,
                ),
                //7
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.01,
                  indicatorStyle: IndicatorStyle(
                    width: 40,
                    height: 40,
                    indicator: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.secondaryColor,
                      ),
                      child: const Center(
                        child: Text(
                          "7",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  beforeLineStyle:
                      const LineStyle(color: AppColors.secondaryColor),
                  endChild: Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                      left: 50,
                      right: 10,
                    ),
                    child: Text(
                      mission[6],
                      textAlign: TextAlign.right,
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const TimelineDivider(
                  thickness: 4,
                  color: AppColors.secondaryColor,
                  begin: 0.055,
                  end: 0.945,
                ),

                //8
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.99,
                  isLast: true,
                  indicatorStyle: IndicatorStyle(
                    width: 40,
                    height: 40,
                    indicator: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.secondaryColor,
                      ),
                      child: const Center(
                        child: Text(
                          "8",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  beforeLineStyle:
                      const LineStyle(color: AppColors.secondaryColor),
                  afterLineStyle:
                      const LineStyle(color: AppColors.secondaryColor),
                  startChild: Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                      bottom: 10,
                      left: 50,
                      right: 20,
                    ),
                    child: Text(
                      mission[7],
                      textAlign: TextAlign.left,
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
