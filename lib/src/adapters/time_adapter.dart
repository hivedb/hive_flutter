import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class TimeAdapter extends TypeAdapter<TimeOfDay> {
  @override
  TimeOfDay read(BinaryReader reader) {
    final string = reader.readString();
    final hourMinute =
        string.substring(string.indexOf('(') + 1, string.length - 1).split(':');
    final hour = hourMinute[0];
    final minute = hourMinute[1];
    return TimeOfDay(
      hour: int.parse(hour),
      minute: int.parse(minute),
    );
  }

  @override
  void write(BinaryWriter writer, TimeOfDay obj) {
    writer.writeString(obj.toString());
  }

  @override
  int get typeId => 201;
}
