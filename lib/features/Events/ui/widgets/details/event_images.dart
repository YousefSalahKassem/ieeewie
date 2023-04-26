part of '../../mobile/event_details_screen.dart';

class _EventImages extends StatelessWidget {
  final Event event;

  const _EventImages({required this.event});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(16),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: event.images!.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        final image = event.images![index].toString();
        return OpenContainer(
          transitionDuration: const Duration(milliseconds: 400),
          closedElevation: 0,
          openElevation: 0,
          openColor: AppColors.darkBackground,
          closedColor: AppColors.darkBackground,
          closedBuilder: (context, action) {
            return InteractiveViewer(child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.cover,
              ),
            ),);
          },
          openBuilder: (context, action) {
            return _FullScreenImage(image: image);
          },
        );
      },
    );
  }
}

class _FullScreenImage extends StatelessWidget {
  const _FullScreenImage({
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: InteractiveViewer(
            child: CachedNetworkImage(
              imageUrl: image,
            ),
          ),
        ),
      ),
    );
  }
}
