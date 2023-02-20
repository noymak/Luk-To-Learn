import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luk_to_learn/Screens/tutor_screen/editprofiletutor.dart';
import 'package:luk_to_learn/constants.dart';
import 'package:luk_to_learn/controllers/cart_controller.dart';
import 'package:luk_to_learn/controllers/courses_controller.dart';
import 'package:luk_to_learn/widgets/appbar.dart';
import 'package:luk_to_learn/widgets/cartlist.dart';
import 'package:luk_to_learn/widgets/cartlistbuy.dart';

import '../../../model/courses.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var cartController = Get.find<CartContorller>();
  var courses = Get.arguments[0];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
  print(courses);
  return Scaffold(
  appBar: Themeappbar(),
  backgroundColor: kPrimaryLightColor,
  body: Container(
    width: size.width,
    height: size.height,
    child: GetBuilder<CartContorller>(
      builder: (context) {
        return ListView.builder(
          itemCount: cartController.cartList.length,
          itemBuilder: (context, index) {
            return Card(
              color: kPrimaryColors,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(cartController.cartList[index].image!),
                ),
                title: Text(
                  cartController.cartList[index].name!,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0
                  ),
                ),
                subtitle: Text(
                  '${cartController.cartList[index].price}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    cartController.removeFromCart(index);
                    
                    // cartController.removeFromCart(courses);
                  },
                ),
              ),
            );
          },
        );
      }
    ),
  ),
  bottomNavigationBar: Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    child: Padding(
      padding: EdgeInsets.all(20.0),
      child: GetBuilder<CartContorller>(
        builder: (context) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Total: ${cartController.total}',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/add-card');
                },
                child: Text(
                  'Checkout',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0
                  ),
                ),
              ),
            ],
          );
        }
      ),
    ),
  ),
);

  //   return Scaffold(
  //     appBar: Themeappbar(),
  //     backgroundColor: kPrimaryLightColor,
  // //     
  //     body: Container(
  //       width: size.width,
  //       height: size.height,
  //       child: ListView.builder(
          
  //         itemCount : cartController.cartList.length,
  //         itemBuilder: (context, index) {
  //           print(cartController.cartList[index].name!);
  //           return Text(cartController.cartList[index].name!);
  //         },
  //       ),
  //     ),
    
  //   );
    
  }
}
