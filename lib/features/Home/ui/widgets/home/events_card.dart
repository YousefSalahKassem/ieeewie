import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieeewie/core/components/custom_profile_image.dart';
import 'package:ieeewie/core/helpers/app_images.dart';
import 'package:ieeewie/core/helpers/app_svg.dart';
import 'package:ieeewie/core/helpers/extensions.dart';
import 'package:ieeewie/core/helpers/logic_helpers.dart';
import 'package:ieeewie/core/routes/router.gr.dart';
import 'package:ieeewie/core/themes/color.dart';
import 'package:ieeewie/features/Events/blocs/provider/events_local_provider.dart';
import 'package:ieeewie/features/Events/model/event.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final bool isHome;

  const EventCard({required this.event, required this.isHome});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.navigateTo(EventDetailsRoute(event: event));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const CustomProfileImage(
                    radius: 20,
                    imageUrl: AppImages.bot,
                    isAsset: true,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Alexa",
                          style: context.textTheme.headlineMedium!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            height: 0,
                          ),
                        ),
                        Text(
                          "IEEE Bot",
                          style: context.textTheme.headlineSmall!.copyWith(
                            color: AppColors.white.withOpacity(0.7),
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  _SaveButton(
                    event: event,
                    isHome: isHome,
                  ),
                ],
              ),
              if (event.category != null)
                const SizedBox(
                  height: 20,
                ),
              if (event.category != null)
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: AppColors.borderColor),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: Text(
                      event.category!,
                      style: context.textTheme.headlineMedium!
                          .copyWith(color: AppColors.secondaryColor),
                    ),
                  ),
                ),
              Text(
                event.title,
                style: GoogleFonts.lora(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  height: 1.5,
                ),
                maxLines: 2,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                LogicHelpers.formatDateTimeString(event.startDate),
                style: GoogleFonts.nunito(
                  color: Colors.white.withOpacity(0.7),
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
                maxLines: 1,
              ),
              if (event.images != null)
                const SizedBox(
                  height: 20,
                ),
              if (event.images != null)
                Hero(
                  tag: event.id,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: event.images![0].toString(),
                      fit: BoxFit.cover,
                      height: context.heightR(0.2),
                      width: context.width,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SaveButton extends ConsumerWidget {
  final Event event;
  final bool isHome;

  const _SaveButton({required this.event, required this.isHome});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventController = ref.watch(EventsLocalProvider.provider.notifier);
    final isExist = ref.watch(EventsLocalProvider.provider).checkIfExist(event);
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        backgroundColor:
            isExist ? AppColors.secondaryColor : Colors.transparent,
        side: BorderSide(
          color: !isExist ? AppColors.secondaryColor : Colors.transparent,
        ),
        elevation: 0,
      ),
      onPressed: () {
        if (isHome) {
          eventController.addEvent(event);
        } else {
          eventController.removeItem(event);
        }
      },
      icon: SvgPicture.asset(isExist ? AppSvg.saveFill : AppSvg.save),
      label: Text(
        isExist ? "Saved" : "Save",
        style: context.textTheme.headlineMedium!.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
