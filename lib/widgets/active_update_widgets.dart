import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_of_pepe/ui/config.dart';

class ActiveUpdateWidget extends StatelessWidget {
  static const Duration _animationDuration = AppAnimation.animationDuration;
  static const TextStyle _styleText = AppText.textStyleToUpdate;
  final int titleText;
  final num costText;
  final VoidCallback onTap;
  final String iconImage;

  ActiveUpdateWidget({
    required this.titleText,
    required this.costText,
    required this.onTap,
    required this.iconImage,
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
              "Кол-во купленных $titleText",
              style: _styleText,
            ),
            Expanded(
              child: AnimatedContainer(
                //height: AppSize.heroSize : AppSize.heroSizeBig,
                duration: _animationDuration,
                child: Image.asset(
                  iconImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              "Стоимость $costText",
              style: _styleText,
            ),
          ],
        ),
        //color: Colors.teal[100],
      ),
    );
  }
}
