import 'package:flutter/material.dart';

class SettingTile extends StatefulWidget {
  final IconData icon;
  final String settingTileSubtitle;
  final String settingTileTitle;
  final String settingTileHintText;

  const SettingTile({
    super.key,
    required this.settingTileTitle,
    required this.icon,
    required this.settingTileSubtitle,
    required this.settingTileHintText,
  });

  @override
  State<SettingTile> createState() => _SettingTileState();
}

final TextEditingController settingsTileController = TextEditingController();

class _SettingTileState extends State<SettingTile> {
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
                  widget.icon,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  widget.settingTileTitle,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  widget.settingTileSubtitle,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    _showMyDialog();
                  },
                  icon: const Icon(Icons.arrow_forward_ios))
            ],
          ),
        ),
      );

  Future<void> _showMyDialog() async => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) => AlertDialog(
            title: Text(widget.settingTileTitle),
            content: TextField(
              controller: settingsTileController,
              decoration: InputDecoration(
                hintText: widget.settingTileHintText,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: Text('Close'),
              ),
              TextButton(onPressed: () {}, child: Text('Change'))
            ],
          ));
}
