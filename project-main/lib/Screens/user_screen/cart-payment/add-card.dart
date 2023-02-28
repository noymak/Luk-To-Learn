import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_credit_card_new/credit_card_brand.dart';
import 'package:flutter_credit_card_new/flutter_credit_card.dart';
import 'package:get/get.dart';
import 'package:luk_to_learn/constants.dart';
import 'package:luk_to_learn/controllers/paymentcontroller.dart';
import 'package:luk_to_learn/service/omise.dart';
import 'package:quickalert/quickalert.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvv = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late FocusNode _focusNode;
  TextEditingController cardNumberCtrl = TextEditingController();
  TextEditingController expiryFieldCtrl = TextEditingController();

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }

  Widget build(BuildContext context) {
    var cart = Get.arguments[0];
    var listCourse = Get.arguments[1];

    // for (var course in listCourse) {
    //   String image = course.image;
    //   String nameCourse = course.nameCourse;
    //   int price = course.price;
    //   String type = course.type;
    //   String name = course.name;
    //   String detail = course.detail;
    //   String profileTutors = course.profileTutors;
    //   String urlVideo = course.urlVideo;

    //   // String description = course.getDescription();
    //   // นำข้อมูลไปแสดงบนหน้าจอตามต้องการ
    // }
    // print(listCourse);

    var controller = Get.put(PaymentController());
    // listCourse.
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: !useBackgroundImage
              ? const DecorationImage(
                  image: ExactAssetImage('assets/images/bg.png'),
                  fit: BoxFit.fill,
                )
              : null,
          color: Colors.black,
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CreditCardWidget(
                  glassmorphismConfig:
                      useGlassMorphism ? Glassmorphism.defaultConfig() : null,
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvv,
                  showBackView: isCvvFocused,
                  obscureCardNumber: true,
                  obscureCardCvv: true,
                  isHolderNameVisible: true,
                  cardBgColor: Colors.red,
                  backgroundImage:
                      useBackgroundImage ? 'assets/images/card_bg.png' : null,
                  isSwipeGestureEnabled: true,
                  onCreditCardWidgetChange:
                      (CreditCardBrand creditCardBrand) {},
                  customCardTypeIcons: <CustomCardTypeIcon>[
                    CustomCardTypeIcon(
                      cardType: CardType.mastercard,
                      cardImage: Image.asset(
                        'assets/images/mastercard.png',
                        height: 48,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      CreditCardForm(
                        formKey: formKey,
                        obscureCvv: true,
                        obscureNumber: true,
                        cardNumber: cardNumber,
                        cvvCode: cvv,
                        isHolderNameVisible: true,
                        isCardNumberVisible: true,
                        isExpiryDateVisible: true,
                        cardHolderName: cardHolderName,
                        expiryDate: expiryDate,
                        themeColor: Colors.blue,
                        cardNumberDecoration: InputDecoration(
                          labelText: 'Number',
                          hintText: 'XXXX XXXX XXXX XXXX',
                          hintStyle: const TextStyle(color: Colors.white),
                          labelStyle: const TextStyle(color: Colors.white),
                          focusedBorder: border,
                          enabledBorder: border,
                        ),
                        expiryDateDecoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.white),
                          labelStyle: const TextStyle(color: Colors.white),
                          focusedBorder: border,
                          enabledBorder: border,
                          labelText: 'Expired Date',
                          hintText: 'XX/XX',
                        ),
                        cvvCodeDecoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.white),
                          labelStyle: const TextStyle(color: Colors.white),
                          focusedBorder: border,
                          enabledBorder: border,
                          labelText: 'CVV',
                          hintText: 'XXX',
                        ),
                        cardHolderDecoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.white),
                          labelStyle: const TextStyle(color: Colors.white),
                          focusedBorder: border,
                          enabledBorder: border,
                          labelText: 'Card Holder',
                        ),
                        onCreditCardModelChange: onCreditCardModelChange,
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Glassmorphism',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          Switch(
                            value: useGlassMorphism,
                            inactiveTrackColor: Colors.grey,
                            activeColor: Colors.white,
                            activeTrackColor: Colors.green,
                            onChanged: (bool value) => setState(() {
                              useGlassMorphism = value;
                            }),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Card Image',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          Switch(
                            value: useBackgroundImage,
                            inactiveTrackColor: Colors.grey,
                            activeColor: Colors.white,
                            activeTrackColor: Colors.green,
                            onChanged: (bool value) => setState(() {
                              useBackgroundImage = value;
                            }),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          primary: const Color(0xff1b447b),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(12),
                          child: const Text(
                            'Validate',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'halter',
                              fontSize: 14,
                              package: 'flutter_credit_card',
                            ),
                          ),
                        ),
                        onPressed: () async {
                          print(expiryDate.split('/')[0]);
                          print(cardHolderName);
                          print(cardNumber);
                          print(expiryDate.split('/')[0]);
                          print(expiryDate.split('/')[1]);
                          print(cvv);
                          print(cart);

                          var charge = Omise(
                              cardName: cardHolderName,
                              cardNumber: cardNumber,
                              expMonth: expiryDate.split('/')[0],
                              expYear: expiryDate.split('/')[1],
                              security: cvv,
                              price: cart.toString());

                          await charge.getToken();
                          await charge.cardCharge();
                          // Get.toNamed('/home');
                          if (charge.status == 'successful') {
                            QuickAlert.show(
                              context: context,
                              type: QuickAlertType.success,
                              title: 'Payment Successful',
                              onConfirmBtnTap: () => Get.toNamed('/route'),
                            );
                            for (var course in listCourse) {
                              String image = course.image;
                              String nameCourse = course.nameCourse;
                              int price = course.price;
                              String type = course.type;
                              String name = course.name;
                              String detail = course.detail;
                              String profileTutors = course.profileTutors;
                              String urlVideo = course.urlVideo;
                              controller.addMyCourse(
                                  tutorname: name,
                                  coursename: nameCourse,
                                  detailcourse: detail,
                                  image: image,
                                  imageBackground: profileTutors,
                                  type: type,
                                  urlVideo: urlVideo);
                              // String description = course.getDescription();
                              // นำข้อมูลไปแสดงบนหน้าจอตามต้องการ
                            }
                          } else {
                            QuickAlert.show(
                              context: context,
                              type: QuickAlertType.error,
                              title: 'Someting has been error',
                              onConfirmBtnTap: () => Get.toNamed('/home'),
                            );
                          }
                          if (formKey.currentState!.validate()) {
                            print('valid!');
                          } else {
                            print('invalid!');
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvv = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
