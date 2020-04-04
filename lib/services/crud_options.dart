
abstract class Methods {
  Future<String> login(String email, String password);

  Future<String> signUp(String name, String contact, String email, String password);

 // Future<FirebaseUser> getCurrentUser();

  Future<void> signOut();
}

class Base implements Methods {

  @override
  Future<String> login(String email, String password) {
    // TODO: implement login
    return null;
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    return null;
  }

  @override
  Future<String> signUp(String name, String contact, String email, String password) {
    // TODO: implement signUp
    return null;
  }
}
