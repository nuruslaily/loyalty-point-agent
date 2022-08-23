import 'package:capstone/model/api/history_api.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([HistoryAPI])
void main() {

  group('HistoryAPI', () {
    
    test('get history return data', () async {
      var histories = await HistoryAPI.getHistory('4','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6NCwiRW1haWwiOiJudXJ1c2xhaWx5QGdtYWlsLmNvbSIsIkN1c3RvbWVyIjp0cnVlLCJleHAiOjE2NTgzMDg4MzJ9.sK1h1lUC18QiC2oV_-IwTyUy-fFmvuBmfbbT_dS5J3I');
      expect(histories!.isNotEmpty, true);
    });
  });
}
