part of '../../mobile/profile_page.dart';

class _ProfileInformation extends ConsumerWidget {
  const _ProfileInformation();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Text(
          ref.currentUser().name,
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
          ref.currentUser().email,
          style: GoogleFonts.nunito(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
            fontSize: 14,
            height: 0,
          ),
        )
      ],
    );
  }
}
