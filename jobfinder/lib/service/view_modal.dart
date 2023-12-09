// import 'dart:convert';
class Jobs {
  int id;
  String jobName;
  String jobDetail;
  String jobStatus;
  String company;
  String companyLogo;
  String workTime;
  int salary;
  String address;
  String description;
  String requirement;
  List<dynamic> bannerColor;
  Jobs(
      {required this.id,
      required this.jobName,
      required this.jobDetail,
      required this.jobStatus,
      required this.company,
      required this.companyLogo,
      required this.workTime,
      required this.salary,
      required this.address,
      required this.description,
      required this.bannerColor,
      required this.requirement});
  factory Jobs.fromJson(Map<String, dynamic> map) {
    return Jobs(
      id: map["id"],
      jobName: map["job_name"],
      jobDetail: map["job_detail"],
      jobStatus: map["job_status"],
      company: map["company"],
      companyLogo: map["company_logo"],
      workTime: map["work_time"],
      salary: map["salary"],
      address: map["address"],
      description: map["description"],
      bannerColor: map["bannerColor"].toList(),
      requirement: map["requirement"],
    );
  }
  // Map<String, dynamic> toJson() {
  //   return {"id": id, "name": name, "email": email, "age": age};
  // }

  // @override
  // String toString() {
  //   return 'Profile{id: $id, name: $name, email: $email, age: $age}';
  // }
}

List<Jobs> jobsFromJson(List<dynamic> jsonData) {
  final data = jsonData;
  return List<Jobs>.from(data.map((item) => Jobs.fromJson(item)));
}
