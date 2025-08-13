import 'package:flutter/material.dart';

import '../../../../../utils/utils.dart';

class SettingMenuTile extends StatelessWidget {
  const SettingMenuTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon,
    required this.onTab,
  });

  final String title;
  final String subtitle;
  final Icon? icon;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTab,
      leading: icon ?? const Icon(Icons.settings),
      title: Utils.customText(title, fontSize: 18),
      subtitle: Utils.customText(subtitle, fontSize: 12),
    );
  }
}