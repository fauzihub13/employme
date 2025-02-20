import 'package:employme/core/components/card_job.dart';
import 'package:employme/core/components/custom_appbar.dart';
import 'package:employme/core/components/custom_badge.dart';
import 'package:employme/core/components/custom_button.dart';
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

  final List<Map<String, dynamic>> badges = [
    {'text': 'Full time', 'isSelected': false},
    {'text': 'Senior', 'isSelected': false},
    {'text': 'Junior', 'isSelected': false},
    {'text': 'Entry Level', 'isSelected': false},
    {'text': 'Internship', 'isSelected': false},
  ];

  List<Map<String, dynamic>> jobList = [
    {
      'image': 'assets/images/avatar.jpg',
      'jobTitle': 'Web Programmer',
      'jobCompany': 'Telkom Indonesia',
      'jobSalary': '\$90.000/y',
      'jobLocation': 'Jakarta Barat',
    },
    {
      'image': 'assets/images/avatar.jpg',
      'jobTitle': 'Mobile Developer',
      'jobCompany': 'Gojek',
      'jobSalary': '\$85.000/y',
      'jobLocation': 'Jakarta Selatan',
    },
    {
      'image': 'assets/images/avatar.jpg',
      'jobTitle': 'Data Scientist',
      'jobCompany': 'Tokopedia',
      'jobSalary': '\$120.000/y',
      'jobLocation': 'Jakarta Pusat',
    },
    {
      'image': 'assets/images/avatar.jpg',
      'jobTitle': 'UI/UX Designer',
      'jobCompany': 'Bukalapak',
      'jobSalary': '\$75.000/y',
      'jobLocation': 'Bandung',
    },
    {
      'image': 'assets/images/avatar.jpg',
      'jobTitle': 'Software Engineer',
      'jobCompany': 'Shopee',
      'jobSalary': '\$110.000/y',
      'jobLocation': 'Jakarta Utara',
    },
    {
      'image': 'assets/images/avatar.jpg',
      'jobTitle': 'Backend Developer',
      'jobCompany': 'Traveloka',
      'jobSalary': '\$95.000/y',
      'jobLocation': 'Jakarta Timur',
    },
    {
      'image': 'assets/images/avatar.jpg',
      'jobTitle': 'Frontend Developer',
      'jobCompany': 'Blibli',
      'jobSalary': '\$80.000/y',
      'jobLocation': 'Tangerang',
    },
    {
      'image': 'assets/images/avatar.jpg',
      'jobTitle': 'Cyber Security Analyst',
      'jobCompany': 'Bank Mandiri',
      'jobSalary': '\$130.000/y',
      'jobLocation': 'Jakarta Pusat',
    },
    {
      'image': 'assets/images/avatar.jpg',
      'jobTitle': 'Machine Learning Engineer',
      'jobCompany': 'Grab',
      'jobSalary': '\$140.000/y',
      'jobLocation': 'Jakarta Selatan',
    },
    {
      'image': 'assets/images/avatar.jpg',
      'jobTitle': 'DevOps Engineer',
      'jobCompany': 'Tokopedia',
      'jobSalary': '\$100.000/y',
      'jobLocation': 'Jakarta Barat',
    },
  ];

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
                    itemCount: jobList.length,
                    itemBuilder: (context, index) {
                      final job = jobList[index];
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: CardJob(
                          image: job['image'],
                          jobTitle: job['jobTitle'],
                          jobCompany: job['jobCompany'],
                          jobSalary: job['jobSalary'],
                          jobLocation: job['jobLocation'],
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
              maxChildSize: 0.5,
              minChildSize: 0.1,
              expand: true,
              snap: true,
              builder: (BuildContext context, scrollController) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    color: AppColors.white,
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
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.darkGrey),
                        ),
                        const SizedBox(
                          height: 4,
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
                            }),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Job Types',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.darkGrey),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              spacing: 10,
                              children: List.generate(badges.length, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      badges[index]['isSelected'] =
                                          !badges[index]['isSelected'];
                                    });
                                  },
                                  child: CustomBadge(
                                    text: badges[index]['text'],
                                    isSelected: badges[index]['isSelected'],
                                  ),
                                );
                              }),
                            )),
                        const SizedBox(
                          height: 50,
                        ),
                        CustomButton.filled(
                            onPressed: () {
                              setState(() {
                                isClicked = !isClicked;
                              });
                            },
                            label: 'Apply')
                      ])
                    ],
                  ),
                );
              })
      ])),
    );
  }
}
