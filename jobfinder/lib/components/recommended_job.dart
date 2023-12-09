import 'package:flutter/material.dart';
import 'package:jobfinder/models/job_model.dart';

class RecommendedJob extends StatelessWidget {
  const RecommendedJob({super.key, required this.job});

  final JobModel job;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        padding: EdgeInsets.all(20),
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Container(
                child: Image.network(
                  job.companyLogo,
                  width: 50,
                  height: 50,
                ),
                padding: EdgeInsets.all(0.5),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(12),
            ),
            Text(
              job.jobName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              job.company,
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
            Text(
              '\Rp' + job.salary.toStringAsFixed(0) + '/m',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
