import 'package:employme/core/components/card_job_status.dart';
import 'package:employme/core/components/custom_appbar.dart';
import 'package:employme/core/components/custom_badge.dart';
import 'package:employme/core/constants/colors.dart';
import 'package:employme/presentation/job/pages/job_apply_tracking.dart';
import 'package:flutter/material.dart';

class JobAppliedHistoryPage extends StatefulWidget {
  const JobAppliedHistoryPage({super.key});

  @override
  State<JobAppliedHistoryPage> createState() => _JobAppliedHistoryPageState();
}

class _JobAppliedHistoryPageState extends State<JobAppliedHistoryPage> {
  int isSelected = 0;

  final List<Map<String, dynamic>> categories = [
    {'text': 'All', 'isSelected': false},
    {'text': 'Reviewing', 'isSelected': false},
    {'text': 'Cancelled', 'isSelected': false},
    {'text': 'Delivered', 'isSelected': false},
  ];

  List<Map<String, dynamic>> jobList = [
    {
      'image': 'assets/images/company/company_1.jpeg',
      'jobTitle': 'Web Programmer',
      'jobCompany': 'Telkom Indonesia',
      'jobSalary': '90000',
      'jobLocation': 'Jakarta Barat',
      'jobStatus': 'cancelled',
      'jobPosition': 'Full-time',
    },
    {
      'image': 'assets/images/company/company_2.jpeg',
      'jobTitle': 'Mobile Developer',
      'jobCompany': 'Gojek',
      'jobSalary': '85000',
      'jobLocation': 'Jakarta Selatan',
      'jobStatus': 'reviewing',
      'jobPosition': 'Junior',
    },
    {
      'image': 'assets/images/company/company_3.jpeg',
      'jobTitle': 'Data Scientist',
      'jobCompany': 'Tokopedia',
      'jobSalary': '120000',
      'jobLocation': 'Jakarta Pusat',
      'jobStatus': 'delivered',
      'jobPosition': 'Senior',
    },
    {
      'image': 'assets/images/company/company_4.jpeg',
      'jobTitle': 'UI/UX Designer',
      'jobCompany': 'Bukalapak',
      'jobSalary': '75000',
      'jobLocation': 'Bandung',
      'jobStatus': 'cancelled',
      'jobPosition': 'Internship',
    },
    {
      'image': 'assets/images/company/company_5.jpeg',
      'jobTitle': 'Software Engineer',
      'jobCompany': 'Shopee',
      'jobSalary': '110000',
      'jobLocation': 'Jakarta Utara',
      'jobStatus': 'reviewing',
      'jobPosition': 'Full-time',
    },
    {
      'image': 'assets/images/company/company_6.jpeg',
      'jobTitle': 'Backend Developer',
      'jobCompany': 'Traveloka',
      'jobSalary': '95000',
      'jobLocation': 'Jakarta Timur',
      'jobStatus': 'delivered',
      'jobPosition': 'Senior',
    },
    {
      'image': 'assets/images/company/company_1.jpeg',
      'jobTitle': 'Frontend Developer',
      'jobCompany': 'Blibli',
      'jobSalary': '80000',
      'jobLocation': 'Tangerang',
      'jobStatus': 'open',
      'jobPosition': 'Junior',
    },
    {
      'image': 'assets/images/company/company_2.jpeg',
      'jobTitle': 'Cyber Security Analyst',
      'jobCompany': 'Bank Mandiri',
      'jobSalary': '130000',
      'jobLocation': 'Jakarta Pusat',
      'jobStatus': 'delivered',
      'jobPosition': 'Full-time',
    },
    {
      'image': 'assets/images/company/company_3.jpeg',
      'jobTitle': 'Machine Learning Engineer',
      'jobCompany': 'Grab',
      'jobSalary': '140000',
      'jobLocation': 'Jakarta Selatan',
      'jobStatus': 'cancelled',
      'jobPosition': 'Senior',
    },
    {
      'image': 'assets/images/company/company_4.jpeg',
      'jobTitle': 'DevOps Engineer',
      'jobCompany': 'Tokopedia',
      'jobSalary': '100000',
      'jobLocation': 'Jakarta Barat',
      'jobStatus': 'cancelled',
      'jobPosition': 'Full-time',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Applications',
        canBack: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Text(
                'You have \n27 Applications ',
                style: TextStyle(
                    color: AppColors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 10,
                children: List.generate(categories.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected = index;
                      });
                    },
                    child: CustomBadge(
                      text: categories[index]['text'],
                      isSelected: index == isSelected ? true : false,
                      fontSize: 16,
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: jobList.length,
                  itemBuilder: (context, index) {
                    final job = jobList[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CardJobStatus(
                        image: job['image'],
                        jobTitle: job['jobTitle'],
                        jobCompany: job['jobCompany'],
                        jobSalary: job['jobSalary'],
                        jobLocation: job['jobLocation'],
                        jobStatus: job['jobStatus'],
                        jobPosition: job['jobPosition'],
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return JobApplyTracking();
                          }));
                        },
                      ),
                    );
                  }),
            )
          ],
        ),
      )),
    );
  }
}
