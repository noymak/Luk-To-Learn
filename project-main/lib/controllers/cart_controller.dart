import 'package:get/get.dart';
import 'package:luk_to_learn/model/courses.dart';

class CartContorller extends GetxController{
  List<Courses> cartList = [];

  var total = 0;
  

addCart (Courses courses) {
  cartList.add(courses);
  totalPrice();
}

removeFromCart(int index) {
  print(cartList);
    cartList.removeAt((index));
    totalPrice();
    update();
    
  print(cartList);
  print(total);
}

totalPrice() {
    cartList.forEach((element) {
    total = element.price! * cartList.length;
    });
    update();
    
}


}