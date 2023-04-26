part of '../mobile/login_screen.dart';

class _LoginForm extends ConsumerStatefulWidget {
  const _LoginForm();

  @override
  ConsumerState<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<_LoginForm> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authController = ref.read(AuthProvider.provider.notifier);

    ref.listen(AuthProvider.provider, (previous, next) {
      if (next.isSuccess) {
        context.router
            .pushAndPopUntil(const HomeRoute(), predicate: (_) => false);
      }
    });
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: authController.loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Login",
              style: context.textTheme.headlineLarge!
                  .copyWith(color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
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
              height: 10,
            ),
            Text(
              "Password",
              style: context.textTheme.headlineMedium!
                  .copyWith(color: Colors.white),
            ),
            AppTextField(
              controller: password,
              hint: "**********",
              isPassword: true,
              validator: (value) =>
                  value!.validate([validatePassword, validateRequired]),
            ),
            const SizedBox(
              height: 12,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  context.navigateTo(const ResetPasswordRoute());
                },
                child: Text(
                  "Forgot Password ?",
                  style: context.textTheme.headlineMedium!
                      .copyWith(color: AppColors.secondaryColor),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.loaderOverlay.show();
                  authController
                      .login(
                        UserModel(email: email.text, password: password.text),
                      )
                      .whenComplete(() => context.loaderOverlay.hide());
                },
                child: const Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
