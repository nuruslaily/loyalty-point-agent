import 'package:capstone/model/api/profile_api.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';

@GenerateMocks([ProfileAPI])
void main() {
  group('ProfileAPI', (){
    test('update profile return data', () async {
      var profile = await ProfileAPI.updateCustomer('4', 'Nurus Laily', 'nuruslaily@gmail.com', '08816254736', 'testpassword', '3123', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6NCwiRW1haWwiOiJudXJ1c2xhaWx5QGdtYWlsLmNvbSIsIkN1c3RvbWVyIjp0cnVlLCJleHAiOjE2NTgzMDg4MzJ9.sK1h1lUC18QiC2oV_-IwTyUy-fFmvuBmfbbT_dS5J3I');
      expect(profile!.id, '4');
      expect(profile.fullname, 'Nurus Laily');
      expect(profile.email, 'nuruslaily@gmail.com');
      expect(profile.noHp, '08816254736');
      expect(profile.password, 'testpassword');
      expect(profile.pin, '3123');
      // expect(profile, 'nuruslaily@gmail.com');
    });
  }); 
}