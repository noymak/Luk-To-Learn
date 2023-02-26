import 'package:get/get.dart';
import 'package:luk_to_learn/model/courses.dart';

class CartContorller extends GetxController{
  List<Courses> cartList = [];
  double total = 0;
  
  void addSearch (index) {
    cartList.add(index);
    calculateTotalPrice();
  }

  void addCart (Courses courses) {
    cartList.add(courses);
    calculateTotalPrice();
  }

  void removeFromCart(int index) {
    int priceToRemove = cartList[index].price!;
    cartList.removeAt(index);
    total -= priceToRemove;
    update();
    print(cartList);
    print(total);
  }

  void calculateTotalPrice() {
    total = 0;
    for (int i = 0; i < cartList.length; i++) {
      total += cartList[i].price!;
    }
    update();
  }
}

