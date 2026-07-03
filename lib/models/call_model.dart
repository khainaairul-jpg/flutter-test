enum CallType { voice, video }
enum CallStatus { incoming, outgoing, missed }

class CallModel {
  final String id;
  final String name;
  final String avatarInitials;
  final CallType callType;
  final CallStatus callStatus;
  final String time;
  final String duration;

  const CallModel({
    required this.id,
    required this.name,
    required this.avatarInitials,
    required this.callType,
    required this.callStatus,
    required this.time,
    this.duration = '',
  });
}
