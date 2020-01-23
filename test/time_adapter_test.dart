import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/src/adapters/time_adapter.dart';
import 'package:mockito/mockito.dart';

import 'mocks.dart';

void main() {
  group('TimeOfDayAdapter', () {
    test('.read()', () {
      final currentTime = TimeOfDay.now();
      final BinaryReader binaryReader = BinaryReaderMock();
      when(binaryReader.readString()).thenReturn(currentTime.toString());

      final time = TimeAdapter().read(binaryReader);
      verify(binaryReader.readString());
      expect(time, time);
    });

    test('.write()', () {
      final currentTime = TimeOfDay.now();
      final BinaryWriter binaryWriter = BinaryWriterMock();

      TimeAdapter().write(binaryWriter, currentTime);
      verify(binaryWriter.writeString(currentTime.toString()));
    });
  });
}