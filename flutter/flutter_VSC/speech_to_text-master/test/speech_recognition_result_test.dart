import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:speech_to_text/speech_recognition_result.dart';

void main() {
  final String firstRecognizedWords = 'hello';
  final String secondRecognizedWords = 'hello there';
  final double firstConfidence = 0.85;
  final double secondConfidence = 0.62;
  final String firstRecognizedJson =
      '{"alternates":[{"recognizedWords":"$firstRecognizedWords","confidence":$firstConfidence}],"finalResult":false}';
  final String secondRecognizedJson =
      '{"alternates":[{"recognizedWords":"$secondRecognizedWords","confidence":$secondConfidence}],"finalResult":false}';
  final SpeechRecognitionWords firstWords =
      SpeechRecognitionWords(firstRecognizedWords, firstConfidence);
  final SpeechRecognitionWords secondWords =
      SpeechRecognitionWords(secondRecognizedWords, secondConfidence);

  setUp(() {});

  group('recognizedWords', () {
    test('empty if no alternates', () {
      SpeechRecognitionResult result = SpeechRecognitionResult([], true);
      expect(result.recognizedWords, isEmpty);
    });
    test('matches first alternate', () {
      SpeechRecognitionResult result =
          SpeechRecognitionResult([firstWords, secondWords], true);
      expect(result.recognizedWords, firstRecognizedWords);
    });
  });
  group('alternates', () {
    test('empty if no alternates', () {
      SpeechRecognitionResult result = SpeechRecognitionResult([], true);
      expect(result.alternates, isEmpty);
    });
    test('expected contents', () {
      SpeechRecognitionResult result =
          SpeechRecognitionResult([firstWords, secondWords], true);
      expect(result.alternates, contains(firstWords));
      expect(result.alternates, contains(secondWords));
    });
    test('in order', () {
      SpeechRecognitionResult result =
          SpeechRecognitionResult([firstWords, secondWords], true);
      expect(result.alternates.first, firstWords);
    });
  });
  group('confidence', () {
    test('0 if no alternates', () {
      SpeechRecognitionResult result = SpeechRecognitionResult([], true);
      expect(result.confidence, 0);
    });
    test('isConfident false if no alternates', () {
      SpeechRecognitionResult result = SpeechRecognitionResult([], true);
      expect(result.isConfident(), isFalse);
    });
    test('isConfident matches first alternate', () {
      SpeechRecognitionResult result =
          SpeechRecognitionResult([firstWords, secondWords], true);
      expect(result.isConfident(), firstWords.isConfident());
    });
    test('hasConfidenceRating false if no alternates', () {
      SpeechRecognitionResult result = SpeechRecognitionResult([], true);
      expect(result.hasConfidenceRating, isFalse);
    });
    test('hasConfidenceRating matches first alternate', () {
      SpeechRecognitionResult result =
          SpeechRecognitionResult([firstWords, secondWords], true);
      expect(result.hasConfidenceRating, firstWords.hasConfidenceRating);
    });
  });
  group('json', () {
    test('loads correctly', () {
      var json = jsonDecode(firstRecognizedJson);
      SpeechRecognitionResult result = SpeechRecognitionResult.fromJson(json);
      expect(result.recognizedWords, firstRecognizedWords);
      expect(result.confidence, firstConfidence);
    });
    test('roundtrips correctly', () {
      var json = jsonDecode(firstRecognizedJson);
      SpeechRecognitionResult result = SpeechRecognitionResult.fromJson(json);
      var roundTripJson = result.toJson();
      SpeechRecognitionResult roundtripResult =
          SpeechRecognitionResult.fromJson(roundTripJson);
      expect(result, roundtripResult);
    });
  });
  group('overrides', () {
    test('toString works with no alternates', () {
      SpeechRecognitionResult result = SpeechRecognitionResult([], true);
      expect(
          result.toString(), "SpeechRecognitionResult words: [], final: true");
    });
    test('toString works with alternates', () {
      SpeechRecognitionResult result =
          SpeechRecognitionResult([firstWords], true);
      expect(result.toString(),
          "SpeechRecognitionResult words: [SpeechRecognitionWords words: hello,  confidence: 0.85], final: true");
    });
    test('hash same for same object', () {
      SpeechRecognitionResult result =
          SpeechRecognitionResult([firstWords], true);
      expect(result.hashCode, result.hashCode);
    });
    test('hash differs for different objects', () {
      SpeechRecognitionResult result1 =
          SpeechRecognitionResult([firstWords], true);
      SpeechRecognitionResult result2 =
          SpeechRecognitionResult([secondWords], true);
      expect(result1.hashCode, isNot(result2.hashCode));
    });
    test('equals same for same object', () {
      SpeechRecognitionResult result =
          SpeechRecognitionResult([firstWords], true);
      expect(result, result);
    });
    test('equals same for different object same values', () {
      SpeechRecognitionResult result1 =
          SpeechRecognitionResult([firstWords], true);
      SpeechRecognitionResult result1a =
          SpeechRecognitionResult([firstWords], true);
      expect(result1, result1a);
    });
    test('equals differs for different objects', () {
      SpeechRecognitionResult result1 =
          SpeechRecognitionResult([firstWords], true);
      SpeechRecognitionResult result2 =
          SpeechRecognitionResult([secondWords], true);
      expect(result1, isNot(result2));
    });
  });
}
