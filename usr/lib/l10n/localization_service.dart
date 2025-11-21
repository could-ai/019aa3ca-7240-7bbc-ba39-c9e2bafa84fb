import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const _localizedValues = <String, Map<String, String>>{
    'en': {
      'appTitle': 'DesignAI Pro',
      'home': 'Home',
      'projects': 'Projects',
      'templates': 'Templates',
      'create_new': 'Create New',
      'ai_magic': 'AI Magic Design',
      'ai_desc': 'Generate presentations & docs like Gamma',
      'editor_pro': 'Pro Editor',
      'editor_desc': 'Design graphics like Canva',
      'recent_designs': 'Recent Designs',
      'welcome': 'What will you design today?',
      'language': 'Language',
      'settings': 'Settings',
      'generate': 'Generate',
      'describe_idea': 'Describe your idea...',
      'tools': 'Tools',
      'layers': 'Layers',
      'export': 'Export',
    },
    'ar': {
      'appTitle': 'تصميم برو AI',
      'home': 'الرئيسية',
      'projects': 'مشاريعي',
      'templates': 'القوالب',
      'create_new': 'إنشاء جديد',
      'ai_magic': 'التصميم السحري (AI)',
      'ai_desc': 'توليد عروض ومستندات مثل Gamma',
      'editor_pro': 'المحرر المحترف',
      'editor_desc': 'تصميم جرافيك مثل Canva',
      'recent_designs': 'التصاميم الأخيرة',
      'welcome': 'ماذا تريد أن تصمم اليوم؟',
      'language': 'اللغة',
      'settings': 'الإعدادات',
      'generate': 'توليد',
      'describe_idea': 'وصف فكرتك...',
      'tools': 'الأدوات',
      'layers': 'الطبقات',
      'export': 'تصدير',
    },
    'fr': {
      'appTitle': 'DesignAI Pro',
      'home': 'Accueil',
      'projects': 'Projets',
      'templates': 'Modèles',
      'create_new': 'Créer nouveau',
      'ai_magic': 'Design Magique IA',
      'ai_desc': 'Générer des présentations comme Gamma',
      'editor_pro': 'Éditeur Pro',
      'editor_desc': 'Concevoir des graphiques comme Canva',
      'recent_designs': 'Designs récents',
      'welcome': 'Que voulez-vous concevoir ?',
      'language': 'Langue',
      'settings': 'Paramètres',
      'generate': 'Générer',
      'describe_idea': 'Décrivez votre idée...',
      'tools': 'Outils',
      'layers': 'Calques',
      'export': 'Exporter',
    },
  };

  String get(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar', 'fr'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
