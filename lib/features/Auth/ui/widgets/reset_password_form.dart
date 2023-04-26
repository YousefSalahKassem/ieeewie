part of '../mobile/reset_password_screen.dart';

class _ResetPasswordForm extends ConsumerStatefulWidget {
  const _ResetPasswordForm();

  @override
  ConsumerState<_ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends ConsumerState<_ResetPasswordForm> {
  final TextEditingController email = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authController = ref.read(AuthProvider.provider.notifier);

    return Form(
      key: authController.resetPasswordFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email",
              style: context.textTheme.headlineMedium!
                  .copyWith(color: Colors.white),
            ),
            AppTextField(
              controller: email,
              hint: "hello@company.com",
              inputType: TextInputType.emailAddress,
              validator: (value) =>
                  value!.validate([validateEmail, validateRequired]),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: context.width,
              child: ElevatedButton(
                onPressed: () async {
                  context.loaderOverlay.show();
                  final isReset = await authController
                      .resetPassword(email.text)
                      .whenComplete(() => context.loaderOverlay.hide());
                  if (isReset) {
                    context.navigateBack();
                  }
                },
                child: const Text("Reset"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: context.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                onPressed: () {
                  context.navigateBack();
                },
                child: const Text("Cancel"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
