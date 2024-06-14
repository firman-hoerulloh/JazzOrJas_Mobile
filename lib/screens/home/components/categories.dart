import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:shop_app/screens/home/components/crud_form.dart';
import 'package:shop_app/screens/home/components/crud_form_update.dart';
import 'package:shop_app/screens/home/components/crud_form_delete.dart';
import 'package:shop_app/components/toast.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});
   

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/Flash Icon.svg", "text": "Flash Deal"},
      {"icon": "assets/icons/Bill Icon.svg", "text": "Bill"},
      {"icon": "assets/icons/Game Icon.svg", "text": "Game"},
      {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift"},
      {"icon": "assets/icons/Discover.svg", "text": "More"},
    ];
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryCard(
            icon: "assets/icons/Plus Icon.svg",
            text: "Create",
            
            press: () {showCustomDialog(context);},
          ),
          CategoryCard(
            icon: "assets/icons/remove.svg",
            text: "Delete",
            press: () {showCustomDialogDelete(context);},
          ),
          CategoryCard(
            icon: "assets/icons/update.svg",
            text: "Update",
            press: () {showCustomDialogUpdate(context);},
          ),
        ]
    )
    );
  }
  
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFFFECDF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(icon),
          ),
          const SizedBox(height: 4),
          Text(text, textAlign: TextAlign.center)
        ],
      ),
    );
  }
}


