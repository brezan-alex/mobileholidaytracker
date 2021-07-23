import 'dart:convert';

List<Pull> pullFromJson(String str) => List<Pull>.from(json.decode(str).map((x) => Pull.fromJson(x)));

String pullToJson(List<Pull> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pull {
    Pull({
        this.holidayId,
        this.employeeId,
        this.startDate,
        this.endDate,
        this.firstName,
        this.holidayType,
    });

    String holidayId;
    String employeeId;
    DateTime startDate;
    DateTime endDate;
    String firstName;
    String holidayType;

    factory Pull.fromJson(Map<String, dynamic> json) => Pull(
        holidayId: json["holiday_id"],
        employeeId: json["employee_id"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        firstName: json["first_name"],
        holidayType: json["holiday_type"],
    );

    Map<String, dynamic> toJson() => {
        "holiday_id": holidayId,
        "employee_id": employeeId,
        "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "first_name": firstName,
        "holiday_type": holidayType,
    };
}