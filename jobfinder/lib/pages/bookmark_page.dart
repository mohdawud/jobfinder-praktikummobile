// import 'package:flutter/material.dart';
// import 'package:jobfinder/components/bottom_navbar.dart';
// import 'package:jobfinder/components/popular_job.dart';
// import 'package:jobfinder/models/job_model.dart';
// import 'package:jobfinder/pages/jobdetail_page.dart';

// class BookmarkPage extends StatefulWidget {
//   const BookmarkPage({Key? key}) : super(key: key);

//   @override
//   State<BookmarkPage> createState() => _BookmarkPageState();
// }

// class _BookmarkPageState extends State<BookmarkPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       bottomNavigationBar: Container(
//         padding: EdgeInsets.symmetric(vertical: 10),
//         color: Colors.white,
//         child: BottomNavBar(),
//       ),
//       body: SafeArea(
//         child: CustomScrollView(
//           slivers: [
//             SliverToBoxAdapter(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//                 child: Row(
//                   children: [
//                     Text(
//                       'Bookmark',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 ),
//               ),
//             ),
//             SliverList.builder(
//               itemCount: joblist.length,
//               itemBuilder: (context, index) => GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) =>
//                             JobDetailPage(job: joblist[index]),
//                       ));
//                 },
//                 child: PopularJob(job: joblist[index]),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
