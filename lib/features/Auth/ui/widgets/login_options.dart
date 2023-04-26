part of '../mobile/login_screen.dart';

class _LoginOptions extends ConsumerWidget {
  const _LoginOptions();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.read(AuthProvider.provider.notifier);
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            const Expanded(
              child: Divider(
                color: AppColors.darkGreyColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "OR",
                style: context.textTheme.titleLarge,
              ),
            ),
            const Expanded(
              child: Divider(
                color: AppColors.darkGreyColor,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: AppColors.white,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            onPressed: () {
              context.loaderOverlay.show();
              authController.loginWithGoogle().whenComplete(
                    () => context.loaderOverlay.hide(),
                  );
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SvgPicture.asset(
                    AppSvg.google,
                    height: 30,
                  ),
                ),
                const Spacer(),
                Text(
                  "Continue With Google",
                  style: context.textTheme.headlineMedium!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 15,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: AppColors.white,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            onPressed: () {
              context.navigateTo(const HomeRoute());
            },
            child: SizedBox(
              width: context.width,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    "Skip Login",
                    style: context.textTheme.headlineMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        AppTextRich(
          firstText: "Don't have an account ?",
          labelButton: "Register",
          onPressed: () {
            context.navigateTo(const RegisterRoute());
          },
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
