part of '../../mobile/event_details_screen.dart';

class _EventHeader extends StatelessWidget {
  final Event event;

  const _EventHeader({required this.event});

  @override
  Widget build(BuildContext context) {
    if (event.images != null && event.images!.isNotEmpty) {
      return ClipRRect(
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
      );
    }
    return const SafeArea(child: SizedBox.shrink());
  }
}
