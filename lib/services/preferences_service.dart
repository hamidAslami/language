
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static AppPreferences? _instance;
  static SharedPreferences? _preferences;

  static Future<AppPreferences> getInstance() async {
    if (_instance == null) {
      _instance = AppPreferences();
    }

    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }

    return _instance!;
  }

//*********************

  static const String TokenKey = "Token";
  static const String IsFirstTimeLaunchKey = "IsFirstTimeLaunch";
  static const String UserKey = "User";
  static const String themeKey = "themeKey";
  static const String PhoneNumberKey = "PhoneNumber";
  static const String Name = "Name";
  static const String Avatar = "Avatar";
  static const String DefaultAddressIDKey = "DefaultAddressID";
  static const String popularTagsKey = "popularTags";
  static const String categoriesKey = "categories";
  static const String prefSelectedLanguageCode = "SelectedLanguageCode";

  // Future clearPref() async {
  //   final AppDatabase _databaseService = locator<AppDatabase>();
  //
  //   var a = _preferences.remove(TokenKey);
  //   var b = _preferences.remove(UserKey);
  //   var c = _preferences.remove(PhoneNumberKey);
  //   var d = _preferences.remove(DefaultAddressIDKey);
  //
  //   var e = _databaseService.resetDb();
  //
  //   var futures = <Future>[a, b, c, d, e];
  //
  //   await Future.wait(futures);
  // }





  List<String> get popularTags => _getFromDisk(popularTagsKey) ?? [];

  set popularTags(List<String> value) => _saveToDisk(popularTagsKey, value);

  bool get isFirstTimeLaunch => _getFromDisk(IsFirstTimeLaunchKey) ?? true;

  set isFirstTimeLaunch(bool value) => _saveToDisk(IsFirstTimeLaunchKey, value);

  int get getTheme => _getFromDisk(themeKey) ?? 0;

  set setTheme(int value) => _saveToDisk(themeKey, value);

  String get phoneNumber => _getFromDisk(PhoneNumberKey) ?? "";

  set phoneNumber(String phone) => _saveToDisk(PhoneNumberKey, phone);

  String get name => _getFromDisk(Name) ?? "";

  set name(String nameValue) => _saveToDisk(Name, nameValue);

  String get avatar => _getFromDisk(Avatar) ?? "";

  set avatar(String imageAvatar) => _saveToDisk(Avatar, imageAvatar);

  int get defaultAddressID => _getFromDisk(DefaultAddressIDKey);

  set defaultAddressID(int id) => _saveToDisk(DefaultAddressIDKey, id);

  String get token => _getFromDisk(TokenKey) ?? "";

  set token(String phone) => _saveToDisk(TokenKey, phone);

  //todo use _getFromDisk
  Map<String, String> getHeaders() {
    String tokenValue;
    if (_preferences!.getString(TokenKey) != null) {
      tokenValue = _preferences!.getString(TokenKey)!;
    } else {
      tokenValue = "";
    }

    Map<String, String> headers = {
      'apiLevel': "1",
      'appVersion': "1",
      'token': tokenValue,
    };

    return headers;
  }

  //todo use _getFromDisk
  Map<String, String> getUploadHeaders() {
    String tokenValue;

    if (_preferences!.getString(TokenKey) != null) {
      tokenValue = _preferences!.getString(TokenKey)!;
    } else {
      tokenValue = "";
    }

    Map<String, String> headers = {
      'Authorization': "",
      'token': tokenValue,
      'deviceid': "deviceid", //todo
    };

    return headers;
  }

  //************************************************

  dynamic _getFromDisk(String key) {
    var value = _preferences!.get(key);
    print(
        '(TRACE) AppPreferencesService:_getFromDisk. key: $key value: $value');
    return value;
  }

  // User get user {
  //   var userJson = _getFromDisk(UserKey);
  //   if (userJson == null) {
  //     return null;
  //   }
  //   return User.fromJson(json.decode(userJson));
  // }
  //
  // set user(User userToSave) {
  //   _saveToDisk<String>(UserKey, json.encode(userToSave.toJson()));
  // }

  void _saveToDisk<T>(String key, T content) {
    print('(TRACE) LocalStorageService:_saveToDisk. key: $key value: $content');

    if (content is String) {
      _preferences!.setString(key, content);
    }
    if (content is bool) {
      _preferences!.setBool(key, content);
    }
    if (content is int) {
      _preferences!.setInt(key, content);
    }
    if (content is double) {
      _preferences!.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences!.setStringList(key, content);
    }
  }
}
