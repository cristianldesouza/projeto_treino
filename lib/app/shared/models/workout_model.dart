import 'package:cloud_firestore/cloud_firestore.dart';

class WorkoutModel {
  String name;
  int duration;
  int calories;
  int velocity;
  Timestamp date;

  WorkoutModel(
      {this.name, this.duration, this.calories, this.velocity, this.date});

  WorkoutModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    duration = json['duration'];
    calories = json['calories'];
    velocity = json['velocity'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['duration'] = this.duration;
    data['calories'] = this.calories;
    data['velocity'] = this.velocity;
    data['date'] = this.date;
    return data;
  }
}
