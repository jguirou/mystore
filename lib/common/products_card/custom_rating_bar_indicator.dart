import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../utils/constants/colors.dart';

class CustomRatingBarIndicator extends StatelessWidget {
  const CustomRatingBarIndicator({
    super.key,  this.rating = 0.0,
  });
  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
        rating: rating,
        itemSize: 20,
        unratedColor: AppColors.grey,
        itemCount: 5,
        itemBuilder: (_, index)=> const Icon(Icons.star, color: AppColors.primary,)
    );
  }
}