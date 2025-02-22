import 'package:employme/core/components/card_job_status.dart';
import 'package:employme/core/components/custom_appbar.dart';
import 'package:employme/core/components/custom_badge.dart';
import 'package:employme/core/constants/colors.dart';
import 'package:flutter/material.dart';

class JobSavedPage extends StatefulWidget {
  const JobSavedPage({super.key});

  @override
  State<JobSavedPage> createState() => _JobSavedPageState();
}

class _JobSavedPageState extends State<JobSavedPage> {
  int isSelected = 0;

  final List<Map<String, dynamic>> categories = [
    {'text': 'All', 'isSelected': false},
    {'text': 'Design', 'isSelected': false},
    {'text': 'Developer', 'isSelected': false},
    {'text': 'Web programmer', 'isSelected': false},
    {'text': 'Mobile programmer', 'isSelected': false},
  ];

  List<Map<String, dynamic>> jobList = [
    {
      'image': 'assets/images/company/company_1.jpeg',
      'jobTitle': 'Web Programmer',
      'jobCompany': 'Telkom Indonesia',
      'jobSalary': '90000',
      'jobLocation': 'Jakarta Barat',
      'jobStatus': 'open',
      'jobPosition': 'Full-time',
    },
    {
      'image': 'assets/images/company/company_2.jpeg',
      'jobTitle': 'Mobile Developer',
      'jobCompany': 'Gojek',
      'jobSalary': '85000',
      'jobLocation': 'Jakarta Selatan',
      'jobStatus': 'applied',
      'jobPosition': 'Junior',
    },
    {
      'image': 'assets/images/company/company_3.jpeg',
      'jobTitle': 'Data Scientist',
      'jobCompany': 'Tokopedia',
      'jobSalary': '120000',
      'jobLocation': 'Jakarta Pusat',
      'jobStatus': 'open',
      'jobPosition': 'Senior',
    },
    {
      'image': 'assets/images/company/company_4.jpeg',
      'jobTitle': 'UI/UX Designer',
      'jobCompany': 'Bukalapak',
      'jobSalary': '75000',
      'jobLocation': 'Bandung',
      'jobStatus': 'closed',
      'jobPosition': 'Internship',
    },
    {
      'image': 'assets/images/company/company_5.jpeg',
      'jobTitle': 'Software Engineer',
      'jobCompany': 'Shopee',
      'jobSalary': '110000',
      'jobLocation': 'Jakarta Utara',
      'jobStatus': 'open',
      'jobPosition': 'Full-time',
    },
    {
      'image': 'assets/images/company/company_6.jpeg',
      'jobTitle': 'Backend Developer',
      'jobCompany': 'Traveloka',
      'jobSalary': '95000',
      'jobLocation': 'Jakarta Timur',
      'jobStatus': 'applied',
      'jobPosition': 'Senior',
    },
    {
      'image': 'assets/images/company/company_1.jpeg',
      'jobTitle': 'Frontend Developer',
      'jobCompany': 'Blibli',
      'jobSalary': '80.000',
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
      'jobStatus': 'closed',
      'jobPosition': 'Full-time',
    },
    {
      'image': 'assets/images/company/company_3.jpeg',
      'jobTitle': 'Machine Learning Engineer',
      'jobCompany': 'Grab',
      'jobSalary': '140000',
      'jobLocation': 'Jakarta Selatan',
      'jobStatus': 'applied',
      'jobPosition': 'Senior',
    },
    {
      'image': 'assets/images/company/company_4.jpeg',
      'jobTitle': 'DevOps Engineer',
      'jobCompany': 'Tokopedia',
      'jobSalary': '100000',
      'jobLocation': 'Jakarta Barat',
      'jobStatus': 'open',
      'jobPosition': 'Full-time',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Saved',
        canBack: false,
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
                'You saved 48 Jobs',
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
                        onTap: () {},
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
