import 'package:flutter/material.dart';
import 'package:jobfinder/theme/colors.dart';

class JobModel {
  String jobName;
  String jobDetail;
  String jobStatus;
  String company;
  String companyLogo;
  String workTime;
  int salary;
  String address;
  Color bannerColor;
  String description;
  String requirements;

  JobModel(
      {required this.jobName,
      required this.jobDetail,
      required this.jobStatus,
      required this.company,
      required this.companyLogo,
      required this.workTime,
      required this.salary,
      required this.address,
      required this.bannerColor,
      required this.description,
      required this.requirements});
}

// final List<JobModel> joblist = [
//   JobModel(
//     jobName: 'Web Developer',
//     jobDetail: 'Laravel',
//     jobStatus: 'Junior',
//     company: 'Google',
//     companyLogo: 'lib/images/google.png',
//     workTime: 'Full-time',
//     salary: 8000000,
//     address: 'California, USA',
//     bannerColor: primaryColor,
//     description:
//         "Google is one of the leading technology companies in the world, founded by Larry Page and Sergey Brin in 1998 while they were still students at Stanford University. The company has grown into a global tech giant known for its Google search engine, which is the most widely used web search tool in the world. In addition to the search engine, Google offers various other products and services, including the Android mobile operating system, the Chrome web browser, productivity applications like Google Docs, and many more. One distinctive feature of Google is its innovative company culture. Google is known for granting creative freedom to its employees and encouraging innovation. The company is also famous for its comfortable and employee-friendly work facilities, such as futuristic offices, recreational amenities, and flexible work policies. Google is also committed to environmental sustainability and has invested in renewable energy and reducing its carbon footprint. Google is not just a technology company but also plays a role in the development of various philanthropic projects and initiatives. Google.org, Google's philanthropic arm, has supported various projects focusing on addressing social and environmental issues, including education, internet access, and environmental preservation. With its diverse products, innovative company culture, and commitment to social responsibility, Google continues to be a leader in the global technology industry.",
//     requirements:
//         "Position Product Manager at Google is a critical role in overseeing the development of the company's products and strategies. A Product Manager at Google is expected to have a deep understanding of the technology market and the ability to identify new opportunities that can strengthen Google's position in the industry. The ideal candidate should have at least five years of experience in product management or business development at leading technology companies. Additionally, they should have strong analytical skills to interpret market and user data and the ability to formulate and execute innovative business plans. A Product Manager at Google is expected to have exceptional leadership and team management skills. They must be able to provide clear direction to product developers and engineers, as well as inspire collaboration and innovation within the group. Successful candidates must have excellent communication skills, both oral and written, to work effectively with diverse cross-functional teams across the company. The ability to work efficiently in a rapidly changing environment while considering user preferences, market trends, and the latest technological developments is crucial in this role. Furthermore, a Product Manager at Google is expected to have a clear vision of the strategic direction of Google's products in the future. They must be able to formulate long-term plans that will enable Google to remain a market leader in various sectors. Successful candidates will have a proven track record in planning and managing product lifecycles, from conceptualization to launch and iteration. The ability to adapt quickly to market changes and lead strategic changes to anticipate future trends will be an added advantage.",
//   ),
//   JobModel(
//     jobName: 'Web Developer',
//     jobDetail: 'Golang',
//     jobStatus: 'Senior',
//     company: 'Meta',
//     companyLogo: 'lib/images/meta.png',
//     workTime: 'Full-time',
//     salary: 10000000,
//     address: 'California, USA',
//     bannerColor: primaryColor,
//     description:
//         "Google is one of the leading technology companies in the world, founded by Larry Page and Sergey Brin in 1998 while they were still students at Stanford University. The company has grown into a global tech giant known for its Google search engine, which is the most widely used web search tool in the world. In addition to the search engine, Google offers various other products and services, including the Android mobile operating system, the Chrome web browser, productivity applications like Google Docs, and many more. One distinctive feature of Google is its innovative company culture. Google is known for granting creative freedom to its employees and encouraging innovation. The company is also famous for its comfortable and employee-friendly work facilities, such as futuristic offices, recreational amenities, and flexible work policies. Google is also committed to environmental sustainability and has invested in renewable energy and reducing its carbon footprint. Google is not just a technology company but also plays a role in the development of various philanthropic projects and initiatives. Google.org, Google's philanthropic arm, has supported various projects focusing on addressing social and environmental issues, including education, internet access, and environmental preservation. With its diverse products, innovative company culture, and commitment to social responsibility, Google continues to be a leader in the global technology industry.",
//     requirements:
//         "Position Product Manager at Google is a critical role in overseeing the development of the company's products and strategies. A Product Manager at Google is expected to have a deep understanding of the technology market and the ability to identify new opportunities that can strengthen Google's position in the industry. The ideal candidate should have at least five years of experience in product management or business development at leading technology companies. Additionally, they should have strong analytical skills to interpret market and user data and the ability to formulate and execute innovative business plans. A Product Manager at Google is expected to have exceptional leadership and team management skills. They must be able to provide clear direction to product developers and engineers, as well as inspire collaboration and innovation within the group. Successful candidates must have excellent communication skills, both oral and written, to work effectively with diverse cross-functional teams across the company. The ability to work efficiently in a rapidly changing environment while considering user preferences, market trends, and the latest technological developments is crucial in this role. Furthermore, a Product Manager at Google is expected to have a clear vision of the strategic direction of Google's products in the future. They must be able to formulate long-term plans that will enable Google to remain a market leader in various sectors. Successful candidates will have a proven track record in planning and managing product lifecycles, from conceptualization to launch and iteration. The ability to adapt quickly to market changes and lead strategic changes to anticipate future trends will be an added advantage.",
//   )
// ];
