import 'package:studio_core/core/arcade.dart';
import 'package:studio_core/core/missions.dart';
import 'package:studio_core/core/stats.dart';
import 'empire_spec.dart';
import 'tycoon_rules.dart';

class EmpireRules extends TycoonRules {
  EmpireRules()
      : super(empireSpec, 'game-023-empire-builder', const [
          GameStat('buildings_bought', 'Kurulan yapı', 'Structures built', scale: 40),
          GameStat('money_earned', 'Hazine geliri', 'Treasury income', scale: 5000),
          GameStat('harvests', 'Toplanan vergi', 'Taxes collected', scale: 30),
        ], const [
          MissionTemplate('buildings_bought', 'buildings_bought', [13, 26, 40]),
          MissionTemplate('money_earned', 'money_earned', [1666, 3333, 5000]),
        ]);
}

ArcadeRules createRules() => EmpireRules();
