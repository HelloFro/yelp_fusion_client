import 'dart:convert';

import 'package:collection/collection.dart';

/// The detailed opening hours of a given day in a week.
class Open {
  /// From 0 to 6, representing day of the week from Monday to Sunday.
  final int? day;

  /// Start of the opening hours in a day, in 24-hour clock notation 
  /// 
  /// ie. 1000 == 10:00 AM.
  final String? start;

  /// End of the opening hours in a day, in 24-hour clock notation 
  /// 
  /// ie. 2130 == 9:30 PM.
  final String? end;

  /// Whether the business opens overnight or not. 
  /// 
  /// Note: When this is true, the end time will be lower than the start time.
  final bool? isOvernight;

  Open({
    this.day,
    this.start,
    this.end,
    this.isOvernight,
  });

  factory Open.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Open();
  
    return Open(
      day: map['day'],
      start: map['start'],
      end: map['end'],
      isOvernight: map['is_overnight'],
    );
  }

  factory Open.fromJson(String source) => Open.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Open(day: $day, start: $start, end: $end, isOvernight: $isOvernight)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Open &&
      o.day == day &&
      o.start == start &&
      o.end == end &&
      o.isOvernight == isOvernight;
  }
}

/// Opening hours of the business.
class Hours {
  /// Whether the business is currently open or not.
  final bool? isOpenNow;

  /// The type of the opening hours information. 
  /// 
  /// Note: Currently, this is always REGULAR.
  final String? hoursType;

  /// The detailed opening hours of each day in a week.
  final List<Open>? open;

  Hours({
    this.isOpenNow,
    this.hoursType,
    this.open,
  });

  factory Hours.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Hours();
  
    return Hours(
      isOpenNow: map['is_open_now'],
      hoursType: map['hours_type'],
      open: List<Open>.from(map['open']?.map((x) => Open.fromMap(x))),
    );
  }

  factory Hours.fromJson(String source) => Hours.fromMap(json.decode(source));

  @override
  String toString() => 'Hours(isOpenNow: $isOpenNow, hoursType: $hoursType, open: $open)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return o is Hours &&
      o.isOpenNow == isOpenNow &&
      o.hoursType == hoursType &&
      listEquals(o.open, open);
  }
}

class HoursList {

  final List<Hours>? hours;

  HoursList({
    this.hours,
  });

  factory HoursList.fromList(List<dynamic>? list) {
    if (list == null) return HoursList();
  
    return HoursList(
      hours: list.map((x) => Hours.fromMap(x)).toList(),
    );
  }

  factory HoursList.fromJson(String source) => HoursList.fromList(json.decode(source));

  @override
  String toString() => 'HoursList(hours: $hours)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return o is HoursList &&
      listEquals(o.hours, hours);
  }
}

/// Out of the ordinary hours for a business that apply on certain dates.
class SpecialHours {
  /// An ISO8601 date string representing the date for which these special hours apply.
  final String? date;

  /// Whether this particular special hour represents a date where a business is closed.
  final bool? isClosed;

  /// Start of the opening hours in a day, in 24-hour clock notation ie. 1000 == 10:00 AM.
  final String? start;

  /// End of the opening hours in a day, in 24-hour clock notation ie. 2130 == 9:30 PM.
  final String? end;

  /// Whether the special hours time range spans past midnight or not. Note: When this is true, the end time will be lower than the start time.
  final bool? isOvernight;

  SpecialHours({
    this.date,
    this.isClosed,
    this.start,
    this.end,
    this.isOvernight,
  });

  factory SpecialHours.fromMap(Map<String, dynamic>? map) {
    if (map == null) return SpecialHours();
  
    return SpecialHours(
      date: map['date'],
      isClosed: map['is_closed'],
      start: map['start'],
      end: map['end'],
      isOvernight: map['is_overnight'],
    );
  }

  factory SpecialHours.fromJson(String source) => SpecialHours.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SpecialHours(date: $date, isClosed: $isClosed, start: $start, end: $end, isOvernight: $isOvernight)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is SpecialHours &&
      o.date == date &&
      o.isClosed == isClosed &&
      o.start == start &&
      o.end == end &&
      o.isOvernight == isOvernight;
  }
}

class SpecialHoursList {

  final List<SpecialHours>? specialHours;

  SpecialHoursList({
    this.specialHours,
  });

  factory SpecialHoursList.fromList(List<dynamic>? list) {
    if (list == null) return SpecialHoursList();
  
    return SpecialHoursList(
      specialHours: list.map((x) => SpecialHours.fromMap(x)).toList(),
    );
  }

  factory SpecialHoursList.fromJson(String source) => SpecialHoursList.fromList(json.decode(source));

  @override
  String toString() => 'SpecialHoursList(hours: $specialHours)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return o is SpecialHoursList &&
      listEquals(o.specialHours, specialHours);
  }
}