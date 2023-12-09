import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobfinder/components/bottom_navbar.dart';
import 'package:jobfinder/components/featured_job.dart';
import 'package:jobfinder/components/header_bar.dart';
import 'package:jobfinder/components/popular_job.dart';
import 'package:jobfinder/components/recommended_job.dart';
import 'package:jobfinder/models/job_model.dart';
import 'package:jobfinder/pages/jobdetail_page.dart';
import 'package:jobfinder/service/koneksi.dart';
import 'package:jobfinder/theme/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void signOut() {
    FirebaseAuth.instance.signOut();
  }
  // void getData()async{
  //   String data = await DefaultAssetBundle.of(context).loadString('assets/json/db.json');
  //   final result = jsonDecode(data);
  // }

  @override
  void initState() {
    super.initState();
    getData();
  }

  var isLoaded = false;
  List<JobModel>? jobs = <JobModel>[];

  getData() async {
//post=await
    var posts = await ApiService().getJobs();
    posts?.forEach((element) {
      setState(() {
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
    });

    if (posts != null) {
      setState(() {
        isLoaded = true;
        print('loading data selesai');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(viewportFraction: 0.97);

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavBar(),
      body: isLoaded
          ? CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.only(top: 40),
                    color: Colors.white,
                    child: Column(
                      children: [
                        HeaderBar(),
                        SizedBox(
                          height: 30,
                        ),
                        // MySearchBar(),
                        // SizedBox(
                        //   height: 25.0,
                        // ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Text(
                                'Featured Jobs',
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
                        SizedBox(height: 20),
                        SizedBox(
                          height: 220,
                          child: PageView.builder(
                            controller: controller,
                            itemCount: 5,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => JobDetailPage(
                                              job: jobs![index],
                                            )));
                              },
                              child: FeaturedJob(
                                job: jobs![index],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        SmoothPageIndicator(
                          controller: controller,
                          count: 5,
                          effect: ExpandingDotsEffect(
                            activeDotColor: primaryColor,
                            dotWidth: 10,
                            dotHeight: 10,
                            dotColor: Colors.grey.shade300,
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Row(
                      children: [
                        Text(
                          'Popular Jobs',
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
                ),
                SliverList.builder(
                  itemCount: jobs?.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                JobDetailPage(job: jobs![index]),
                          ));
                    },
                    child: PopularJob(job: jobs![index]),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Text(
                          'Recommended Jobs',
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
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: jobs?.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    JobDetailPage(job: jobs![index]),
                              ));
                        },
                        child: RecommendedJob(job: jobs![index]),
                      ),
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 40),
                ),
                // SliverList(
                //   delegate: SliverChildBuilderDelegate(
                //     (BuildContext context, int index) {
                //       // Membuat FeaturedJob sesuai dengan data dari joblist
                //       return FeaturedJob(job: joblist[index]);
                //     },
                //     childCount: joblist.length,
                //   ),
                // ),
              ],
            )
          : Text('nothing data'),
    );
  }
}
