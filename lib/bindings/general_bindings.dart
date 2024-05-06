import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/presentation/sign_up/domain/controller/signup_controller.dart';

class GeneralBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(NetworkManager());
  }

}