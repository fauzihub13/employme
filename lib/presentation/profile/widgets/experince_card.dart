import 'package:flutter/material.dart';

class ExperinceCard extends StatelessWidget {
    final String images;
  final String experienceTitle;
  final String company;
  final String location;
  final String date;
  const ExperinceCard({super.key, required this.images, required this.experienceTitle, required this.company, required this.location, required this.date});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          images,
          height: 50,
          width: 50,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              experienceTitle,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Poppins',
              ),
            ),
            Text(
              company,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              location,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Poppins',
              ),
            ),
            Text(
              date,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
