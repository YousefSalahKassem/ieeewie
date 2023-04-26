part of '../../mobile/profile_page.dart';

class _ProfileOptions extends ConsumerWidget {
  const _ProfileOptions();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggedIn = FirebaseAuth.instance.currentUser != null;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Card(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final option = ProfileOptionsModel.settings(
                  context,
                )[index + (isLoggedIn ? 0 : 1)];
                return _OptionTile(option: option);
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: AppColors.dividerDarkColor,
                );
              },
              itemCount: ProfileOptionsModel.settings(context).length -
                  (isLoggedIn ? 0 : 1),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Card(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final option = ProfileOptionsModel.options(context)[index];
                return _OptionTile(option: option);
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: AppColors.dividerDarkColor,
                );
              },
              itemCount: ProfileOptionsModel.options(context).length,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          if (isLoggedIn)
            SizedBox(
              width: context.width,
              child: GestureDetector(
                onTap: () async {
                  final isConnected = await LogicHelpers.checkInternetConnectivity();
                  if(isConnected) {
                    CustomAlertDialog.show(
                      context,
                      title: "Are you sure you want to logout ?",
                      positiveTitle: "Logout",
                      onPressed: () async {
                        final inAppReview = InAppReview.instance;
                        await ref
                            .read(AuthProvider.provider.notifier)
                            .signOut()
                            .whenComplete(() async {
                          if (await inAppReview.isAvailable()) {
                            inAppReview.requestReview();
                          }
                          context.router.pushAndPopUntil(
                            const LoginRoute(),
                            predicate: (_) => false,
                          );
                        });
                      },
                    );
                  } else {
                    NetworkAlertDialog.show(context);
                  }
                },
                child: Card(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "Logout",
                        style: GoogleFonts.lora(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}

class _OptionTile extends StatelessWidget {
  final ProfileOptionsModel option;

  const _OptionTile({required this.option});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: false,
      minVerticalPadding: 0,
      onTap: option.onTap,
      leading: Icon(
        option.icon,
        color: Colors.white,
      ),
      title: Text(
        option.title,
        style: GoogleFonts.nunito(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          height: 0,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: AppColors.secondaryColor,
      ),
    );
  }
}
