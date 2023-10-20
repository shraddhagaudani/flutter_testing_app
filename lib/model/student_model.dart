class StudentModel {
  int id;
  String name;
  int age;
  String course;

  StudentModel(
      {required this.id,
      required this.name,
      required this.age,
      required this.course});

  factory StudentModel.fromMap({required Map<String,dynamic> data}) {
    return StudentModel(
      id: data['id'],
      name: data['name'],
      age: data['age'],
      course: data['course'],
    );
  }
}
