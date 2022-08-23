import 'package:capstone/model/api/register_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
    test('post register return result ', () async {
      var register = await RegisterAPI.postRegisterAPI('nuruslaily00@gmail.com', 'password123', 'Nurus Laily Aprilia', '08816254736', 4321);
      expect(register!.email, 'nuruslaily00@gmail.com');
      expect(register.password, 'password123');
      expect(register.fullname, 'Nurus Laily Aprilia');
      expect(register.noHp, '08816254736');
      expect(register.pin, 4321);
    });
  
}
