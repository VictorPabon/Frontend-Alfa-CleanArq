class LoginUserRequest {
  final String email;
  final String password;

  LoginUserRequest({
    required this.email,
    required this.password,
  });
}

class RegisterUserRequest {
  final String name;
  final String email;
  final String password;
  final String phone;

  RegisterUserRequest({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
  });
}


class ForgetPasswordRequest {
  final String email;

  ForgetPasswordRequest({required this.email});
}

class ValidateCodeRequest {
  final String email;
  final String code;

  ValidateCodeRequest({
    required this.email,
    required this.code,
  });
}

class ChangePasswordRequest {
  final String email;
  final String code;
  final String password;

  ChangePasswordRequest({
    required this.email,
    required this.code,
    required this.password,
  });
}

class UpdateUserRequest {
  final String? email;
  final String? name;
  final String? password;
  final String? phone;
  final String? image;

  UpdateUserRequest({
    this.email,
    this.name,
    this.password,
    this.phone,
    this.image,
  });
}