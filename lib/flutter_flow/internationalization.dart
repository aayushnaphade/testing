import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'mr', 'hi'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? mrText = '',
    String? hiText = '',
  }) =>
      [enText, mrText, hiText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'cslcz9ry': {
      'en': 'Nandura Water Supply',
      'hi': 'नांदुरा जल आपूर्ति',
      'mr': 'नांदुरा पाणी पुरवठा',
    },
    'i8793i68': {
      'en': 'हिन्दी',
      'hi': 'हिन्दी',
      'mr': 'हिंदी',
    },
    'i6ql73fc': {
      'en': 'मराठी',
      'hi': 'मराठी',
      'mr': 'मराठी',
    },
    'a1c9gt5j': {
      'en': 'English',
      'hi': 'English',
      'mr': 'English',
    },
    'wkrwxb55': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'n1svsrm1': {
      'en': 'Search for an item...',
      'hi': 'किसी आइटम की खोज करें...',
      'mr': 'आयटम शोधा...',
    },
    'nlayo6ah': {
      'en': 'Today\'s Schedule',
      'hi': 'आज का कार्यक्रम',
      'mr': 'आजचे वेळापत्रक',
    },
    'cmsm240g': {
      'en': 'Option 1',
      'hi': 'विकल्प 1',
      'mr': 'पर्याय १',
    },
    'k3xr11mb': {
      'en': 'Tank Filter',
      'hi': 'टैंक फ़िल्टर',
      'mr': 'टाकी फिल्टर',
    },
    'm3f436r4': {
      'en': 'Search for tank',
      'hi': 'टैंक की खोज करें',
      'mr': 'टाकी शोधा',
    },
    '9e81sups': {
      'en': 'Clear Filter',
      'hi': 'फ़िल्टर साफ़ करें',
      'mr': 'फिल्टर साफ करा',
    },
    '5xfztxqj': {
      'en': 'Tank:',
      'hi': 'टैंक:',
      'mr': 'टाकी:',
    },
    'ji7ps6fn': {
      'en': 'Zone :',
      'hi': 'क्षेत्र :',
      'mr': 'झोन:',
    },
    'azfwye22': {
      'en': 'Time :',
      'hi': 'समय :',
      'mr': 'वेळ:',
    },
    '54rsbrt6': {
      'en': 'We Have an update',
      'hi': 'हमारे पास एक अपडेट है',
      'mr': 'आमच्याकडे एक अपडेट आहे',
    },
    'kdojbqs1': {
      'en': 'Download',
      'hi': 'डाउनलोड ',
      'mr': 'डाउनलोड करा',
    },
    'xpmxihr4': {
      'en': 'Message From Admin :  ',
      'hi': '',
      'mr': '',
    },
    'ig6pq2ql': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'मुख्यपृष्ठ',
    },
  },
  // auth_2_Create
  {
    'jybw65sj': {
      'en': 'Nandura',
      'hi': 'नांदुरा',
      'mr': 'नांदुरा',
    },
    'b39d3fer': {
      'en': 'Add Users...',
      'hi': 'उपयोगकर्ता जोड़ें...',
      'mr': 'वापरकर्ते जोडा...',
    },
    'z9istaly': {
      'en': 'Create an account by using the form below.',
      'hi': 'नीचे दिए गए फॉर्म का उपयोग करके एक खाता बनाएं।',
      'mr': 'खालील फॉर्म वापरून खाते तयार करा.',
    },
    'bquc0idm': {
      'en': 'Email',
      'hi': 'ईमेल',
      'mr': 'ईमेल',
    },
    'k963tbcd': {
      'en': 'Password',
      'hi': 'पासवर्ड',
      'mr': 'पासवर्ड',
    },
    'rejadsqp': {
      'en': 'Confirm Password',
      'hi': 'पासवर्ड की पुष्टि कीजिये',
      'mr': 'पासवर्डची पुष्टी करा',
    },
    'wb5vcswf': {
      'en': 'Create Account',
      'hi': 'खाता बनाएं',
      'mr': 'खाते तयार करा',
    },
    'jliozno1': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'mr': 'फील्ड आवश्यक आहे',
    },
    'l47vedka': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
      'mr': 'कृपया ड्रॉपडाउनमधून एक पर्याय निवडा',
    },
    'jnrxff3h': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'mr': 'फील्ड आवश्यक आहे',
    },
    'yovgedtl': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
      'mr': 'कृपया ड्रॉपडाउनमधून एक पर्याय निवडा',
    },
    'qb5z87f5': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'mr': 'फील्ड आवश्यक आहे',
    },
    '6cyz262a': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
      'mr': 'कृपया ड्रॉपडाउनमधून एक पर्याय निवडा',
    },
    '5neyp8p6': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'मुख्यपृष्ठ',
    },
  },
  // auth_2_ForgotPassword
  {
    's7ufb3j1': {
      'en': 'Nandura',
      'hi': 'नांदुरा',
      'mr': 'नांदुरा',
    },
    '93ux1g5x': {
      'en': 'Forgot Password',
      'hi': 'पासवर्ड भूल गए',
      'mr': 'पासवर्ड विसरलात',
    },
    'uftlus61': {
      'en':
          'Please fill out your email belo in order to recieve a reset password link.',
      'hi': 'कृपया पासवर्ड रीसेट लिंक प्राप्त करने के लिए नीचे अपना ईमेल भरें।',
      'mr': 'रीसेट पासवर्ड लिंक प्राप्त करण्यासाठी कृपया तुमचा ईमेल बेलो भरा.',
    },
    'oz7ibmcs': {
      'en': 'Email',
      'hi': 'ईमेल',
      'mr': 'ईमेल',
    },
    'dsg6cmys': {
      'en': 'Send Reset Link',
      'hi': 'रीसेट लिंक भेजें',
      'mr': 'रीसेट लिंक पाठवा',
    },
    '86d4yp51': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'मुख्यपृष्ठ',
    },
  },
  // auth_2_createProfile
  {
    't5gs6o3h': {
      'en': 'Nandura',
      'hi': 'नांदुरा',
      'mr': 'नांदुरा',
    },
    'jlskysgp': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'मुख्यपृष्ठ',
    },
  },
  // auth_2_Profile
  {
    'v6u2i6ju': {
      'en': 'Your Account',
      'hi': 'आपका खाता',
      'mr': 'तुमचे खाते',
    },
    'nwp58ymd': {
      'en': 'Edit Profile',
      'hi': 'प्रोफ़ाइल संपादित करें',
      'mr': 'प्रोफाईल संपादित करा',
    },
    'ml757fg0': {
      'en': 'App Settings',
      'hi': 'एप्लिकेशन सेटिंग',
      'mr': 'ॲप सेटिंग्ज',
    },
    'upwa4jy1': {
      'en': 'About Developer',
      'hi': 'सहायता',
      'mr': 'सपोर्ट',
    },
    'bmrkm7bt': {
      'en': 'Log Out',
      'hi': 'लॉग आउट',
      'mr': 'बाहेर पडणे',
    },
    'pj281p28': {
      'en': 'Delete User',
      'hi': '',
      'mr': '',
    },
    '05nhrq0d': {
      'en': 'Back To Home Screen',
      'hi': 'लॉग आउट',
      'mr': 'बाहेर पडणे',
    },
    'dbtsu6c2': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'मुख्यपृष्ठ',
    },
  },
  // auth_2_EditProfile
  {
    'kemlidua': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'मुख्यपृष्ठ',
    },
  },
  // internal_login
  {
    'erzco6h2': {
      'en':
          'You are trying to Accese \nAdmin Authority, we nned to verify it\'s you!',
      'hi':
          'आप एडमिन अथॉरिटी तक पहुँचने का प्रयास कर रहे हैं, हमें यह सत्यापित करने की आवश्यकता है कि यह आप ही हैं!',
      'mr':
          'आपण प्रवेश करण्याचा प्रयत्न करीत आहात \nप्रशासकीय अधिकारी, आम्ही ते तुम्हीच आहात याची पडताळणी केली आहे!',
    },
    'ivm999a7': {
      'en': 'Internal Login',
      'hi': 'आंतरिक लॉगिन',
      'mr': 'अंतर्गत लॉगिन',
    },
    'caakvp1e': {
      'en': 'ONLY FOR AUTHORISED PERSON',
      'hi': 'केवल अधिकृत व्यक्ति के लिए',
      'mr': 'केवळ अधिकृत व्यक्तीसाठी',
    },
    '0iu18j7i': {
      'en': 'Email',
      'hi': 'ईमेल',
      'mr': 'ईमेल',
    },
    'e16e9hc9': {
      'en': 'Password',
      'hi': 'पासवर्ड',
      'mr': 'पासवर्ड',
    },
    '5w8uzrmg': {
      'en': 'Login',
      'hi': 'लॉग इन करें',
      'mr': 'लॉगिन करा',
    },
    'd294inku': {
      'en': 'Forgot Password',
      'hi': 'पासवर्ड भूल गए',
      'mr': 'पासवर्ड विसरलात',
    },
    'h4r0ogyx': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'मुख्यपृष्ठ',
    },
  },
  // adneewentry
  {
    'y3f8lmr5': {
      'en': 'Fill the Details...',
      'hi': 'विवरण भरें...',
      'mr': 'तपशील भरा...',
    },
    'qa7yrj6o': {
      'en': 'Option 1',
      'hi': 'विकल्प 1',
      'mr': 'पर्याय १',
    },
    '9g4r4ffm': {
      'en': 'Select Tank',
      'hi': 'टैंक चुनें',
      'mr': 'टँक निवडा',
    },
    '6ui77gek': {
      'en': 'Search for an item...',
      'hi': 'किसी आइटम की खोज करें...',
      'mr': 'आयटम शोधा...',
    },
    'h9cyd4js': {
      'en': 'Option 1',
      'hi': 'विकल्प 1',
      'mr': 'पर्याय १',
    },
    'b5cqgeir': {
      'en': 'Select Zone',
      'hi': 'क्षेत्र चुनें',
      'mr': 'झोन निवडा',
    },
    'yppzohtc': {
      'en': 'Search for an item...',
      'hi': 'किसी आइटम की खोज करें...',
      'mr': 'आयटम शोधा...',
    },
    'z5q1xki2': {
      'en': 'Publish',
      'hi': 'प्रकाशित करना',
      'mr': 'प्रकाशित करा',
    },
    'cbtmwe7n': {
      'en': 'Add Shedule',
      'hi': 'शेड्यूल जोड़ें',
      'mr': 'शेड्युले जोडा',
    },
    '970k441n': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'मुख्यपृष्ठ',
    },
  },
  // adneewentryCopy
  {
    'pk0bt45p': {
      'en': 'Add Tank',
      'hi': 'टैंक जोड़ें',
      'mr': 'टाकी जोडा',
    },
    'etmk8sse': {
      'en': 'New Tank',
      'hi': 'नया टैंक',
      'mr': 'नवीन टाकी',
    },
    '7cz7mzjq': {
      'en': 'Create',
      'hi': 'बनाएं',
      'mr': 'तयार करा',
    },
    'lopj0wl6': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'mr': 'फील्ड आवश्यक आहे',
    },
    '89bbl0db': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
      'mr': 'कृपया ड्रॉपडाउनमधून एक पर्याय निवडा',
    },
    '9ldnmn81': {
      'en': 'Add Zone',
      'hi': 'क्षेत्र जोड़ें',
      'mr': 'झोन जोडा',
    },
    '9egffgmm': {
      'en': 'Option 1',
      'hi': 'विकल्प 1',
      'mr': 'पर्याय १',
    },
    '4mjhta6n': {
      'en': 'Select Tank...',
      'hi': 'टैंक का चयन करें...',
      'mr': 'टाकी निवडा...',
    },
    '3uf3vpas': {
      'en': 'Search for an item...',
      'hi': 'किसी आइटम की खोज करें...',
      'mr': 'आयटम शोधा...',
    },
    'imxanr3p': {
      'en': 'New Zone',
      'hi': 'नया क्षेत्र',
      'mr': 'नवीन झोन',
    },
    'jvl5uzcm': {
      'en': 'Create',
      'hi': 'बनाएं',
      'mr': 'तयार करा',
    },
    '72het9qy': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'mr': 'फील्ड आवश्यक आहे',
    },
    '44f7m75e': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
      'mr': 'कृपया ड्रॉपडाउनमधून एक पर्याय निवडा',
    },
    '4ks7ulp5': {
      'en': 'Delete',
      'hi': 'मिटाना',
      'mr': 'हटवा',
    },
    'nenx0x68': {
      'en': 'Delete the zone first \nthen delete the tank......',
      'hi': 'पहले ज़ोन हटाओ फिर टैंक हटाओ......',
      'mr': 'प्रथम झोन हटवा \nमग टाकी हटवा......',
    },
    'rhu7w19k': {
      'en': 'Tank',
      'hi': 'टैंक',
      'mr': 'टाकी',
    },
    'ghww6mly': {
      'en': 'Zone',
      'hi': 'क्षेत्र',
      'mr': 'झोन',
    },
    'zep9ine4': {
      'en': 'Add Data',
      'hi': 'डेटा जोड़ें',
      'mr': 'डेटा जोडा',
    },
    'toh1r0fk': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'मुख्यपृष्ठ',
    },
  },
  // deletezone
  {
    'myhutff9': {
      'en': 'Option 1',
      'hi': 'विकल्प 1',
      'mr': 'पर्याय १',
    },
    '4x5k380n': {
      'en': 'Please select...',
      'hi': 'टैंक का चयन करें...',
      'mr': 'टाकी निवडा...',
    },
    '58us8p5s': {
      'en': 'Search for an item...',
      'hi': 'किसी आइटम की खोज करें...',
      'mr': 'आयटम शोधा...',
    },
    '5gs925df': {
      'en': 'Zone',
      'hi': 'क्षेत्र',
      'mr': 'झोन',
    },
    'mlgqpo28': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'घर',
    },
  },
  // deletezoneCopy
  {
    'o68raqck': {
      'en': 'Tank',
      'hi': 'टैंक',
      'mr': 'टाकी',
    },
    '5sv7zv4x': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'मुख्यपृष्ठ',
    },
  },
  // AdminCenter
  {
    'ynd26w0s': {
      'en': 'Create New User',
      'hi': 'नया उपयोगकर्ता बनाएं',
      'mr': 'नवीन वापरकर्ता तयार करा',
    },
    'oyea55az': {
      'en': 'Admin Controll Pannel',
      'hi': 'एडमिन कंट्रोल पैनल',
      'mr': 'प्रशासन नियंत्रण पॅनेल',
    },
    '2qd21eyo': {
      'en': 'Home',
      'hi': 'घर',
      'mr': 'मुख्यपृष्ठ',
    },
  },
  // editProfile_auth_2
  {
    'lucilc10': {
      'en': 'Adjust the content below to update your profile.',
      'hi':
          'अपनी प्रोफ़ाइल अपडेट करने के लिए नीचे दी गई सामग्री समायोजित करें.',
      'mr': 'तुमचे प्रोफाइल अपडेट करण्यासाठी खालील सामग्री समायोजित करा.',
    },
    'b58ut7r2': {
      'en': 'Change Photo',
      'hi': 'छवि बदलो',
      'mr': 'फोटो बदला',
    },
    '06fk3krl': {
      'en': 'Full Name',
      'hi': 'पूरा नाम',
      'mr': 'पूर्ण नाव',
    },
    'zheufa26': {
      'en': 'Your full name...',
      'hi': 'आपका पूरा नाम...',
      'mr': 'तुमचे पुर्ण नाव...',
    },
    'mj032fui': {
      'en': 'Water Supply Engineer',
      'hi': 'मालिक/संस्थापक',
      'mr': 'मालक/संस्थापक',
    },
    'u8gtjpo1': {
      'en': 'valvemen',
      'hi': 'वाल्वमेन',
      'mr': 'झडपा',
    },
    'h4hb4apo': {
      'en': 'Role to Assgined',
      'hi': 'भूमिका असाइन की गई',
      'mr': 'नेमून दिलेली भूमिका',
    },
    'flj6hz41': {
      'en': 'Search for an item...',
      'hi': 'किसी आइटम की खोज करें...',
      'mr': 'आयटम शोधा...',
    },
  },
  // Choice
  {
    'nohwakw8': {
      'en': 'Add a Post',
      'hi': 'एक पोस्ट जोड़ें',
      'mr': 'एक पोस्ट जोडा',
    },
    'r4eof16c': {
      'en': 'Add New Tank/Zone',
      'hi': 'नया टैंक/क्षेत्र जोड़ें',
      'mr': 'नवीन टाकी/झोन जोडा',
    },
    'bsok2jr4': {
      'en': 'User Profile',
      'hi': 'उपयोगकर्ता रूपरेखा',
      'mr': 'वापरकर्ता प्रोफाइल',
    },
    'uinu0r67': {
      'en': 'Cancel',
      'hi': 'रद्द',
      'mr': 'रद्द करा',
    },
  },
  // adminpasswd
  {
    '4fk0w9w7': {
      'en': 'Admin Verification',
      'hi': 'व्यवस्थापक सत्यापन',
      'mr': 'प्रशासन सत्यापन',
    },
    'rhwlx721': {
      'en': 'Entter Admin Password.....',
      'hi': 'एडमिन पासवर्ड दर्ज करें.....',
      'mr': 'Admin Password टाका.....',
    },
    'nmkdo698': {
      'en': 'Verify',
      'hi': 'सत्यापित करें',
      'mr': 'सत्यापित करा',
    },
  },
  // intro
  {
    'zn5o7ux5': {
      'en': 'Self Introduction',
      'hi': 'आत्म परिचय',
      'mr': 'स्वत:चा परिचय',
    },
    'hh2mlyj3': {
      'en':
          'Hello, I\'m Ayush Niraj Naphade..\nHope this app will be useful\\\nThis is the v1 of app so it maybe bugy..\nYou can Share your Valuable feedback ',
      'hi':
          'नमस्ते, मैं आयुष नीरज नफड़े हूँ..\nआशा है कि यह ऐप उपयोगी होगा\n\nयह ऐप का v1 है इसलिए इसमें कुछ बग हो सकते हैं..\nआप अपना बहुमूल्य फीडबैक साझा कर सकते हैं',
      'mr':
          'नमस्कार, मी आयुष निरज नाफाडे..\nआशा आहे की हे ॲप उपयुक्त ठरेल\\\nहे ॲपचे v1 आहे म्हणून ते कदाचित बगी आहे..\nतुम्ही तुमचा मौल्यवान अभिप्राय शेअर करू शकता',
    },
    'bhuaxkon': {
      'en': 'Whatsapp No',
      'hi': 'व्हाट्सएप नं.',
      'mr': 'Whatsapp क्र',
    },
    'v44yd323': {
      'en': ' -  +919022393240',
      'hi': '- +919022393240',
      'mr': '- +919022393240',
    },
    '1ypaitfx': {
      'en': 'LinkTree',
      'hi': 'लिंकट्री',
      'mr': 'LinkTree',
    },
  },
  // adminpasswdCopy
  {
    'bfotgvsc': {
      'en': 'Change Admin Password',
      'hi': 'एडमिन पासवर्ड बदलें',
      'mr': 'ॲडमिन पासवर्ड बदला',
    },
    'knttvaey': {
      'en': 'Entter New Admin Password.....',
      'hi': 'नया एडमिन पासवर्ड दर्ज करें.....',
      'mr': 'नवीन ॲडमिन पासवर्ड टाका.....',
    },
    'a5x4whqm': {
      'en': 'Re-Enter New Admin Password.....',
      'hi': 'नया एडमिन पासवर्ड पुनः दर्ज करें.....',
      'mr': 'नवीन प्रशासक पासवर्ड पुन्हा प्रविष्ट करा.....',
    },
    'c02o1a8r': {
      'en': 'Entter Old Admin Password.....',
      'hi': 'पुराना एडमिन पासवर्ड दर्ज करें.....',
      'mr': 'जुना ॲडमिन पासवर्ड टाका.....',
    },
    'auj7j2x2': {
      'en': 'Verify',
      'hi': 'सत्यापित करें',
      'mr': 'सत्यापित करा',
    },
    '43wtbdte': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'mr': 'फील्ड आवश्यक आहे',
    },
    'noe1chm7': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
      'mr': 'कृपया ड्रॉपडाउनमधून एक पर्याय निवडा',
    },
    'i9ba51wc': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'mr': 'फील्ड आवश्यक आहे',
    },
    'zprr7bjd': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
      'mr': 'कृपया ड्रॉपडाउनमधून एक पर्याय निवडा',
    },
    'te72mytf': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
      'mr': 'फील्ड आवश्यक आहे',
    },
    'b5bxv4sj': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
      'mr': 'कृपया ड्रॉपडाउनमधून एक पर्याय निवडा',
    },
  },
  // Miscellaneous
  {
    'l0rpfntr': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'ralasef6': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    '772ygcxn': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'vksx767i': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'od3qbgfe': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'dxu0p07n': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'ysmdxd1l': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    '05tcstyu': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'eqq4odnr': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'yvu7737z': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'gxqj7rxh': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'gdbtg5je': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'g3m38g82': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'bc2tqzhv': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    '27jb62th': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'oj5coa8k': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'mh9s65vr': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'yehuriur': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'gens1f3e': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'bd7uzgz9': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'euou840f': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'jdea1vzz': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    '2jo2hnuh': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    '0phqm0yz': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    '6s6u6k83': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'vxq2cqrv': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'l5w9bjuy': {
      'en': '',
      'hi': '',
      'mr': '',
    },
    'ftglchdn': {
      'en': '',
      'hi': '',
      'mr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
