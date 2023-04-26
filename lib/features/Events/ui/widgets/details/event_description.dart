part of '../../mobile/event_details_screen.dart';

class _EventDescription extends StatelessWidget {
  final Event event;

  const _EventDescription({required this.event});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 14,
          ),
          Text(
            "About Event",
            style: GoogleFonts.commissioner(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
              height: 1,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            event.description,
            style: GoogleFonts.nunito(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
              fontSize: 16,
              height: 1.4,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
