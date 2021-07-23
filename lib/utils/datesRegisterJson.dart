import 'dart:convert';

Dates datesFromJson(String str) => Dates.fromJson(json.decode(str));

String datesToJson(Dates data) => json.encode(data.toJson());

class Dates {
  Dates({
    this.start,
    this.end,
    this.nrOfHolidays,
  });

  String start;
  String end;
  String nrOfHolidays;

  factory Dates.fromJson(Map<String, dynamic> json) => Dates(
    start: json["start"],
    end: json["end"],
    nrOfHolidays: json["nr_of_holidays"],
  );

  Map<String, dynamic> toJson() => {
    "start": start,
    "end": end,
    "nr_of_holidays": nrOfHolidays,
  };
}
