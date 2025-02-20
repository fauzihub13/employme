import 'package:employme/core/components/card_job_status.dart';
import 'package:employme/core/components/custom_appbar.dart';
import 'package:employme/core/components/custom_badge.dart';
import 'package:employme/core/constants/colors.dart';
import 'package:flutter/material.dart';

class JobAppliedHistoryPage extends StatefulWidget {
  const JobAppliedHistoryPage({super.key});

  @override
  State<JobAppliedHistoryPage> createState() => _JobAppliedHistoryPageState();
}

class _JobAppliedHistoryPageState extends State<JobAppliedHistoryPage> {
  @override
  Widget build(BuildContext context) {
    int isSelected = 0;

    final List<Map<String, dynamic>> categories = [
      {'text': 'All', 'isSelected': false},
      {'text': 'Reviewing', 'isSelected': false},
      {'text': 'Cancelled', 'isSelected': false},
      {'text': 'Delivered', 'isSelected': false},
    ];

    List<Map<String, dynamic>> jobList = [
      {
        'image': 'assets/images/avatar.jpg',
        'jobTitle': 'Web Programmer',
        'jobCompany': 'Telkom Indonesia',
        'jobSalary': '\$90.000/y',
        'jobLocation': 'Jakarta Barat',
        'jobStatus': 'cancelled',
        'jobPosition': 'Full-time',
      },
      {
        'image': 'assets/images/avatar.jpg',
        'jobTitle': 'Mobile Developer',
        'jobCompany': 'Gojek',
        'jobSalary': '\$85.000/y',
        'jobLocation': 'Jakarta Selatan',
        'jobStatus': 'reviewing',
        'jobPosition': 'Junior',
      },
      {
        'image': 'assets/images/avatar.jpg',
        'jobTitle': 'Data Scientist',
        'jobCompany': 'Tokopedia',
        'jobSalary': '\$120.000/y',
        'jobLocation': 'Jakarta Pusat',
        'jobStatus': 'delivered',
        'jobPosition': 'Senior',
      },
      {
        'image': 'assets/images/avatar.jpg',
        'jobTitle': 'UI/UX Designer',
        'jobCompany': 'Bukalapak',
        'jobSalary': '\$75.000/y',
        'jobLocation': 'Bandung',
        'jobStatus': 'cancelled',
        'jobPosition': 'Internship',
      },
      {
        'image': 'assets/images/avatar.jpg',
        'jobTitle': 'Software Engineer',
        'jobCompany': 'Shopee',
        'jobSalary': '\$110.000/y',
        'jobLocation': 'Jakarta Utara',
        'jobStatus': 'reviewing',
        'jobPosition': 'Full-time',
      },
      {
        'image': 'assets/images/avatar.jpg',
        'jobTitle': 'Backend Developer',
        'jobCompany': 'Traveloka',
        'jobSalary': '\$95.000/y',
        'jobLocation': 'Jakarta Timur',
        'jobStatus': 'delivered',
        'jobPosition': 'Senior',
      },
      {
        'image': 'assets/images/avatar.jpg',
        'jobTitle': 'Frontend Developer',
        'jobCompany': 'Blibli',
        'jobSalary': '\$80.000/y',
        'jobLocation': 'Tangerang',
        'jobStatus': 'open',
        'jobPosition': 'Junior',
      },
      {
        'image': 'assets/images/avatar.jpg',
        'jobTitle': 'Cyber Security Analyst',
        'jobCompany': 'Bank Mandiri',
        'jobSalary': '\$130.000/y',
        'jobLocation': 'Jakarta Pusat',
        'jobStatus': 'delivered',
        'jobPosition': 'Full-time',
      },
      {
        'image': 'assets/images/avatar.jpg',
        'jobTitle': 'Machine Learning Engineer',
        'jobCompany': 'Grab',
        'jobSalary': '\$140.000/y',
        'jobLocation': 'Jakarta Selatan',
        'jobStatus': 'cancelled',
        'jobPosition': 'Senior',
      },
      {
        'image': 'assets/images/avatar.jpg',
        'jobTitle': 'DevOps Engineer',
        'jobCompany': 'Tokopedia',
        'jobSalary': '\$100.000/y',
        'jobLocation': 'Jakarta Barat',
        'jobStatus': 'cancelled',
        'jobPosition': 'Full-time',
      },
    ];

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
                            return JobAppliedHistoryPage();
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
