import 'tycoon_engine.dart';

const empireSpec = TycoonSpec(
  res: [
    Res('gold', 'Altın', 'Gold', 0xFFFFD60A),
    Res('food', 'Erzak', 'Food', 0xFF7BD389, sell: 0.25, keep: 60, value: 0.4),
    Res('iron', 'Demir', 'Iron', 0xFFADB5BD, sell: 0.6, keep: 40, value: 0.8),
    Res('army', 'Ordu', 'Army', 0xFFEF476F, value: 6),
  ],
  blds: [
    Bld('townhall', 'Belediye', 'Town hall', 25, make: {0: 1.0}, start: 1, shape: 5, color: 0xFFE9C46A),
    Bld('farm', 'Çiftlik', 'Farm', 20, make: {1: 1.2}, shape: 2, color: 0xFF6A994E),
    Bld('mine', 'Maden', 'Mine', 40, make: {2: 0.7}, shape: 6, color: 0xFF8D99AE),
    Bld('barracks', 'Kışla', 'Barracks', 70, make: {3: 0.25}, use: {1: 0.5, 2: 0.3}, shape: 3, color: 0xFFEF476F),
    Bld('territory', 'Bölge fethi', 'Conquer land', 8, costRes: 3, growth: 1.3, make: {0: 1.6}, boost: 0.06, shape: 4, color: 0xFFF4A261),
    Bld('market', 'Çarşı', 'Bazaar', 160, boost: 0.1, shape: 5, color: 0xFFE76F51),
    Bld('smith', 'Demirci', 'Blacksmith', 260, make: {2: 2.4}, unlockRes: 3, unlockAt: 10, shape: 1, color: 0xFF6C757D),
    Bld('granary', 'Ambar', 'Granary', 220, make: {1: 4}, unlockRes: 3, unlockAt: 10, shape: 6, color: 0xFFDDA15E),
    Bld('stable', 'Ahır & süvari', 'Cavalry', 480, make: {3: 1.0}, use: {1: 1.6, 2: 1.0}, unlockRes: 3, unlockAt: 25, shape: 3, color: 0xFFB5179E),
    Bld('road', 'Yol ağı', 'Road network', 650, boost: 0.2, unlockRes: 3, unlockAt: 40, shape: 2, color: 0xFFADB5BD),
    Bld('castle', 'Kale', 'Castle', 1200, make: {0: 12}, unlockRes: 3, unlockAt: 70, shape: 3, color: 0xFF495057),
    Bld('palace', 'Saray', 'Palace', 2600, boost: 0.5, unlockRes: 3, unlockAt: 120, shape: 4, color: 0xFFFFD166),
  ],
  startMoney: 60,
  clickMoney: 1.5,
  goal: TGoal.count,
  goalIndex: 4,
  goalTr: 'Bölge',
  goalEn: 'Lands',
  baseSeconds: 230,
);
