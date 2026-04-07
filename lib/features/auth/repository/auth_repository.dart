import 'package:fpdart/fpdart.dart';

class AuthRepository {
  Future<Either<String, String>> login({
    required String email,
    required String password,
  }) async {
    try {
      final String token = "112233445566778899";
      await Future.delayed(Duration(seconds: 2));

      if (email == "Manhal@gmail.com" && password == "1234") {
        return Either.right(token);
      }

      return Either.left("Incorrect login details");
    } catch (error) {
      return Either.left("An error occurred during login");
    }
  }

  Future<Either<String, String>> signUp({
    required String name,
    required String email,
    required String phone,
    required String birthDate,
    required String password,
  }) async {
    try {
      await Future.delayed(Duration(seconds: 2));
      if (name == '' ||
          email == '' ||
          phone == '' ||
          birthDate == '' ||
          password == '') {
        return Either.left("Account creation details are incomplete");
      }

      return Either.right("Account created successfully");
    } catch (error) {
      return Either.left("An error occurred during account creation");
    }
  }
}
