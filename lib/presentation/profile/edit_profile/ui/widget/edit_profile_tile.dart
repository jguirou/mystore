import 'package:flutter/material.dart';
class EditProfileTile extends StatelessWidget {
  const EditProfileTile({
    super.key, required this.title, required this.leading, this.trailing = Icons.arrow_forward_ios,
  });
  final String title;
  final String leading;
  final IconData? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title,style: Theme.of(context).textTheme.bodyMedium, overflow: TextOverflow.ellipsis,),
      leading: Text(leading, style: Theme.of(context).textTheme.bodySmall,overflow: TextOverflow.ellipsis,),
      trailing: IconButton(onPressed: (){}, icon: Icon(trailing)),
    );
  }
}