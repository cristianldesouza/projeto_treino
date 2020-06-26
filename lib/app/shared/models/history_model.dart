import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryModel {
  final String workoutName;
  final String date;
  final int velocity;
  final int duration;
  final int calories;

  HistoryModel({
    this.workoutName,
    this.date,
    this.velocity,
    this.duration,
    this.calories,
  });
}
