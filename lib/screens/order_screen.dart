import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final fullName = TextEditingController();
  final phone = TextEditingController();
  final address = TextEditingController();
  String? city;
  List<String> cities = ["Bakı", "Sumqayıt", "Gəncə"];
  int currentStep = 0;
  final _formKey = GlobalKey<FormState>();
  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: const Text("Məlumat"),
          content: Column(children: [
            TextField(
              controller: fullName,
              decoration: const InputDecoration(
                label: Text("Ad, soyad"),
              ),
            ),
            TextField(
              maxLength: 9,
              decoration: const InputDecoration(
                prefix: Text("+994 "),
                label: Text("Telefon"),
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
          title: const Text("Ünvan"),
          content: Column(
            children: [
              DropdownButton(
                hint: const Text("Şəhər"),
                dropdownColor: Colors.teal,
                iconSize: 36,
                isExpanded: true,
                items: cities
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
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
                decoration: const InputDecoration(
                  label: Text("Küçə"),
                ),
              ),
            ],
          ),
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: const Text("Ödəniş"),
          content: Container(),
        ),
        Step(
          state: currentStep > 3 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 3,
          title: const Text("Təstiq"),
          content: Container(),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Rəsmiləşdirilmə",
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
            onStepTapped: (value) => setState(() {
              currentStep = value;
            }),
            steps: getSteps(),
            currentStep: currentStep,
            onStepContinue: () {
              currentStep != getSteps().length - 1
                  ? setState(() {
                      currentStep++;
                    })
                  : print("aaaa");
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
                              ? "Təstiq"
                              : "Növbəti")),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    if (currentStep != 0)
                      Expanded(
                        child: ElevatedButton(
                            onPressed: details.onStepCancel,
                            child: const Text("Geriyə")),
                      ),
                  ],
                ),
              );
            },
          ),
        )
        //  Padding(
        //   padding: const EdgeInsets.all(12.0),
        //   child: Form(
        //     key: _formKey,
        //     child: SingleChildScrollView(
        //       child: Column(
        //         children: [
        //           TextFormField(
        //             validator: (value) {
        //               return (value == null || value.isEmpty)
        //                   ? "Doldurulması vacibdir"
        //                   : null;
        //             },
        //             decoration: InputDecoration(
        //               label: const Text("Ad, soyad"),
        //               border: OutlineInputBorder(
        //                 borderRadius: BorderRadius.circular(10),
        //               ),
        //             ),
        //           ),
        //           const SizedBox(
        //             height: 15,
        //           ),
        //           TextFormField(
        //             validator: (value) {
        //               return (value == null || value.isEmpty || value.length < 9)
        //                   ? "Doldurulması vacibdir"
        //                   : null;
        //             },
        //             maxLength: 9,
        //             decoration: InputDecoration(
        //               prefix: const Text("+994 "),
        //               label: const Text("Telefon"),
        //               border: OutlineInputBorder(
        //                 borderRadius: BorderRadius.circular(10),
        //               ),
        //             ),
        //             keyboardType: TextInputType.number,
        //             inputFormatters: <TextInputFormatter>[
        //               FilteringTextInputFormatter.digitsOnly
        //             ],
        //           ),
        //           const SizedBox(
        //             height: 15,
        //           ),
        //           TextFormField(
        //             validator: (value) {
        //               return (value == null || value.isEmpty)
        //                   ? "Doldurulması vacibdir"
        //                   : null;
        //             },
        //             decoration: InputDecoration(
        //               label: const Text("Ünvan"),
        //               border: OutlineInputBorder(
        //                 borderRadius: BorderRadius.circular(10),
        //               ),
        //             ),
        //           ),
        //           const SizedBox(
        //             height: 20,
        //           ),
        //           ElevatedButton(
        //               onPressed: () {
        //                 if (_formKey.currentState!.validate()) {}
        //               },
        //               child: const Text("Sifariş et"))
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        );
  }
}
