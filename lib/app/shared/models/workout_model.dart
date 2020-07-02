class WorkoutModel {
  String name;
  int duration;
  int calories;
  int velocity;
  DateTime date;

  WorkoutModel(
      {this.name, this.duration, this.calories, this.velocity, this.date});

  WorkoutModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    duration = json['duration'];
    calories = json['calories'] == null ? 0 : json['calories'];
    velocity = json['velocity'] == null ? 0 : json['velocity'];
    date = DateTime.parse(json['date']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['duration'] = this.duration;
    data['calories'] = this.calories;
    data['velocity'] = this.velocity;
    data['date'] = this.date.toString();
    return data;
  }
}
