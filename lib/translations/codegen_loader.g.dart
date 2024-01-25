// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en_US = {
  "lan": "Languages",
  "auth": "Sign Up",
  "firstName": "First Name",
  "lastName": "Last Name",
  "phone": "Phone number",
  "password": "Password",
  "confirmPassword": "Confirm Password",
  "save": "Save",
  "firstNameHint": "Enter your first name",
  "lastNameHint": "Enter your last name",
  "phoneHint": "(__) ___ - __ - __",
  "passwordHint": "Enter your password",
  "confirmPasswordHint": "Enter your confirm password",
  "newAds": "New Ads",
  "title": "Title",
  "description": "Description",
  "address": "Address by location",
  "changeLocation": "Change location",
  "newAdsHint": "Enter product title",
  "descriptionHint": "Enter the description",
  "addressHint": "Enter the map adress"
};
static const Map<String,dynamic> ru_RU = {
  "lan": "Языки",
  "auth": "Регистрация",
  "firstName": "Имя",
  "lastName": "Фамилия",
  "phone": "Номер телефона",
  "password": "Пароль",
  "confirmPassword": "Подтвердите пароль",
  "save": "Сохранить",
  "firstNameHint": "Введите ваше имя",
  "lastNameHint": "Введите вашу фамилию",
  "phoneHint": "(__) ___ - __ - __",
  "passwordHint": "Введите ваш пароль",
  "confirmPasswordHint": "Введите ваш пароль еще раз",
  "newAds": "Новые объявления",
  "title": "Название",
  "description": "Описание",
  "address": "Адрес по геолокации",
  "changeLocation": "Изменить местоположение",
  "newAdsHint": "Введите название объявления",
  "descriptionHint": "Введите описание объявления",
  "addressHint": "Введите адрес объявления"
};
static const Map<String,dynamic> uz_UZ = {
  "lan": "Tillar",
  "auth": "Ro'yxatdan o'tish",
  "firstName": "Ism",
  "lastName": "Familiya",
  "phone": "Telefon raqami",
  "password": "Parol",
  "confirmPassword": "Parolni tasdiqlang",
  "save": "Saqlash",
  "firstNameHint": "Ismingizni kiriting",
  "lastNameHint": "Familiyangizni kiriting",
  "phoneHint": "(__) ___ - __ - __",
  "passwordHint": "Parolni kiriting",
  "confirmPasswordHint": "Parolni tasdiqlang",
  "newAds": "Yangi reklama",
  "title": "Nomi",
  "description": "Tavsif",
  "address": "Manzil",
  "changeLocation": "Manzilni o'zgartirish",
  "newAdsHint": "Reklama nomini kiriting",
  "descriptionHint": "Reklama tavsifini kiriting",
  "addressHint": "Manzilingizni kiriting"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en_US": en_US, "ru_RU": ru_RU, "uz_UZ": uz_UZ};
}
