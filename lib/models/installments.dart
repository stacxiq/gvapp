import 'dart:convert';


class Installment {
  final int id;
  final String date;
  final String amount;
  final String status;
  final String note;

  Installment({
    required this.id,
    required this.date,
    required this.amount,
    required this.status,
    required this.note,
  });

  Installment copyWith(
      {int? id, String? date, String? amount, String? status, String? note}) {
    return Installment(
      id: id ?? this.id,
      date: date ?? this.date,
      amount: amount ?? this.amount,
      status: status ?? this.status,
      note: note ?? this.note,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'amount': amount,
      'status': status,
      'note': note,
    };
  }

  factory Installment.fromMap(Map<String, dynamic> map) {
    return Installment(
      id: map['id'] is int
          ? map['id']
          : map['id'] != null
              ? int.parse(map['id'])
              : 0,
      date: map['date'] ?? '',
      amount: map['amount'] ?? '',
      status: map['status'] ?? '',
      note: map['note'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Installment.fromJson(String source) =>
      Installment.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Installment(id: $id, date: $date, amount: $amount, status: $status, note: $note,)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Installment &&
        other.id == id &&
        other.date == date &&
        other.amount == amount &&
        other.status == status &&
        other.note == note;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        date.hashCode ^
        amount.hashCode ^
        status.hashCode ^
        note.hashCode ;
  }
}
