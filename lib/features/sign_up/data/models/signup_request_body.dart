import 'package:json_annotation/json_annotation.dart';

part 'signup_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  @JsonKey(name: 'name')
  final String userName;
  final String email;
  @JsonKey(name: 'phone')
  final String phoneNumber;
  final String gender;
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;

  SignupRequestBody({
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.password,
    required this.passwordConfirmation,
  });

  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}
