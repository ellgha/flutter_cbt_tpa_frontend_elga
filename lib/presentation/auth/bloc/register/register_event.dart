part of 'register_bloc.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.started() = _Started;
  const factory RegisterEvent.register(
    RegisterRequestModel data,
    // {
    // required String name,
    // required String email,
    // required String password,
    // }
  ) = _Register;
}
