class Task {
  String category;
  String sub_category;
  String taskTitle;
  String taskDesc;
  int taskBudget;
  bool featured;
  int requests_recieved;

  Task(
      {
        required this.category,
        required this.sub_category,
        required this.taskTitle,
        required this.taskDesc,
        required this.taskBudget,
        required this.requests_recieved,
        required this.featured
      });
}
