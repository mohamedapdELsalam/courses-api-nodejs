import 'package:courses_app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class ContinueStudyCard extends StatelessWidget {
  const ContinueStudyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15),
      shape: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(30),
      ),
      color: context.myTheme.colorScheme.onSecondary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("أكمل ما بدأته ", style: context.myTextTheme.titleLarge),

                  Text("دورة التصميم الجرافيكي"),
                  SizedBox(height: context.screenHeight * 0.02),
                  Transform.scale(
                    scale: 0.85,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          context.myTheme.colorScheme.primary,
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "أكمل الدورة",
                        style: context.myTextTheme.titleMedium!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Expanded(child: CircleAvatar(radius: 40)),
          ],
        ),
      ),
    );
  }
}
