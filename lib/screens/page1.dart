// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:lister_hosting/function/navigate.dart';
import 'package:lister_hosting/screens/page2.dart';
import 'package:lister_hosting/utils/color.dart';
import 'package:lister_hosting/utils/images_icons.dart';
import 'package:lister_hosting/widgets/iconss.dart';
import 'package:lister_hosting/widgets/spacing.dart';
import 'package:lister_hosting/widgets/texts.dart';

class Page1 extends StatelessWidget {
  List<Widget> getListOfEaachCategoryItem = [
    eachCategoryItem(security, 'Security'),
    eachCategoryItem(card, 'Cards'),
    eachCategoryItem(notification_2, 'Notifications'),
    eachCategoryItem(card, 'Live Support'),
    eachCategoryItem(card, 'About Us'),
    eachCategoryItem(card, 'About Us'),
    eachCategoryItem(card, 'Contact us'),
    eachCategoryItem(card, 'Terms & Privavcy Policy'),
  ];

  Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        majorBackground(context),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const YMargin(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: white,
                            child: IconOf(Icons.menu_rounded, 30, black),
                          ),
                          InkWell(
                            onTap: () {
                              Navigate.forward(context, const Page2());
                            },
                            child: CircleAvatar(
                              radius: 24,
                              backgroundColor: white,
                              child: Image.asset(notification),
                            ),
                          )
                        ],
                      ),
                      YMargin(MediaQuery.of(context).size.height * 0.06),
                      profileBanner(),
                      const YMargin(20),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: getListOfEaachCategoryItem,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                      width: double.infinity,
                      height: 70,
                      child: Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                      )),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  static Column eachCategoryItem(
    String icon,
    String itemName,
  ) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: white, borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 17),
          child: Row(
            children: [
              Image.asset(icon),
              const XMargin(10),
              TextOf(itemName, 17, black, FontWeight.w500),
              Expanded(child: Container()),
              IconOf(
                  Icons.arrow_forward_ios_rounded, 17, black.withOpacity(0.6))
            ],
          ),
        ),
        const YMargin(10)
      ],
    );
  }

  SizedBox profileBanner() {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: white,
                radius: 40,
                child: Image.asset(pic),
              ),
              const XMargin(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      TextOf('Abiola Ogunjobi', 22, black, FontWeight.w700),
                      const XMargin(5),
                      IconOf(Icons.verified_outlined, 18, orange2)
                    ],
                  ),
                  TextOf('Verified', 15, ash, FontWeight.w500)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Stack majorBackground(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(background), fit: BoxFit.cover)),
        ),
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.73,
          decoration: BoxDecoration(color: Colors.grey.shade200),
        )
      ],
    );
  }
}
