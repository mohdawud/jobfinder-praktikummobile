import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jobfinder/models/job_model.dart';
import 'package:jobfinder/theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class JobDetailPage extends StatefulWidget {
  const JobDetailPage({super.key, required this.job});

  final JobModel job;

  @override
  State<JobDetailPage> createState() => _JobDetailPageState();
}

class _JobDetailPageState extends State<JobDetailPage> {
  int selectedIndex = 0;

  List<String> parts = [
    'Description',
    'Requirement',
  ];

  openwhatsapp() async {
    String whatsapp = "+6282189048887";
    String pesanText = "Hello";

    final Uri whatsappURlAndroid =
        Uri.parse("https://wa.me/ $whatsapp?text=$pesanText");
    final Uri whatappURLIos =
        Uri.parse("https://wa.me/$whatsapp?text=$pesanText");
    if (Platform.isIOS) {
      // untuk ios
      if (await canLaunchUrl(whatappURLIos)) {
        await launchUrl(whatappURLIos);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("whatsapp no installed")));
      }
    } else {
      // android , web
      if (await canLaunchUrl(whatsappURlAndroid)) {
        await launchUrl(whatsappURlAndroid);
      } else {
        var context2 = context;
        ScaffoldMessenger.of(context2).showSnackBar(
            const SnackBar(content: Text("whatsapp no installed ")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                color: widget.job.bannerColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                image: DecorationImage(
                  image: AssetImage(
                    'lib/images/pattern.png',
                  ),
                  repeat: ImageRepeat.repeat,
                ),
              ),
              padding: EdgeInsets.all(40),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Container(
                        child: Container(
                          child: Container(
                            child: Image.network(
                              widget.job.companyLogo,
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
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(30),
                      ),
                      // Icon(
                      //   Icons.bookmark,
                      //   color: Colors.white,
                      // ),
                    ],
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  Text(
                    widget.job.jobName,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    widget.job.company,
                    style: TextStyle(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          widget.job.jobDetail,
                          style: TextStyle(color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      ),
                      Container(
                        child: Text(
                          widget.job.workTime,
                          style: TextStyle(color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      ),
                      Container(
                        child: Text(
                          widget.job.jobStatus,
                          style: TextStyle(color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  Row(
                    children: [
                      Text(
                        '\Rp ' +
                            widget.job.salary.toStringAsFixed(2) +
                            '/month',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.job.address,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsetsDirectional.symmetric(
                              horizontal: 50),
                          child: Row(
                            children: List.generate(
                              parts.length,
                              (index) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Text(
                                  parts[index],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: (selectedIndex == index)
                                        ? primaryColor
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                        ),
                        SizedBox(height: 30),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 100),
                              child: Text(
                                selectedIndex == 0
                                    ? widget.job.description
                                    : widget.job.requirements,
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          openwhatsapp();
                        },
                        child: Text('Apply Now'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: widget.job.bannerColor,
                          minimumSize: Size(double.infinity, 50),
                        ),
                      ),
                    ),
                  ],
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
