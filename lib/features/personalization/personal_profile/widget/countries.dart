// import 'package:country_state_city_pro/country_state_city_pro.dart';

// import 'package:flutter/material.dart';

// class Countries extends StatefulWidget {
//   const Countries({super.key});

//   @override
//   State<Countries> createState() => _CountriesState();
// }

// class _CountriesState extends State<Countries> {
//   TextEditingController country = TextEditingController();
//   TextEditingController state = TextEditingController();
//   TextEditingController city = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
          
//           padding: const EdgeInsets.only(bottom:8.0),
//           child: CountryStateCityPicker(
//               country: country,
//               state: state,
//               city: city,
//               dialogColor: Colors.grey.shade200,
//               textFieldDecoration: const InputDecoration(
//                 fillColor: Colors.white,
//                 filled: true,
//                 suffixIcon: Icon(Icons.arrow_drop_down_outlined),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.zero,
//                   borderSide: BorderSide(
//                     width: 2,
//                     color: Color(0xFFC2C7D6),
//                   ),
//                 ),
//               )),
//         ),
//       ],
//     );
//   }
// }
