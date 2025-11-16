import 'package:courses_app/view/widgets/homepage/setings_icon.dart';
import 'package:courses_app/view/widgets/homepage/textform_homepage.dart';
import 'package:flutter/widgets.dart';

class HomeSearchAndSettings extends StatelessWidget {
  const HomeSearchAndSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(flex: 4, child: TextFormFieldHomePage()),
          Expanded(flex: 1, child: SettingsIcon()),
        ],
      ),
    );
  }
}
