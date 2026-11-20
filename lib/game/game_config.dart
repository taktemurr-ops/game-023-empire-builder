import 'package:flutter/material.dart';

import '../app/arcade_stage.dart';
import '../app/game_api.dart';
import '../core/game_rules.dart';
import 'tycoon_engine.dart';
import 'rules.dart';
import 'tycoon_view.dart';

const _theme = TycoonTheme(Color(0xFFF4A261), Color(0xFF7F5539), Color(0xFFEF476F));



final gameConfig = GameConfig(
  gameId: 'game-023-empire-builder',
  title: const ['İmparatorluk Kur', 'Empire Builder', 'Empire Builder', 'Empire Builder', 'Empire Builder'],
  tagline: const ['Ordu kur, toprak fethet, diyarı yönet!', 'Train armies, conquer lands, rule the realm!', 'Train armies, conquer lands, rule the realm!', 'Train armies, conquer lands, rule the realm!', 'Train armies, conquer lands, rule the realm!'],
  seedColor: const Color(0xFFF4A261),
  icon: Icons.fort,
  rules: EmpireRules(),
  buildPlay: (ctx) => ArcadeStage(
    ctx: ctx,
    create: () => TycoonSim((ctx.generated as GeneratedLevel<TycoonLevel>).puzzle),
    paint: (c, s, p, t) => paintTycoon(c, s, p, t, ctx.lang == 'tr', _theme),
    sound: tycoonSound,
    boosterIcon: Icons.bolt,
    boosterLabel: (l) => l == 'tr' ? 'Çılgın üretim' : 'Production frenzy',
    howTo: const [
      'Ordu yetiştir, “Bölge fethi” kartıyla toprak kazan; hedef bölge sayısına ulaş.',
      'Train armies and use “Conquer land” to reach the land goal.',
      'Bilde Armeen und erobere Land.',
      'Entrena ejércitos y conquista tierras.',
      'Entraînez des armées et conquérez des terres.',
    ],
  ),
  tutorial: const [
    TutorialStep(Icons.touch_app, [
      'Kartlara dokun: bina al. Sarı fiyat = alınabilir.',
      'Tap cards to buy. Yellow price = affordable.',
      'Karten antippen zum Kaufen.',
      'Toca las cartas para comprar.',
      'Touchez les cartes pour acheter.',
    ]),
    TutorialStep(Icons.pan_tool, [
      'Sahneye dokun: çalış, hasat et veya ilk müşteriye hemen servis yap.',
      'Tap the scene: work, harvest or serve the first customer.',
      'Szene antippen: arbeiten oder ernten.',
      'Toca la escena: trabajar o cosechar.',
      'Touchez la scène : travailler ou récolter.',
    ]),
    TutorialStep(Icons.bolt, [
      'Çılgın üretim güçlendirmesi 20 sn boyunca üretimi ikiye katlar.',
      'Production frenzy doubles output for 20 s.',
      'Produktionsrausch verdoppelt 20 s.',
      'Frenesí duplica la producción 20 s.',
      'Frénésie : production ×2 pendant 20 s.',
    ]),
  ],
);
