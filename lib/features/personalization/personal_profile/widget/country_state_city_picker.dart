import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joha_test/common/jspacing.dart';
import 'package:joha_test/common/textfiled.dart';
import 'package:joha_test/features/personalization/personal_profile/controller/personal_profile_controller.dart';
import 'package:joha_test/features/personalization/personal_profile/widget/personal_form.dart';



class CountryStateCityPicker extends StatefulWidget {
 

  const CountryStateCityPicker(
      {super.key,
     });

  @override
  State<CountryStateCityPicker> createState() => _CountryStateCityPickerState();
}

class _CountryStateCityPickerState extends State<CountryStateCityPicker> {
  
  String title = '';




  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Country TextField
       
         const FormLabel(
            label: 'Country',
          ),
          JSpacing.height(10.h),
           JTextFieldWidget(
         controller: PersonalProfileController.instance.country,
          onTap: () {
            setState(() => title = 'Country');
            _showDialog(context);
          },
          hintText: 'Select Country',
          readOnly: true,
          suffixIcon: const Icon(Icons.expand_more),
         ),

       
         JSpacing.height(10.h),
        const FormLabel(
            label: 'State',
          ),
          JSpacing.height(10.h),

         JTextFieldWidget(
         controller: PersonalProfileController.instance.state,
          onTap: () {
            setState(() => title = 'State');
            if (PersonalProfileController.instance.country.text.isNotEmpty) {
              _showDialog(context);
            } else {
              _showSnackBar('Select Country');
            }
          },
          readOnly: true,
          hintText: 'Select State',
          suffixIcon: const Icon(Icons.expand_more),
         ),
       
         JSpacing.height(15.h),
        const FormLabel(
            label: 'City',
          ),
          JSpacing.height(10.h),

        ///City TextField
          JTextFieldWidget(
         controller: PersonalProfileController.instance.city,
          onTap: () {
            setState(() => title = 'City');
            if (PersonalProfileController.instance.state.text.isNotEmpty) {
              _showDialog(context);
            } else {
              _showSnackBar('Select State');
            }
            
          },
          hintText: 'Select City',
          readOnly: true,
          suffixIcon: const Icon(Icons.expand_more),
         ),
       
      ],
    );
  }

  void _showDialog(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final TextEditingController controller2 = TextEditingController();
    final TextEditingController controller3 = TextEditingController();

    showGeneralDialog(
      barrierLabel: title,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 350),
      context: context,
      pageBuilder: (context, __, ___) {
        return Material(
          color: Colors.transparent,
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return GetBuilder<PersonalProfileController>(
                builder:(contrl) => Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height * .7,
                    margin: const EdgeInsets.only(top: 60, left: 12, right: 12),
                    decoration: BoxDecoration(
                      color:  Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Text(title,
                            style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 17,
                                fontWeight: FontWeight.w500)),
                        const SizedBox(height: 10),
                
                        ///Text Field
                        TextField(
                          controller: title == 'Country'
                              ? controller
                              : title == 'State'
                                  ? controller2
                                  : controller3,
                          onChanged: (val) {
                            setState(() {
                              if (title == 'Country') {
                                contrl.countrySubList = contrl.countryList
                                    .where((element) => element.name
                                        .toLowerCase()
                                        .contains(controller.text.toLowerCase()))
                                    .toList();
                              } else if (title == 'State') {
                                contrl.stateSubList = contrl.stateList
                                    .where((element) => element.name
                                        .toLowerCase()
                                        .contains(controller2.text.toLowerCase()))
                                    .toList();
                              } else if (title == 'City') {
                                contrl.citySubList = contrl.cityList
                                    .where((element) => element.name
                                        .toLowerCase()
                                        .contains(controller3.text.toLowerCase()))
                                    .toList();
                              }
                            });
                          },
                          style: TextStyle(
                              color: Colors.grey.shade800, fontSize: 16.0),
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: "Search here...",
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 5),
                              isDense: true,
                              prefixIcon: Icon(Icons.search)),
                        ),
                
                        ///Dropdown Items
                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 12),
                            itemCount: title == 'Country'
                                ? contrl.countrySubList.length
                                : title == 'State'
                                    ? contrl.stateSubList.length
                                    : contrl.citySubList.length,
                            physics: const ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () async {
                                  setState(() {
                                    if (title == "Country") {
                                      PersonalProfileController.instance.country.text =
                                          contrl.countrySubList[index].name;
                                      contrl.getState(contrl.countrySubList[index].id);
                                      contrl.countrySubList = contrl.countryList;
                                      PersonalProfileController.instance.state.clear();
                                      PersonalProfileController.instance.city.clear();
                                    } else if (title == 'State') {
                                      PersonalProfileController.instance.state.text =
                                          contrl.stateSubList[index].name;
                                      contrl.getCity(contrl.stateSubList[index].id);
                                      contrl.stateSubList = contrl.stateList;
                                      PersonalProfileController.instance.city.clear();
                                    } else if (title == 'City') {
                                      PersonalProfileController.instance.city.text = contrl.citySubList[index].name;
                                      contrl.citySubList = contrl.cityList;
                                    }
                                  });
                                  controller.clear();
                                  controller2.clear();
                                  controller3.clear();
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 20.0, left: 10.0, right: 10.0),
                                  child: Text(
                                      title == 'Country'
                                          ? contrl.countrySubList[index].name
                                          : title == 'State'
                                              ? contrl.stateSubList[index].name
                                              : contrl.citySubList[index].name,
                                      style: TextStyle(
                                          color: Colors.grey.shade800,
                                          fontSize: 16.0)),
                                ),
                              );
                            },
                          ),
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0))),
                          onPressed: () {
                            if (title == 'City' && contrl.citySubList.isEmpty) {
                              PersonalProfileController.instance.city.text = controller3.text;
                            }
                            contrl.countrySubList = contrl.countryList;
                            contrl.stateSubList = contrl.stateList;
                            contrl.citySubList = contrl.cityList;
                
                            controller.clear();
                            controller2.clear();
                            controller3.clear();
                            Navigator.pop(context);
                          },
                          child: const Text('Close'),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, -1), end: const Offset(0, 0))
              .animate(anim),
          child: child,
        );
      },
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Theme.of(context).primaryColor,
        content: Text(message,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 16.0))));
  }

  InputDecoration defaultDecoration = const InputDecoration(
      isDense: true,
      hintText: 'Select',
      suffixIcon: Icon(Icons.arrow_drop_down),
      border: OutlineInputBorder());
}
