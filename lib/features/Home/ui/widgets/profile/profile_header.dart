part of '../../mobile/profile_page.dart';

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.heightR(0.28),
      child: Stack(
        children: const [
          _ProfileBackground(),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _ProfileImage(),
          ),
        ],
      ),
    );
  }
}

class _ProfileBackground extends StatelessWidget {
  const _ProfileBackground();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.background,
      fit: BoxFit.cover,
      width: context.width,
      height: context.heightR(0.2),
    );
  }
}

class _ProfileImage extends ConsumerWidget {
  const _ProfileImage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CircleAvatar(
      backgroundColor: AppColors.darkBackground,
      radius: 60.0,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 55.0,
        child: CustomProfileImage(
          radius: 50,
          imageUrl: ref.currentUser().photoUrl,
        ),
      ),
    );
  }
}
