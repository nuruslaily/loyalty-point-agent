import 'package:capstone/model/api/login_api.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';

@GenerateMocks([LoginAPI])
void main() {
  group('LoginAPI', (){
    test('post login', () async {
      var logins = await LoginAPI.postLogin('nuruslaily@gmail.com', "testpassword");
      expect(logins!.email, 'nuruslaily@gmail.com');
      expect(logins.password, "\$2a\$10\$/pc09JO.pJv2BTYmCWQt0.AQ/FW1QKAvOlbc3O7hzYMpN9Yklakfe");
    });
  }); 
}
