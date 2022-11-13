import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:luk_to_learn/constants.dart';


class Themeappbar extends StatelessWidget implements PreferredSizeWidget {
  const Themeappbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor1,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_new,), 
        onPressed: () { 
          Get.back();
         },),
      ),
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50);
}