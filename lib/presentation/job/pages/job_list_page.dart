import 'package:employme/core/components/card_job.dart';
import 'package:employme/core/components/custom_appbar.dart';
import 'package:employme/core/components/search_input.dart';
import 'package:employme/core/constants/colors.dart';
import 'package:employme/presentation/job/pages/job_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class JobListPage extends StatefulWidget {
  const JobListPage({super.key});

  @override
  State<JobListPage> createState() => _JobListPageState();
}

class _JobListPageState extends State<JobListPage> {
  bool isClicked = false;
  final ScrollController scrollController = ScrollController();
  final _sheet = GlobalKey();
  final DraggableScrollableController sheetController =
      DraggableScrollableController();
  RangeValues rangeValues = const RangeValues(10000, 100000);
  double _lowerValue = 30000;
  double _upperValue = 90000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Jobs', canBack: true),
      body: SafeArea(
          child: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: SearchInput(
                      controller: TextEditingController(),
                      hintText: 'Search a job or position',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isClicked = !isClicked;
                      });
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: AppColors.lightGrey,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: SvgPicture.asset(
                          'assets/icons/filter.svg',
                          colorFilter: const ColorFilter.mode(
                              AppColors.darkGrey, BlendMode.srcIn),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 24,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: CardJob(
                          image: 'assets/images/avatar.jpg',
                          jobTitle: 'Fullstack Developer',
                          jobCompany: 'Telkom Indonesia',
                          jobSalary: '\$100.000/y',
                          jobLocation: 'Jakarta Utara',
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return JobDetailPage();
                            }));
                          },
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
        if (isClicked)
          DraggableScrollableSheet(
              controller: sheetController,
              key: _sheet,
              initialChildSize: 0.3,
              maxChildSize: 0.9,
              minChildSize: 0.1,
              expand: true,
              snap: true,
              builder: (BuildContext context, scrollController) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    color: AppColors.baseColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Center(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: AppColors.primaryBlue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            height: 4,
                            width: 60,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                          ),
                        ),
                      ),
                      SliverList.list(children: [
                        Text(
                          'Filter',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Salary Range',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: AppColors.darkGrey),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          'The average listing price is \$84,000',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.darkGrey),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${_lowerValue.toInt()}',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black),
                            ),
                            Text(
                              '\$${_upperValue.toInt()}',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black),
                            ),
                          ],
                        ),
                        RangeSlider(
                            activeColor: AppColors.primaryBlue,
                            min: 4000,
                            max: 300000,
                            divisions: 50,
                            values: rangeValues,
                            onChanged: (RangeValues values) {
                              setState(() {
                                rangeValues = values;
                                _lowerValue = values.start;
                                _upperValue = values.end;
                              });
                            })

                        // Container(
                        //   color: AppColors.blue2,
                        //   width: 100,
                        //   height: 100,
                        // ),
                      ])
                    ],
                  ),
                );
              })
      ])),
    );
  }
}
