import 'package:json_annotation/json_annotation.dart';

part 'account_data.g.dart';

@JsonSerializable()
class AccountData {
  String? email;
  String? password;

  AccountData({
    this.email,
    this.password,
  });

  factory AccountData.fromJson(Map<String, dynamic> json) =>  _$AccountDataFromJson(json);

  Map<String, dynamic> toJson() => _$AccountDataToJson(this);
}
