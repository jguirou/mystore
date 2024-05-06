import 'package:flutter/material.dart';

import '../../../../../../common/texts/vertical_image_texts.dart';
import '../../../../../../utils/constants/image_strings.dart';


class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key, this.onTap,
  });
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index){
            return  VerticalImageText(
              image: AppImages.sportIcon,
              title: 'Sport category',
              onTap: onTap,
            );
          }
      ),
    );
  }
}