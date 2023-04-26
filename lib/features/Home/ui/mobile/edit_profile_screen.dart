import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ieeewie/core/blocs/interfaces/i_gallery_service.dart';
import 'package:ieeewie/core/components/app_text_field.dart';
import 'package:ieeewie/core/components/custom_app_bar.dart';
import 'package:ieeewie/core/components/custom_profile_image.dart';
import 'package:ieeewie/core/dialogs/network_alert_dialog.dart';
import 'package:ieeewie/core/helpers/extensions.dart';
import 'package:ieeewie/core/helpers/logic_helpers.dart';
import 'package:ieeewie/core/helpers/validations.dart';
import 'package:ieeewie/core/routes/router.gr.dart';
import 'package:ieeewie/core/themes/color.dart';
import 'package:ieeewie/features/Auth/blocs/update_profile_provider.dart';
import 'package:ieeewie/features/Auth/model/user.dart';
import 'package:loader_overlay/loader_overlay.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Edit Profile"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: _ProfileForm(),
          ),
        ),
      ),
    );
  }
}

class _ProfileForm extends ConsumerStatefulWidget {
  const _ProfileForm();

  @override
  ConsumerState<_ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends ConsumerState<_ProfileForm> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    phone.dispose();
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    name = TextEditingController(text: ref.currentUser().name);
    email = TextEditingController(text: ref.currentUser().email);
    phone = TextEditingController(text: ref.currentUser().phoneNumber);

    ref.listen(UpdateProfileProvider.provider, (previous, next) {
      if (next.isSuccess) {
        ref.read(UpdateProfileProvider.provider.notifier).images = null;
        context.router
            .pushAndPopUntil(const HomeRoute(), predicate: (_) => false);
      }
    });
    return Form(
      key: ref.watch(UpdateProfileProvider.provider.notifier).updateProfileKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomProfileImage(
                  radius: 60,
                  imageUrl: ref.currentUser().photoUrl,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: InkWell(
                    onTap: () async {
                      ref
                              .watch(UpdateProfileProvider.provider.notifier)
                              .images =
                          await ref.read(IGalleryService.provider).pickImages();
                    },
                    child: const CircleAvatar(
                      backgroundColor: AppColors.secondaryColor,
                      radius: 15,
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 40,
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
            enable: false,
            maxLines: 1,
            validator: (value) =>
                value!.validate([validateEmail, validateRequired]),
          ),
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
            "Phone",
            style:
                context.textTheme.headlineMedium!.copyWith(color: Colors.white),
          ),
          AppTextField(
            controller: phone,
            hint: "+2012345678",
            inputType: TextInputType.phone,
            validator: (value) =>
                value!.validate([validatePhone, validateRequired]),
          ),
          SizedBox(
            height: context.heightR(0.1),
          ),
          SizedBox(
            width: context.width,
            child: ElevatedButton(
              onPressed: () async {
                final isConnected = await LogicHelpers.checkInternetConnectivity();
                if(isConnected){
                  context.loaderOverlay.show();
                  ref
                      .read(UpdateProfileProvider.provider.notifier)
                      .updateProfile(
                    UserModel(
                      email: email.text,
                      password: "",
                      name: name.text,
                      phoneNumber: phone.text,
                      photoUrl: ref.currentUser().photoUrl,
                    ),
                  )
                      .whenComplete(() => context.loaderOverlay.hide());
                } else {
                 NetworkAlertDialog.show(context);
                }
              },
              child: const Text("Edit"),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
