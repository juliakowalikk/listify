import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  final IconData icon;
  final String? settingTileSubtitle;
  final String settingTileTitle;
  final String settingTileHintText;
  final Function() onPressed;

  const SettingTile({
    super.key,
    required this.settingTileTitle,
    required this.icon,
    this.settingTileSubtitle,
    required this.settingTileHintText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Icon(
                  icon,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  settingTileTitle,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              if (settingTileSubtitle != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    settingTileSubtitle!,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              const Spacer(),
              TextButton(
                onPressed: onPressed,
                child: const Text('Edit'),
              )
            ],
          ),
        ),
      );
}
