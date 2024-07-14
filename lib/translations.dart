//Locale locale = new Locale("sw_TZ"); //languageCode=ru or es\
//Get.updateLocale(locale);

abstract class AppTranslation {
  static Map<String, Map<String, String>> translationsKeys = {
    "en_US": enUS,
    "sw_TZ": swTZ
  };
}

final Map<String, String> enUS = {
  'account_no_txt': 'Account-No',
  'password_txt': "Password",

  'event_id': "Event-ID",
  'remember_me' : "Remember Me",
  'terms_and_conditions_b4_logins' : "Terms & Conditions",
  'forget_password_qn' : 'Forget Password?',
  'login_btn_txt' : 'Login'

};

final Map<String, String> swTZ = {
  'account_no_txt': 'Akaunti Nambari',
  'password_txt': "Nywila",

  'event_id': "Shughuli Nambari",
};

