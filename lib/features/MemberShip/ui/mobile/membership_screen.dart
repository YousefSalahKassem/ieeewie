import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieeewie/core/components/custom_app_bar.dart';
import 'package:ieeewie/core/components/custom_loader.dart';
import 'package:ieeewie/core/helpers/app_svg.dart';
import 'package:ieeewie/core/helpers/extensions.dart';
import 'package:ieeewie/core/helpers/logic_helpers.dart';
import 'package:ieeewie/core/themes/color.dart';
import 'package:ieeewie/features/MemberShip/blocs/membership_notifier.dart';
import 'package:ieeewie/features/MemberShip/model/membership.dart';

class MemberShipScreen extends ConsumerWidget {
  const MemberShipScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Membership"),
      body: SafeArea(
        child: StreamBuilder<List<Membership>>(
          stream: ref.watch(MembershipNotifier.provider).getBenefits(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return SvgPicture.asset(AppSvg.error);
            } else if (snapshot.hasData) {
              final benefits = snapshot.data!;
              benefits.sort((a, b) => a.id.compareTo(b.id));
              return ListView.builder(
                shrinkWrap: true,
                itemCount: benefits.length,
                itemBuilder: (context, index) {
                  final item = benefits[index];
                  return _MemberShipCard(membershipItem: item);
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
      ),
    );
  }
}

class _MemberShipCard extends StatefulWidget {
  final Membership membershipItem;

  const _MemberShipCard({required this.membershipItem});

  @override
  State<_MemberShipCard> createState() => _MemberShipCardState();
}

class _MemberShipCardState extends State<_MemberShipCard> {
  late ExpandedTileController _controller;

  @override
  void initState() {
    _controller = ExpandedTileController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: widget.membershipItem.benefits != null
            ? ExpandedTile(
                expansionDuration: const Duration(milliseconds: 400),
                expansionAnimationCurve: Curves.fastOutSlowIn,
                theme: const ExpandedTileThemeData(
                  contentBackgroundColor: AppColors.darkForeground,
                  headerColor: AppColors.darkForeground,
                  headerSplashColor: Colors.transparent,
                ),
                title: Text(
                  widget.membershipItem.title,
                  style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    height: 0,
                  ),
                ),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.membershipItem.description != null)
                      Text(
                        widget.membershipItem.description!,
                        style: GoogleFonts.nunito(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          height: 0,
                        ),
                      ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.membershipItem.benefits!.length,
                      itemBuilder: (context, index) {
                        final item = widget.membershipItem.benefits![index];
                        return ListTile(
                          dense: true,
                          minVerticalPadding: 0,
                          contentPadding: EdgeInsets.zero,
                          leading: const CircleAvatar(
                            radius: 8,
                            backgroundColor: AppColors.secondaryColor,
                          ),
                          onTap: () async {
                            if (item.link != null) {
                              await LogicHelpers.launchLink(item.title);
                            }
                          },
                          minLeadingWidth: 0,
                          title: Text(
                            item.title,
                            style: GoogleFonts.nunito(
                              color: item.link != null
                                  ? Colors.blue
                                  : Colors.white,
                              decoration: item.link != null
                                  ? TextDecoration.underline
                                  : null,
                              decorationColor:
                                  item.link != null ? Colors.blue : null,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              height: 0,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          color: AppColors.dividerDarkColor,
                        );
                      },
                    )
                  ],
                ),
                controller: _controller,
              )
            : Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  child: Text(
                    widget.membershipItem.title,
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      height: 0,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
