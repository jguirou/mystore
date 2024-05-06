import 'package:flutter/material.dart';

import '../../../../utils/constants/texts.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(AppTexts.signUpTitle, style: Theme.of(context).textTheme.headlineMedium);
  }
}