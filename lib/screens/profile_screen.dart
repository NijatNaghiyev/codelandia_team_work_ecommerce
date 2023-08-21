import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/profile_card.dart';

bool isDarkModeBoolean = Get.isDarkMode;

class ProfileScreen extends StatefulWidget {
  final String imageUrl;

  const ProfileScreen({super.key, required this.imageUrl});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF11998e),
                      Color(0xFF38ef7d),
                    ],
                  ),
                ),
                height: Get.height * 0.3,
                width: Get.width,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      'profile'.tr.toUpperCase(),
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 26,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -70,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    clipBehavior: Clip.hardEdge,
                    elevation: 20,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.teal,
                                ),
                              ),
                            ],
                          ),
                          const CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQ5LQ_DxoLymfDeucoZhD1yOd_Pen-IiUxW4weM7_UAEPU2LUlEDvHvvcOKRUm3q-hW6c&usqp=CAU'),
                          ),
                          Text(
                            'James William',
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold, fontSize: 26),
                          ),
                          Text(
                            '@jameswilliam',
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w500, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 90),
          const ProfileCardWidget(
            icon: Icons.person_2_outlined,
            text: 'my account',
          ),
          const ProfileCardWidget(
              icon: Icons.notifications_none_outlined, text: 'notification'),
          const ProfileCardWidget(
              icon: Icons.language_outlined, text: 'languages'),
          const ProfileCardWidget(
              icon: Icons.dark_mode_outlined, text: 'dark mode'),
          const ProfileCardWidget(
              icon: Icons.help_outline, text: 'help center'),
          const ProfileCardWidget(icon: Icons.logout, text: 'log out'),
        ],
      ),
    );
  }
}
