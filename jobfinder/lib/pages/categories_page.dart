import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobfinder/components/bottom_navbar.dart';
import 'package:jobfinder/components/categories_list.dart';
import 'package:jobfinder/components/header_bar.dart';
import 'package:jobfinder/components/popular_job.dart';
import 'package:jobfinder/models/job_model.dart';
import 'package:jobfinder/pages/jobdetail_page.dart';
import 'package:jobfinder/service/koneksi.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final List<String> categories = [
    'Web Developer',
    'Software Developer',
    'Mobile Developer',
    'Data Analyst',
  ];

  String selectedJob = '';

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  var isLoaded = false;
  List<JobModel>? jobs = <JobModel>[];

  getData() async {
    var posts = await ApiService().getJobs();
    posts?.forEach((element) {
      jobs?.add(JobModel(
        address: element.address,
        jobName: element.jobName,
        jobDetail: element.jobDetail,
        jobStatus: element.jobStatus,
        company: element.company,
        companyLogo: element.companyLogo,
        workTime: element.workTime,
        salary: element.salary,
        bannerColor: Color.fromARGB(
          element.bannerColor[0],
          element.bannerColor[1],
          element.bannerColor[2],
          element.bannerColor[3],
        ),
        description: element.description,
        requirements: element.requirement,
      ));
    });

    setState(() {});

    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        color: Colors.white,
        child: BottomNavBar(),
      ),
      body: isLoaded
          ? CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.only(top: 50),
                    color: Colors.white,
                    child: Column(
                      children: [
                        HeaderBar(),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            'Categories',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    ),
                    Container(
                      height: 70,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return CategoriesList(
                            category: categories[index],
                            isSelected: selectedJob == categories[index],
                            onTap: (selectedCategory) {
                              setState(() {
                                selectedJob = selectedCategory;
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ]),
                ),
                SliverList.builder(
                  itemCount: jobs!
                      .where((element) => element.jobName == selectedJob)
                      .length,
                  itemBuilder: (context, index) {
                    final selectedJobs = jobs!
                        .where((element) => element.jobName == selectedJob)
                        .toList();
                    if (selectedJobs != null && selectedJobs.isNotEmpty) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => JobDetailPage(
                                job: selectedJobs[index],
                              ),
                            ),
                          );
                        },
                        child: PopularJob(job: selectedJobs[index]),
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ),
              ],
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
