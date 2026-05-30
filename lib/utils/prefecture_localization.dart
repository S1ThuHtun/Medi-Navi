import '../l10n/app_localizations.dart';

String getLocalizedLocationName(
  String locationName,
  AppLocalizations localizations,
) {
  final localizationMap = {
    // Prefectures (47)
    'Tokyo': localizations.prefectureTokyo,
    'Osaka': localizations.prefectureOsaka,
    'Kyoto': localizations.prefectureKyoto,
    'Hokkaido': localizations.prefectureHokkaido,
    'Fukuoka': localizations.prefectureFukuoka,
    'Yokohama': localizations.prefectureYokohama,
    'Nagoya': localizations.prefectureNagoya,
    'Kobe': localizations.prefectureKobe,
    'Hiroshima': localizations.prefectureHiroshima,
    'Sendai': localizations.prefectureSendai,
    'Chiba': localizations.prefectureChiba,
    'Kanagawa': localizations.prefectureKanagawa,
    'Saitama': localizations.prefectureSaitama,
    'Shizuoka': localizations.prefectureShizuoka,
    'Aichi': localizations.prefectureAichi,
    'Hyogo': localizations.prefectureHyogo,
    'Niigata': localizations.prefectureNiigata,
    'Miyagi': localizations.prefectureMiyagi,
    'Nagano': localizations.prefectureNagano,
    'Gifu': localizations.prefectureGifu,
    'Gunma': localizations.prefectureGunma,
    'Tochigi': localizations.prefectureTochigi,
    'Ibaraki': localizations.prefectureIbaraki,
    'Okayama': localizations.prefectureOkayama,
    'Kumamoto': localizations.prefectureKumamoto,
    'Kagoshima': localizations.prefectureKagoshima,
    'Okinawa': localizations.prefectureOkinawa,
    'Nara': localizations.prefectureNara,
    'Shiga': localizations.prefectureShiga,
    'Mie': localizations.prefectureMie,
    'Wakayama': localizations.prefectureWakayama,
    'Yamaguchi': localizations.prefectureYamaguchi,
    'Ehime': localizations.prefectureEhime,
    'Kagawa': localizations.prefectureKagawa,
    'Tokushima': localizations.prefectureTokushima,
    'Kochi': localizations.prefectureKochi,
    'Fukushima': localizations.prefectureFukushima,
    'Yamagata': localizations.prefectureYamagata,
    'Iwate': localizations.prefectureIwate,
    'Akita': localizations.prefectureAkita,
    'Aomori': localizations.prefectureAomori,
    'Ishikawa': localizations.prefectureIshikawa,
    'Fukui': localizations.prefectureFukui,
    'Toyama': localizations.prefectureToyama,
    'Yamanashi': localizations.prefectureYamanashi,
    'Saga': localizations.prefectureSaga,
    'Nagasaki': localizations.prefectureNagasaki,
    'Oita': localizations.prefectureOita,
    'Miyazaki': localizations.prefectureMiyazaki,

    // Tokyo Cities/Wards
    'Shibuya': localizations.cityShibuya,
    'Shinjuku': localizations.cityShinjuku,
    'Chiyoda': localizations.cityChiyoda,
    'Minato': localizations.cityMinato,
    'Setagaya': localizations.citySetagaya,

    // Osaka Cities/Wards
    'Kita': localizations.cityKita,
    'Chuo': localizations.cityChuo,
    'Tennoji': localizations.cityTennoji,

    // Kyoto Cities/Wards
    'Shimogyo': localizations.cityShimogyo,
    'Higashiyama': localizations.cityHigashiyama,
    'Sakyo': localizations.citySakyo,

    // Hokkaido Cities
    'Sapporo': localizations.citySapporo,
    'Hakodate': localizations.cityHakodate,
    'Asahikawa': localizations.cityAsahikawa,

    // Fukuoka Cities
    'Hakata': localizations.cityHakata,
    'Tenjin': localizations.cityTenjin,

    // Yokohama Cities
    'Naka': localizations.cityNaka,

    // Wards/Districts
    'Shibuya Ward': localizations.wardShibuya,
    'Shinjuku Ward': localizations.wardShinjuku,
    'Chiyoda Ward': localizations.wardChiyoda,
    'Tennoji Ward': localizations.wardTennoji,

    // Districts/Areas
    'Harajuku': localizations.areaHarajuku,
    'Ebisu': localizations.areaEbisu,
    'Kabukicho': localizations.areaKabukicho,
    'Yotsuya': localizations.areaYotsuya,
    'Marunouchi': localizations.areaMarunouchi,
    'Akihabara': localizations.areaAkihabara,
    'Kanda': localizations.areaKanda,
    'Roppongi': localizations.areaRoppongi,
    'Azabu': localizations.areaAzabu,
    'Odaiba': localizations.areaOdaiba,
    'Shimokitazawa': localizations.areaShimokitazawa,
    'Sangenjaya': localizations.areaSangenjaya,
    'Umeda': localizations.areaUmeda,
    'Nakanoshima': localizations.areaNakanoshima,
    'Namba': localizations.areaNamba,
    'Shinsaibashi': localizations.areaShinsaibashi,
    'Dotonbori': localizations.areaDotonbori,
    'Abeno': localizations.areaAbeno,
    'Kyoto Station Area': localizations.areaKyotoStation,
    'Gion': localizations.areaGion,
    'Kiyomizu': localizations.areaKiyomizu,
    'Ginkakuji Area': localizations.areaGinkakuji,
    'Susukino': localizations.areaSusukino,
    'Hakata Station Area': localizations.areaHakataStation,
    'Canal City': localizations.areaCanal,
    'Tenjin Central': localizations.areaTenjinCentral,
    'Chinatown': localizations.areaChinatown,
    'Minato Mirai': localizations.areaMinatoMirai,
  };

  return localizationMap[locationName] ?? locationName;
}
