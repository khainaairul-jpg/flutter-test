import '../models/user_model.dart';
import '../models/message_model.dart';
import '../models/call_model.dart';

final List<UserModel> mockUsers = [
  const UserModel(
    id: '1',
    name: 'Ahmad Razif',
    avatarInitials: 'AR',
    lastMessage: 'Ok nanti saya hantar ye',
    time: '10:32 AM',
    unreadCount: 2,
    isOnline: true,
  ),
  const UserModel(
    id: '2',
    name: 'Siti Norzahra',
    avatarInitials: 'SN',
    lastMessage: 'Jom makan tengah hari!',
    time: '9:14 AM',
    unreadCount: 0,
    isOnline: true,
  ),
  const UserModel(
    id: '3',
    name: 'Hafiz Azman',
    avatarInitials: 'HA',
    lastMessage: 'Meeting pukul 3 petang',
    time: 'Semalam',
    unreadCount: 5,
    isOnline: false,
  ),
  const UserModel(
    id: '4',
    name: 'Nurul Ain',
    avatarInitials: 'NA',
    lastMessage: 'Terima kasih banyak-banyak!',
    time: 'Semalam',
    unreadCount: 0,
    isOnline: false,
  ),
  const UserModel(
    id: '5',
    name: 'Farid Iskandar',
    avatarInitials: 'FI',
    lastMessage: 'Projek dah siap ke?',
    time: 'Isnin',
    unreadCount: 1,
    isOnline: true,
  ),
];

Map<String, List<MessageModel>> getMockMessages() {
  final now = DateTime.now();
  return {
    '1': [
      MessageModel(id: 'm1', text: 'Assalamualaikum!', isMe: false, timestamp: now.subtract(const Duration(minutes: 30))),
      MessageModel(id: 'm2', text: 'Waalaikumsalam! Ada apa?', isMe: true, timestamp: now.subtract(const Duration(minutes: 28))),
      MessageModel(id: 'm3', text: 'Boleh tolong hantar dokumen tu?', isMe: false, timestamp: now.subtract(const Duration(minutes: 25))),
      MessageModel(id: 'm4', text: 'Ok nanti saya hantar ye', isMe: true, timestamp: now.subtract(const Duration(minutes: 20))),
    ],
    '2': [
      MessageModel(id: 'm1', text: 'Hei! Apa khabar?', isMe: false, timestamp: now.subtract(const Duration(hours: 1))),
      MessageModel(id: 'm2', text: 'Baik je! Kamu?', isMe: true, timestamp: now.subtract(const Duration(minutes: 58))),
      MessageModel(id: 'm3', text: 'Sihat! Jom makan tengah hari!', isMe: false, timestamp: now.subtract(const Duration(minutes: 46))),
    ],
    '3': [
      MessageModel(id: 'm1', text: 'Jangan lupa meeting esok', isMe: false, timestamp: now.subtract(const Duration(days: 1))),
      MessageModel(id: 'm2', text: 'Insya-Allah, tak lupa', isMe: true, timestamp: now.subtract(const Duration(days: 1))),
      MessageModel(id: 'm3', text: 'Meeting pukul 3 petang', isMe: false, timestamp: now.subtract(const Duration(days: 1))),
    ],
    '4': [
      MessageModel(id: 'm1', text: 'Dah selesai task tu', isMe: true, timestamp: now.subtract(const Duration(days: 1))),
      MessageModel(id: 'm2', text: 'Terima kasih banyak-banyak!', isMe: false, timestamp: now.subtract(const Duration(days: 1))),
    ],
    '5': [
      MessageModel(id: 'm1', text: 'Status projek macam mana?', isMe: false, timestamp: now.subtract(const Duration(days: 2))),
      MessageModel(id: 'm2', text: 'Dalam proses lagi', isMe: true, timestamp: now.subtract(const Duration(days: 2))),
      MessageModel(id: 'm3', text: 'Projek dah siap ke?', isMe: false, timestamp: now.subtract(const Duration(days: 2))),
    ],
  };
}

final List<CallModel> mockCalls = [
  const CallModel(
    id: 'c1',
    name: 'Ahmad Razif',
    avatarInitials: 'AR',
    callType: CallType.video,
    callStatus: CallStatus.outgoing,
    time: 'Hari ini, 10:15 AM',
    duration: '5:32',
  ),
  const CallModel(
    id: 'c2',
    name: 'Siti Norzahra',
    avatarInitials: 'SN',
    callType: CallType.voice,
    callStatus: CallStatus.incoming,
    time: 'Hari ini, 8:50 AM',
    duration: '12:04',
  ),
  const CallModel(
    id: 'c3',
    name: 'Hafiz Azman',
    avatarInitials: 'HA',
    callType: CallType.voice,
    callStatus: CallStatus.missed,
    time: 'Semalam, 3:22 PM',
  ),
  const CallModel(
    id: 'c4',
    name: 'Nurul Ain',
    avatarInitials: 'NA',
    callType: CallType.video,
    callStatus: CallStatus.incoming,
    time: 'Semalam, 11:00 AM',
    duration: '2:18',
  ),
  const CallModel(
    id: 'c5',
    name: 'Farid Iskandar',
    avatarInitials: 'FI',
    callType: CallType.voice,
    callStatus: CallStatus.missed,
    time: 'Isnin, 6:45 PM',
  ),
];
