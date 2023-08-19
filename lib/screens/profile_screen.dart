import 'package:codelandia_team_work_ecommerce/screens/languages_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_icon_container.dart';

bool isDarkModeBoolean = Get.isDarkMode;

class ProfileScreen extends StatelessWidget {
  final String imageUrl;

  const ProfileScreen({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 36),
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.photo_camera,
                  color: Colors.grey,
                ),
                const SizedBox(width: 5),
                Text(
                  'Edit Profile'.tr,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                CustomIconContainer(
                  icon: Icons.account_box_rounded,
                  text: 'my account'.tr,
                  iconColor: Colors.orange,
                ),
                const SizedBox(height: 30),
                CustomIconContainer(
                  icon: Icons.notifications_none_rounded,
                  text: 'notification'.tr,
                  iconColor: Colors.orange,
                ),
                const SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    Get.to(() => const LanguagesScreen());
                  },
                  child: CustomIconContainer(
                    icon: Icons.language,
                    text: 'languages'.tr,
                    iconColor: Colors.orange,
                  ),
                ),
                const SizedBox(height: 30),
                CustomIconContainer(
                  icon: Icons.dark_mode_outlined,
                  text: 'dark mode'.tr,
                  iconColor: Colors.orange,
                ),
                const SizedBox(height: 30),
                CustomIconContainer(
                  icon: Icons.help_outline,
                  text: 'help center'.tr,
                  iconColor: Colors.orange,
                ),
                const SizedBox(height: 30),
                CustomIconContainer(
                  icon: Icons.logout_rounded,
                  text: 'log out'.tr,
                  iconColor: Colors.orange,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
