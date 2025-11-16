import 'package:courses_app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;
  final Widget? icon;
  const CustomButton({
    super.key,
    this.text,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      textColor: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 10),
      onPressed: onPressed,
      color: context.myTheme.primaryColor,
      shape: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisSize: MainAxisSize.max,
        children: [
          Center(
            child: Text(
              text ?? "ok",
              style: context.myTextTheme.titleMedium!.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          if (icon != null) SizedBox(width: 10),
          icon ?? Text(""),
        ],
      ),
    );
  }
}
