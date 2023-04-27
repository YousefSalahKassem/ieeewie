part of '../../mobile/event_details_screen.dart';

class _EventHeader extends StatelessWidget {
  final Event event;

  const _EventHeader({required this.event});

  @override
  Widget build(BuildContext context) {
    if (event.images != null && event.images!.isNotEmpty) {
      return Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            child: Hero(
              tag: event.id,
              child: CachedNetworkImage(
                imageUrl: event.images![0].toString(),
                fit: BoxFit.cover,
                height: context.heightR(0.45),
                width: context.width,
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: GestureDetector(
              onTap: () => context.navigateBack(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(
                          AppImages.noisy,
                        ),
                        fit: BoxFit.cover,
                        opacity: 0.05,
                      ),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white60,
                          Colors.white10,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }
    return const SafeArea(child: SizedBox.shrink());
  }
}
