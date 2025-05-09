import 'dart:async';

import 'package:session_manager/session_manager.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

// Example only — adapt as per your real token validation
class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    final token = await SessionManager.getToken();
    if (token != null && token.isNotEmpty) {
      // You might verify the token here (e.g., check expiration)
      yield AuthenticationStatus.authenticated;
    } else {
      yield AuthenticationStatus.unauthenticated;
    }
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    // Simulate or call API that returns token
    // final token = await yourApiAuthenticate(username, password);
    await Future.delayed(const Duration(seconds: 1));
    final token = "example_jwt_token"; // Replace with actual token from API
    if (token != null) {
      await SessionManager.saveToken(token);
      _controller.add(AuthenticationStatus.authenticated);
    } else {
      _controller.add(AuthenticationStatus.unauthenticated);
    }
  }

  void logOut() {
    SessionManager.clearSession();
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
