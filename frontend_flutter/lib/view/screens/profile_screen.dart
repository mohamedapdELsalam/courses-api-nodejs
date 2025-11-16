import 'package:courses_app/controllers/profile_controller.dart';
import 'package:courses_app/data/static/profile.dart';
import 'package:courses_app/view/widgets/profile/profile_avatar.dart';
import 'package:courses_app/view/widgets/profile/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ProfileController controller =
    Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(title: Text("الملف الشخصي"), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProfileAvatar(),
              SizedBox(height: 20),
              ...List.generate(ProfileList.length, (index) {
                var model = ProfileList[index];
                return ProfileCard(
                  title: model.title,
                  leading: model.leading,
                  trailing: model.trailing,
                  onTap: model.onTap,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
