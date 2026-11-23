import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_hat_izi/oyun_hat_izi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(hatIziConfig.title.length, 33);
    expect(hatIziConfig.tagline.length, 33);
    for (final s in hatIziConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(hatIziConfig.gameId, hatIziId);
    expect(hatIziRules.gameId, hatIziId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(hatIziRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: hatIziId, optionalMechanics: hatIziRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(hatIziRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
