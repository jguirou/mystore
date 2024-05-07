import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../images/circular_image.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key, required this.userName, required this.userMail, required this.image, this.onEditPressed,
  });

  final String userName;
  final String userMail;
  final String image;
  final void Function()?  onEditPressed;



  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: IconButton(onPressed: onEditPressed, icon: const Icon(Icons.edit, color: AppColors.grey,)),
      leading: CircularImage(
        image: image,
        isNetworkImage: true,
      ),
      title: Text(userName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: AppColors.white),),
      subtitle: Text(userMail, style: Theme.of(context).textTheme.bodyMedium!.apply(color: AppColors.white), maxLines: 1,overflow: TextOverflow.ellipsis,),
    );
  }
}