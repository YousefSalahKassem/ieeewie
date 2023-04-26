part of '../mobile/register_screen.dart';

class _RegisterForm extends ConsumerStatefulWidget {
  const _RegisterForm();

  @override
  ConsumerState<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<_RegisterForm> {
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    phone.dispose();
    name.dispose();
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
        key: authController.registerFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Register",
              style: context.textTheme.headlineLarge!
                  .copyWith(color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Name",
              style: context.textTheme.headlineMedium!
                  .copyWith(color: Colors.white),
            ),
            AppTextField(
              controller: name,
              hint: "ieeewie",
              validator: (value) => value!.validate([validateRequired]),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Phone",
              style: context.textTheme.headlineMedium!
                  .copyWith(color: Colors.white),
            ),
            AppTextField(
              controller: phone,
              hint: "+2012345678",
              inputType: TextInputType.phone,
              validator: (value) =>
                  value!.validate([validatePhone, validateRequired]),
            ),
            const SizedBox(
              height: 10,
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
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.loaderOverlay.show();
                  authController
                      .register(
                        UserModel(
                          email: email.text,
                          password: password.text,
                          name: name.text,
                          phoneNumber: phone.text,
                        ),
                      )
                      .whenComplete(() => context.loaderOverlay.hide());
                },
                child: const Text("Register"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: AppTextRich(
                firstText: "Already have an account ?",
                labelButton: "Login",
                onPressed: () {
                  context.navigateBack();
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
