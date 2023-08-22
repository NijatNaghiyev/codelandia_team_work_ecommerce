import 'dart:async';

import 'package:codelandia_team_work_ecommerce/hive/cart_list_hive.dart';
import 'package:codelandia_team_work_ecommerce/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../generated/assets.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key, required this.totalPrice});
  final int totalPrice;
  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  bool isVisible = false;
  final fullName = TextEditingController();
  final phone = TextEditingController();
  final address = TextEditingController();
  String? city;
  String payType = "cash";
  List<String> cities = ["Bakı", "Sumqayıt", "Gəncə"];
  int currentStep = 0;
  String selectedCreditKart = "Bir bank";
  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: Text("Məlumat".tr),
          content: Column(children: [
            TextField(
              controller: fullName,
              decoration: InputDecoration(
                label: Text("Ad, soyad".tr),
              ),
            ),
            TextField(
              controller: phone,
              maxLength: 9,
              decoration: InputDecoration(
                prefix: Text("+994 "),
                label: Text("Telefon".tr),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            )
          ]),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: Text("Ünvan".tr),
          content: Column(
            children: [
              DropdownButton(
                hint: Text("Şəhər".tr),
                dropdownColor: Colors.teal,
                iconSize: 36,
                isExpanded: true,
                items: cities
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    city = value!;
                  });
                },
                value: city,
              ),
              TextField(
                controller: address,
                decoration: InputDecoration(
                  label: Text("Küçə".tr),
                ),
              ),
            ],
          ),
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: Text("Ödəniş".tr),
          content: Column(
            children: [
              RadioListTile(
                title: Text("Nağd".tr),
                value: "cash",
                groupValue: payType,
                onChanged: (value) {
                  setState(() {
                    payType = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: Text("Debet kartı".tr),
                value: "debet",
                groupValue: payType,
                onChanged: (value) {
                  setState(() {
                    payType = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: Text("Kredit kartı".tr),
                value: "credit",
                groupValue: payType,
                onChanged: (value) {
                  setState(() {
                    payType = value.toString();
                  });
                },
              ),
              if (payType == "credit")
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        splashColor: Colors.teal.withAlpha(30),
                        child: Card(
                          elevation: 5,
                          shape: (selectedCreditKart == "Bir bank")
                              ? const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                  side: BorderSide(
                                    color: Colors.teal,
                                    width: 3,
                                  ),
                                )
                              : null,
                          child: Image.asset(
                            Assets.imagesBRCBBLACK4075d6b0c8,
                            width: MediaQuery.sizeOf(context).width / 5,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            selectedCreditKart = "Bir bank";
                          });
                        },
                      ),
                      InkWell(
                        splashColor: Colors.teal.withAlpha(30),
                        child: Card(
                          elevation: 5,
                          shape: (selectedCreditKart == "Tam kart")
                              ? const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                  side: BorderSide(
                                    color: Colors.teal,
                                    width: 3,
                                  ),
                                )
                              : null,
                          child: Image.asset(
                            Assets.imagesDownload,
                            width: MediaQuery.sizeOf(context).width / 5,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            selectedCreditKart = "Tam kart";
                          });
                        },
                      ),
                      InkWell(
                        splashColor: Colors.teal.withAlpha(30),
                        child: Card(
                          shape: (selectedCreditKart == "Leo kart")
                              ? const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                  side: BorderSide(
                                    color: Colors.teal,
                                    width: 3,
                                  ),
                                )
                              : null,
                          child: Image.asset(
                            Assets.assetsImagesDownload,
                            width: MediaQuery.sizeOf(context).width / 5,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            selectedCreditKart = "Leo kart";
                          });
                        },
                      ),
                    ])
            ],
          ),
        ),
        Step(
          state: currentStep > 3 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 3,
          title: Text("Təsdiq".tr),
          content: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${'Ad, soyad'.tr}: ',
                          style: TextStyle(color: Colors.teal, fontSize: 20),
                        ),
                        TextSpan(
                          text: '${fullName.text}',
                          style: TextStyle(
                            fontSize: 20,
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${'Telefon'.tr}: ',
                          style: TextStyle(color: Colors.teal, fontSize: 20),
                        ),
                        TextSpan(
                          text: '+994${phone.text}',
                          style: TextStyle(
                            fontSize: 20,
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${'City'.tr}: ',
                          style: TextStyle(color: Colors.teal, fontSize: 20),
                        ),
                        TextSpan(
                          text: ' ${city}',
                          style: TextStyle(
                            fontSize: 20,
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: ' ${'Street'.tr}: ',
                          style: TextStyle(color: Colors.teal, fontSize: 20),
                        ),
                        TextSpan(
                          text: ' ${address.text}',
                          style: TextStyle(
                            fontSize: 20,
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${'Ödəniş'.tr}: ',
                          style: TextStyle(color: Colors.teal, fontSize: 20),
                        ),
                        TextSpan(
                          text:
                              '${payType == "credit" ? selectedCreditKart : payType}',
                          style: TextStyle(
                            fontSize: 20,
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${'Toplam məbləğ'.tr}: ',
                          style: TextStyle(color: Colors.teal, fontSize: 20),
                        ),
                        TextSpan(
                          text: '\$ ${widget.totalPrice}',
                          style: TextStyle(
                            fontSize: 20,
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Rəsmiləşdirilmə".tr,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.teal,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Theme(
          data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(primary: Colors.teal)),
          child: Stepper(
            steps: getSteps(),
            currentStep: currentStep,
            onStepContinue: () {
              if ((currentStep == 0 &&
                      (fullName.text.isEmpty || phone.text.length < 9)) ||
                  (currentStep == 1 &&
                      (city == null || address.text.isEmpty))) {
                ScaffoldMessenger.of(context).clearSnackBars();
                showTopSnackBar(
                  Overlay.of(context),
                  CustomSnackBar.error(
                    message: 'All fields must be filled'.tr,
                  ),
                );
              } else {
                currentStep != getSteps().length - 1
                    ? setState(() {
                        currentStep++;
                      })
                    : showDialog(
                        context: context,
                        builder: (context) {
                          Timer(
                            Duration(seconds: 2),
                            () {
                              setState(() {
                                isVisible = true;
                              });
                            },
                          );
                          return Card(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Lottie.asset(
                                      repeat: false,
                                      'assets/lottie/lottie_validation.json'),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      isVisible = false;
                                      cartListController.cartList.clear();
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const MainScreen(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Əsas səhifəyə qayıt'.tr,
                                      style: TextStyle(
                                        color: Get.isDarkMode
                                            ? Colors.white
                                            : Colors.teal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
              }
            },
            onStepCancel: () {
              currentStep == 0
                  ? null
                  : setState(() {
                      currentStep--;
                    });
            },
            controlsBuilder: (context, details) {
              return Container(
                margin: const EdgeInsets.only(top: 50),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: details.onStepContinue,
                          child: Text(currentStep == getSteps().length - 1
                              ? "Təsdiq".tr
                              : "Növbəti".tr)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    if (currentStep != 0)
                      Expanded(
                        child: ElevatedButton(
                            onPressed: details.onStepCancel,
                            child: Text("Geriyə".tr)),
                      ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
