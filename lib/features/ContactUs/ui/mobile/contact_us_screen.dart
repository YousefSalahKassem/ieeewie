import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ieeewie/core/components/app_text_field.dart';
import 'package:ieeewie/core/components/sliver_page.dart';
import 'package:ieeewie/core/dialogs/network_alert_dialog.dart';
import 'package:ieeewie/core/helpers/extensions.dart';
import 'package:ieeewie/core/helpers/logic_helpers.dart';
import 'package:ieeewie/core/helpers/validations.dart';
import 'package:ieeewie/features/ContactUs/blocs/contact_us_notifier.dart';
import 'package:ieeewie/features/ContactUs/model/contact_us.dart';
import 'package:loader_overlay/loader_overlay.dart';

class ContactUsScreen extends ConsumerWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(ContactUsNotifier.provider, (previous, next) {
      if (next.isSuccess) {
        context.navigateBack();
      }
    });
    return const SLiverPage(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(child: _ContactUsForm(),),
      ),
      title: "Contact Us",
    );
  }
}

class _ContactUsForm extends ConsumerStatefulWidget {
  const _ContactUsForm();

  @override
  ConsumerState<_ContactUsForm> createState() => _ContactUsFormState();
}

class _ContactUsFormState extends ConsumerState<_ContactUsForm> {
  final TextEditingController name = TextEditingController();
  final TextEditingController message = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController subject = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    message.dispose();
    email.dispose();
    subject.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: ref.watch(ContactUsNotifier.provider.notifier).contactUsKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Name",
            style:
                context.textTheme.headlineMedium!.copyWith(color: Colors.white),
          ),
          AppTextField(
            controller: name,
            hint: "ieeewie",
            maxLength: 50,
            maxLines: 1,
            validator: (value) => value!.validate([validateRequired]),
          ),
          Text(
            "Email",
            style:
                context.textTheme.headlineMedium!.copyWith(color: Colors.white),
          ),
          AppTextField(
            controller: email,
            hint: "hello@company.com",
            inputType: TextInputType.emailAddress,
            maxLength: 50,
            maxLines: 1,
            validator: (value) =>
                value!.validate([validateEmail, validateRequired]),
          ),
          Text(
            "Subject",
            style:
                context.textTheme.headlineMedium!.copyWith(color: Colors.white),
          ),
          AppTextField(
            controller: subject,
            hint: "Machine Learning",
            maxLength: 50,
            maxLines: 1,
            validator: (value) => value!.validate([validateRequired]),
          ),
          Text(
            "Message",
            style:
                context.textTheme.headlineMedium!.copyWith(color: Colors.white),
          ),
          AppTextField(
            maxLines: 8,
            maxLength: 500,
            controller: message,
            hint: "write something you need to share with us!",
            validator: (value) => value!.validate([validateRequired]),
          ),
          SizedBox(
            height: context.heightR(0.03),
          ),
          SizedBox(
            width: context.width,
            child: ElevatedButton(
              onPressed: () async {
                final isConnected =
                    await LogicHelpers.checkInternetConnectivity();
                if (isConnected) {
                  context.loaderOverlay.show();
                  ref
                      .read(ContactUsNotifier.provider.notifier)
                      .sendMessage(
                        ContactUs(
                          name: name.text,
                          email: email.text,
                          id: DateTime.now().toString(),
                          subject: subject.text,
                          message: message.text,
                        ),
                      )
                      .whenComplete(
                        () => context.loaderOverlay.hide(),
                      );
                } else {
                  NetworkAlertDialog.show(context);
                }
              },
              child: const Text("Send"),
            ),
          ),
        ],
      ),
    );
  }
}
