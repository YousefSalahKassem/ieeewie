part of '../../mobile/event_details_screen.dart';

class _AboutEvent extends StatelessWidget {
  final Event event;

  const _AboutEvent({required this.event});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 14,
          ),
          Text(
            event.title,
            style: GoogleFonts.lora(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
              height: 1,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          if (event.category != null)
            Text(
              "#${event.category}",
              style: GoogleFonts.nunito(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                height: 0,
              ),
            ),
          const SizedBox(
            height: 10,
          ),
          _Date(dateTime: event.startDate),
          const SizedBox(
            height: 10,
          ),
          _HostName(hostName: event.hostName),
          if (event.meetingLink != null)
            const SizedBox(
              height: 10,
            ),
          _MeetingLink(link: event.meetingLink),
          if (event.location != null)
            const SizedBox(
              height: 10,
            ),
          _Location(location: event.location),
        ],
      ),
    );
  }
}

class _HostName extends StatelessWidget {
  final String hostName;

  const _HostName({required this.hostName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.person,
          color: Colors.grey,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          hostName,
          style: GoogleFonts.nunito(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 14,
            height: 0,
          ),
        ),
      ],
    );
  }
}

class _Date extends StatelessWidget {
  final String dateTime;

  const _Date({required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.access_time,
          color: Colors.grey,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          LogicHelpers.formatDateTime(dateTime),
          style: GoogleFonts.nunito(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 14,
            height: 0,
          ),
        ),
      ],
    );
  }
}

class _MeetingLink extends StatelessWidget {
  final String? link;

  const _MeetingLink({this.link});

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = FirebaseAuth.instance.currentUser != null;

    if (link != null) {
      return Row(
        children: [
          const Icon(
            Icons.link,
            color: Colors.grey,
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () async {
              if (isLoggedIn) {
                await LogicHelpers.launchLink(link);
              } else {
                CustomAlertDialog.show(
                  context,
                  title: "You need to login first to explore",
                  onPressed: () async {
                    context.navigateTo(const LoginRoute());
                  },
                  positiveTitle: "Login",
                );
              }
            },
            child: Text(
              "Meeting link",
              style: GoogleFonts.nunito(
                color: Colors.blue,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                height: 0,
              ),
            ),
          ),
        ],
      );
    }
    return const SizedBox.shrink();
  }
}

class _Location extends StatelessWidget {
  final String? location;

  const _Location({this.location});

  @override
  Widget build(BuildContext context) {
    if (location != null) {
      return Row(
        children: [
          const Icon(
            Icons.location_on_outlined,
            color: Colors.grey,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            location!,
            style: GoogleFonts.nunito(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 14,
              height: 0,
            ),
          ),
        ],
      );
    }
    return const SizedBox.shrink();
  }
}
