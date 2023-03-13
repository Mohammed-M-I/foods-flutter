class LoginData {
  final String id;
  final String nickName;
  final String phoneNumber;
  final String token;

  LoginData({
    required this.id,
    required this.nickName,
    required this.phoneNumber,
    required this.token,
  });

  factory LoginData.decode(
    Map<String, dynamic> encodedData,
  ) =>
      LoginData(
        id: encodedData['id'],
        nickName: encodedData['nickName'],
        phoneNumber: encodedData['phoneNumber'],
        token: encodedData['token'],
      );

  Map<String, dynamic> encode() => <String, dynamic>{
        'id': id,
        'nickName': nickName,
        'phoneNumber': phoneNumber,
        'token': token,
      };
}
