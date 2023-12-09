import 'package:flutter/material.dart';
import 'package:jobfinder/models/job_model.dart';

class FeaturedJob extends StatelessWidget {
  FeaturedJob({super.key, required this.job});

  final JobModel job;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: job.bannerColor,
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          image: AssetImage(
            'lib/images/pattern.png',
          ),
          repeat: ImageRepeat.repeat,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes the shadow position
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(25),
      child: Column(
        children: [
          Row(
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
              SizedBox(width: 15),
              Column(
                children: [
                  Text(
                    job.jobName,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    job.company,
                    style: TextStyle(
                      color: Colors.grey.shade300,
                    ),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              Spacer(),
              // Icon(
              //   Icons.bookmark,
              //   color: Colors.grey.shade300,
              // ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              Container(
                child: Text(
                  job.jobDetail,
                  style: TextStyle(color: Colors.white),
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              ),
              Container(
                child: Text(
                  job.workTime,
                  style: TextStyle(color: Colors.white),
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              ),
              Container(
                child: Text(
                  job.jobStatus,
                  style: TextStyle(color: Colors.white),
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                '\Rp' + job.salary.toStringAsFixed(0) + '/month',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'California, USA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }
}
