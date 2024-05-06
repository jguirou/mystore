import 'package:flutter/material.dart';
import 'package:mystore/utils/constants/colors.dart';

class SettingsMenuTile extends StatelessWidget {
  const SettingsMenuTile({super.key, required this.title, required this.subTitle, required this.icon, this.color =  AppColors.primary, this.trailing, this.onTap});
  final String title;
  final String subTitle;
  final IconData icon;
  final Color? color;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: trailing,
      leading: Icon(icon, size:28, color: color,),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium,),
      subtitle: Text(subTitle, style: Theme.of(context).textTheme.labelMedium),
      onTap: onTap,
    );
  }
}
