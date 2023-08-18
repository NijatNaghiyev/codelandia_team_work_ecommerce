import 'package:codelandia_team_work_ecommerce/screens/languages_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../hive/dark_mode.dart';

bool _isDarkModeBoolean = Get.isDarkMode;

class ProfileScreen extends StatelessWidget {
  final String imageUrl;

  const ProfileScreen({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
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
                      Get.to(const LanguagesScreen());
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
                    icon: Icons.help_center_outlined,
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
      ),
    );
  }
}

class CustomIconContainer extends StatefulWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const CustomIconContainer({
    super.key,
    required this.icon,
    required this.text,
    required this.iconColor,
  });

  @override
  State<CustomIconContainer> createState() => _CustomIconContainerState();
}

class _CustomIconContainerState extends State<CustomIconContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: Get.width,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.deepOrange,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Icon(widget.icon, color: Colors.white),
            ),
            const SizedBox(width: 15),
            Text(
              widget.text,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            widget.text == 'dark mode'.tr
                ? Switch(
                    activeColor: Colors.black,
                    value: _isDarkModeBoolean,
                    onChanged: (value) {
                      setState(() {
                        _isDarkModeBoolean = !Get.isDarkMode;
                      });

                      changeTheme();
                    },
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
