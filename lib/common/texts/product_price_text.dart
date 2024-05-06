import 'package:flutter/material.dart';

class ProductPriceText extends StatelessWidget {
  const ProductPriceText({
    super.key,
    this.currencySign = '\$',
    required this.price,
    this.maxLines = 1,
     this.isLarge = false,
    this.lineTrough = false,
  });

  final String currencySign, price;
  final int maxLines;
  final bool isLarge;
  final bool lineTrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price,
      style: isLarge ? Theme.of(context).textTheme.headlineMedium!.apply( decoration: lineTrough ? TextDecoration.lineThrough: null) : Theme.of(context).textTheme.titleLarge!.apply( decoration: lineTrough ? TextDecoration.lineThrough: null) ,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      textAlign: TextAlign.left,
    );
  }
}
