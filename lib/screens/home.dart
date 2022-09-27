import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lister_hosting/providers/selected_percent_provider.dart';
import 'package:lister_hosting/utils/color.dart';
import 'package:lister_hosting/utils/images_icons.dart';

class Home extends ConsumerWidget {
    Home({Key? key}) : super(key: key);
  List<Widget> pages = [];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          ref.watch(currentIndexPercentProvider.notifier).state = index;
        },
        selectedItemColor: orange1,
        unselectedItemColor: grey,
        currentIndex: ref.watch(currentIndexPercentProvider),
        type: BottomNavigationBarType.fixed,
        backgroundColor: white,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(home)), label: 'Home'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(wallet)), label: 'Wallet'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(time)), label: 'Time'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(profile)), label: 'Profile')
        ],
      ),
    );
  }
}
