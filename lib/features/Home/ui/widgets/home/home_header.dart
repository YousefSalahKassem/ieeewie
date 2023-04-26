part of '../../mobile/home_page.dart';

class _HomeHeader extends ConsumerWidget {
  const _HomeHeader();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Trending\nNews",
              style: GoogleFonts.inriaSerif(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.2,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Image.asset(
                AppImages.flash,
                height: context.heightR(0.03),
                width: context.widthR(0.03),
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: (){
            ref.read(currentIndex.notifier).state = 3;
          },
          child: CustomProfileImage(
            radius: 22,
            imageUrl: ref.currentUser().photoUrl,
          ),
        )
      ],
    );
  }
}
