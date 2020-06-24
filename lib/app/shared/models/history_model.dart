import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryModel {
  final String workoutName;
  final Timestamp date;
  final int velocity;
  final int duration;

  HistoryModel({
    this.workoutName,
    this.date,
    this.velocity,
    this.duration,
  });
}
