import 'dart:convert';

class MessageData {
  String _message;
  DateTime _dateTime;
  bool _isSender;

  MessageData(
    this._message,
    this._dateTime,
    this._isSender,
  );

  String get message => _message;

  set message(String value) {
    _message = value;
  }

  DateTime get dateTime => _dateTime;

  set dateTime(DateTime value) {
    _dateTime = value;
  }

  bool get isSender => _isSender;

  set isSender(bool value) {
    _isSender = value;
  }



  Map<String, dynamic> toMap() {
    return {
      '_message': _message,
      'dateTime': dateTime.millisecondsSinceEpoch,
      '_isSender': _isSender,
    };
  }

  factory MessageData.fromMap(Map<String, dynamic> map) {
    return MessageData(
      map['_message'] ?? '',
      DateTime.fromMillisecondsSinceEpoch(map['dateTime']),
      map['_isSender'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageData.fromJson(String source) => MessageData.fromMap(json.decode(source));

  @override
  String toString() => 'MessageData(_message: $_message, dateTime: $dateTime, _isSender: $_isSender)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MessageData &&
      other._message == _message &&
      other.dateTime == dateTime &&
      other._isSender == _isSender;
  }

  @override
  int get hashCode => _message.hashCode ^ dateTime.hashCode ^ _isSender.hashCode;
}

List<MessageData> messageList = [];
