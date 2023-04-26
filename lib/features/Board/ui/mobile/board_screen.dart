import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieeewie/core/components/custom_app_bar.dart';
import 'package:ieeewie/core/components/custom_loader.dart';
import 'package:ieeewie/core/components/custom_profile_image.dart';
import 'package:ieeewie/core/helpers/app_svg.dart';
import 'package:ieeewie/core/helpers/extensions.dart';
import 'package:ieeewie/features/Board/blocs/board_notifier.dart';
import 'package:ieeewie/features/Board/model/board.dart';

class BoardScreen extends ConsumerWidget {
  const BoardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Board"),
      body: StreamBuilder<List<Board>>(
        stream: ref.watch(BoardNotifier.provider).getTeam(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return SvgPicture.asset(AppSvg.error);
          } else if (snapshot.hasData) {
            final team = snapshot.data!;
            team.sort((a, b) => a.id.compareTo(b.id));
            return ListView.builder(
              itemCount: team.length,
              itemBuilder: (context, index) {
                final member = team[index];

                return _MemberCard(
                  member: member,
                );
              },
            );
          } else {
            return Padding(
              padding: EdgeInsets.only(top: context.heightR(0.25)),
              child: const Center(
                child: CustomLoader(),
              ),
            );
          }
        },
      ),
    );
  }
}

class _MemberCard extends StatelessWidget {
  final Board member;

  const _MemberCard({required this.member});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Card(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            CustomProfileImage(
              radius: 90,
              imageUrl: member.image,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              member.name,
              style: GoogleFonts.lora(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
                height: 1,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              member.role,
              style: GoogleFonts.nunito(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                height: 0,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            ExpandableNotifier(
              child: Builder(
                builder: (context) {
                  final controller = ExpandableController.of(context)!;
                  final description = Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      controller.expanded
                          ? member.description
                          : member.description.substring(0, 200),
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
                        collapsed: description,
                        expanded: description,
                      ),
                      if (member.description.length > 200)
                        const SizedBox(height: 30,),
                      if (member.description.length > 200)
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
      ),
    );
  }
}
