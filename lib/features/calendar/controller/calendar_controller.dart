import 'package:hooks_riverpod/hooks_riverpod.dart';

class CalendarEvent {
  CalendarEvent({required this.title, required this.date});

  final String title;
  final DateTime date;
}

final calendarEventsProvider = Provider<List<CalendarEvent>>((ref) {
  return [
    CalendarEvent(title: 'Rent due', date: DateTime.now().add(const Duration(days: 3))),
    CalendarEvent(title: 'Spotify billing', date: DateTime.now().add(const Duration(days: 10))),
  ];
});
