import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lister_hosting/function/navigate.dart';
import 'package:lister_hosting/providers/selected_percent_provider.dart';
import 'package:lister_hosting/utils/color.dart';
import 'package:lister_hosting/utils/images_icons.dart';
import 'package:lister_hosting/widgets/iconss.dart';
import 'package:lister_hosting/widgets/inputField.dart';
import 'package:lister_hosting/widgets/major_button.dart';
import 'package:lister_hosting/widgets/spacing.dart';
import 'package:lister_hosting/widgets/texts.dart';
import 'package:d_chart/d_chart.dart';

class Page2 extends ConsumerStatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Page2State();
}

class _Page2State extends ConsumerState<Page2> {
  List<Widget> eachChartItemList = [
    eachChartItems('Car Savings', yellow),
    eachChartItems('Mortage Savings', brown),
    eachChartItems('School Fees', orange1),
    eachChartItems('Christmas Savings', yellow),
    eachChartItems('Car Savings', yellow),
    eachChartItems('Mortage Savings', brown),
    eachChartItems('School Fees', orange1),
  ];

  List<Widget> percentageList(WidgetRef ref, StateSetter changeState) {
    return [
      eachPercentage(60, ref, changeState),
      eachPercentage(70, ref, changeState),
      eachPercentage(80, ref, changeState),
      eachPercentage(90, ref, changeState),
      eachPercentage(100, ref, changeState),
      eachPercentage(10, ref, changeState),
      eachPercentage(20, ref, changeState),
      eachPercentage(30, ref, changeState),
      eachPercentage(40, ref, changeState),
      eachPercentage(50, ref, changeState),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(header), fit: BoxFit.cover)),
            ),
          ),
          Expanded(
              flex: 7,
              child: Container(
                decoration: BoxDecoration(
                    color: white, border: Border.all(color: white)),
              ))
        ]),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigate.back(context);
                                },
                                child: IconOf(
                                    Icons.arrow_back_ios_rounded, 20, black)),
                            TextOf(
                                'Create Rhapsave', 20, black, FontWeight.w600),
                            Container()
                          ],
                        ),
                      ],
                    ),
                  )),
              Expanded(
                  flex: 7,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        color: white,
                        border: Border.all(
                          color: white,
                        )),
                    child: Column(
                      children: [
                        const YMargin(40),
                        SizedBox(
                          width: double.infinity,
                          child: Card(
                            elevation: 20,
                            shadowColor: ash.withOpacity(0.7),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextOf('Rhapsave Savings', 14,
                                                black, FontWeight.w500),
                                            const YMargin(7),
                                            TextOf('N 1,000,000', 28, black,
                                                FontWeight.w800),
                                            TextOf(
                                                ' Save automatically towards a several goals',
                                                9,
                                                ash,
                                                FontWeight.w600),
                                          ],
                                        ),
                                        buildPieChart(context)
                                      ],
                                    ),
                                    const YMargin(20),
                                    Wrap(
                                      direction: Axis.horizontal,
                                      alignment: WrapAlignment.center,
                                      spacing: 10,
                                      runSpacing: 10,
                                      children: eachChartItemList,
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(builder: (context, changeState) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.53,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 22),
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20))),
                        child: Column(
                          children: [
                            SizedBox(
                                height: 6,
                                width: 70,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: ash2,
                                      borderRadius: BorderRadius.circular(50)),
                                )),
                            const YMargin(20),
                            Row(
                              children: [
                                TextOf('Awesome', 28, black, FontWeight.w200),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: TextOf(
                                        'What percentage of your income would you like to save?',
                                        22,
                                        black,
                                        FontWeight.w500,
                                        align: TextAlign.left))
                              ],
                            ),
                            const YMargin(10),
                            SizedBox(
                              height: 100,
                              child: Expanded(
                                child: GridView.count(
                                    crossAxisCount: 5,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 1.9,
                                    children: percentageList(ref, changeState)),
                              ),
                            ),
                            const InpiutField(),
                            const YMargin(15),
                            MajorButton(
                                text: 'Create Save',
                                onTap: () {},
                                enabled: true),
                          ],
                        ),
                      );
                    });
                  });
            },
            backgroundColor: orange1,
            child: Image.asset(pen),
          ),
        )
      ],
    );
  }

  static eachChartItems(String itemName, Color itmColor) {
    return TextOf(itemName, 10, grey, FontWeight.w500);
  }

  static Widget eachPercentage(
      int percent, WidgetRef ref, StateSetter changeState) {
    return SizedBox(
      width: 48,
      height: 30,
      child: InkWell(
        onTap: () {
          changeState(() {
            ref.read(selectedPercentProvider.notifier).state = percent;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              color:
                  ref.read(selectedPercentProvider) == percent ? yellow2 : ash2,
              borderRadius: BorderRadius.circular(7)),
          child: Center(
            child: TextOf(
                '${percent.toString()}%',
                12,
                ref.read(selectedPercentProvider) == percent ? white : black,
                FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

buildPieChart(BuildContext context) {
  return SizedBox.square(
    dimension: 116,
    child: DChartPie(
      data: const [
        {'domain': 'Car', 'measure': 35},
        {'domain': 'Mortgage', 'measure': 30},
        {'domain': 'School', 'measure': 25},
        {'domain': 'Xmass', 'measure': 10},
      ],
      fillColor: (pieData, index) {
        switch (pieData['domain']) {
          case 'Car':
            return orange1;
          case 'Mortgage':
            return yellow;
          case 'School':
            return orange2;
          case 'Xmass':
            return yellow;
          default:
            return Colors.red;
        }
      },
      donutWidth: 20,
      labelColor: Colors.transparent,
    ),
  );
}
