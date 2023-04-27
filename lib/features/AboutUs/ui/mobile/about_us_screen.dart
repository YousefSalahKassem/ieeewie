import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieeewie/core/components/sliver_page.dart';
import 'package:ieeewie/core/helpers/extensions.dart';
import 'package:ieeewie/features/AboutUs/model/about_us.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SLiverPage(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 10,),
              _AboutUsCard(
                description: AboutUs.iEEEEgypt.description!,
                image: AboutUs.iEEEEgypt.image!,
              ),
              const SizedBox(
                height: 10,
              ),
              _AboutUsCard(
                description: AboutUs.IEEEWIE.description!,
                image: AboutUs.IEEEWIE.image!,
              ),
              const SizedBox(
                height: 10,
              ),
              _AboutUsCard(
                description: AboutUs.IEEE.description!,
                image: AboutUs.IEEE.image!,
              ),
            ],
          ),
        ),
      ),
      title: "About Us",
    );
  }
}

class _AboutUsCard extends StatelessWidget {
  final String description;
  final String image;

  const _AboutUsCard({required this.description, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Image.asset(
            image,
            fit: BoxFit.contain,
            height: context.heightR(.2),
            width: context.width,
          ),
          const SizedBox(
            height: 24,
          ),
          ExpandableNotifier(
            child: Builder(
              builder: (context) {
                final controller = ExpandableController.of(context)!;
                final text = Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    controller.expanded
                        ? description
                        : description.substring(0, 200),
                    style: GoogleFonts.nunito(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expandable(
                      controller: controller,
                      collapsed: text,
                      expanded: text,
                    ),
                    if (description.length > 200)
                      const SizedBox(
                        height: 30,
                      ),
                    if (description.length > 200)
                      ElevatedButton(
                        onPressed: () {
                          controller.toggle();
                        },
                        child: Text(
                          controller.expanded ? "Show Less" : "Show More",
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
