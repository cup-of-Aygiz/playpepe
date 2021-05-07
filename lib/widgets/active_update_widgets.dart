import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_of_pepe/ui/config.dart';

class ActiveUpdateWidget extends StatelessWidget {
  static const Duration _animationDuration = AppAnimation.animationDuration;
  static const TextStyle _styleText = AppText.textStyleToUpdate;
  final String titleText;
  final String costText;
  final VoidCallback onTap;

  ActiveUpdateWidget({
    required this.titleText,
    required this.costText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              titleText,
              style: _styleText,
            ),
            Expanded(
              child: AnimatedContainer(
                //height: AppSize.heroSize : AppSize.heroSizeBig,
                duration: _animationDuration,
                child: Image.asset(
                  "assets/gameimage/icons/tap.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              costText,
              style: _styleText,
            ),
          ],
        ),
        color: Colors.teal[100],
      ),
    );
  }
}
