// Data model for location hierarchy
class LocationData {
  final String name;
  final double lat;
  final double lng;
  final Map<String, LocationData>? children;

  const LocationData({
    required this.name,
    required this.lat,
    required this.lng,
    this.children,
  });
}

// Japanese Prefectures with Cities and Wards
const Map<String, LocationData> japanesePrefectures = {
  'Tokyo': LocationData(
    name: 'Tokyo',
    lat: 35.6762,
    lng: 139.6503,
    children: {
      'Shibuya': LocationData(
        name: 'Shibuya',
        lat: 35.6580,
        lng: 139.7016,
        children: {
          'Shibuya Ward': LocationData(name: 'Shibuya Ward', lat: 35.6617, lng: 139.7040),
          'Harajuku': LocationData(name: 'Harajuku', lat: 35.6702, lng: 139.7027),
          'Ebisu': LocationData(name: 'Ebisu', lat: 35.6467, lng: 139.7100),
        },
      ),
      'Shinjuku': LocationData(
        name: 'Shinjuku',
        lat: 35.6938,
        lng: 139.7034,
        children: {
          'Shinjuku Ward': LocationData(name: 'Shinjuku Ward', lat: 35.6938, lng: 139.7034),
          'Kabukicho': LocationData(name: 'Kabukicho', lat: 35.6947, lng: 139.7021),
          'Yotsuya': LocationData(name: 'Yotsuya', lat: 35.6869, lng: 139.7300),
        },
      ),
      'Chiyoda': LocationData(
        name: 'Chiyoda',
        lat: 35.6938,
        lng: 139.7536,
        children: {
          'Marunouchi': LocationData(name: 'Marunouchi', lat: 35.6812, lng: 139.7671),
          'Akihabara': LocationData(name: 'Akihabara', lat: 35.6984, lng: 139.7731),
          'Kanda': LocationData(name: 'Kanda', lat: 35.6916, lng: 139.7708),
        },
      ),
      'Minato': LocationData(
        name: 'Minato',
        lat: 35.6585,
        lng: 139.7514,
        children: {
          'Roppongi': LocationData(name: 'Roppongi', lat: 35.6627, lng: 139.7297),
          'Azabu': LocationData(name: 'Azabu', lat: 35.6553, lng: 139.7389),
          'Odaiba': LocationData(name: 'Odaiba', lat: 35.6249, lng: 139.7751),
        },
      ),
      'Setagaya': LocationData(
        name: 'Setagaya',
        lat: 35.6464,
        lng: 139.6533,
        children: {
          'Shimokitazawa': LocationData(name: 'Shimokitazawa', lat: 35.6612, lng: 139.6681),
          'Sangenjaya': LocationData(name: 'Sangenjaya', lat: 35.6433, lng: 139.6706),
        },
      ),
    },
  ),
  'Osaka': LocationData(
    name: 'Osaka',
    lat: 34.6937,
    lng: 135.5023,
    children: {
      'Kita': LocationData(
        name: 'Kita',
        lat: 34.7024,
        lng: 135.4959,
        children: {
          'Umeda': LocationData(name: 'Umeda', lat: 34.7024, lng: 135.4959),
          'Nakanoshima': LocationData(name: 'Nakanoshima', lat: 34.6920, lng: 135.5050),
        },
      ),
      'Chuo': LocationData(
        name: 'Chuo',
        lat: 34.6794,
        lng: 135.5106,
        children: {
          'Namba': LocationData(name: 'Namba', lat: 34.6661, lng: 135.5008),
          'Shinsaibashi': LocationData(name: 'Shinsaibashi', lat: 34.6722, lng: 135.5022),
          'Dotonbori': LocationData(name: 'Dotonbori', lat: 34.6687, lng: 135.5028),
        },
      ),
      'Tennoji': LocationData(
        name: 'Tennoji',
        lat: 34.6452,
        lng: 135.5144,
        children: {
          'Tennoji Ward': LocationData(name: 'Tennoji Ward', lat: 34.6452, lng: 135.5144),
          'Abeno': LocationData(name: 'Abeno', lat: 34.6467, lng: 135.5142),
        },
      ),
    },
  ),
  'Kyoto': LocationData(
    name: 'Kyoto',
    lat: 35.0116,
    lng: 135.7681,
    children: {
      'Shimogyo': LocationData(
        name: 'Shimogyo',
        lat: 34.9876,
        lng: 135.7538,
        children: {
          'Kyoto Station Area': LocationData(name: 'Kyoto Station Area', lat: 34.9857, lng: 135.7588),
        },
      ),
      'Higashiyama': LocationData(
        name: 'Higashiyama',
        lat: 35.0000,
        lng: 135.7803,
        children: {
          'Gion': LocationData(name: 'Gion', lat: 35.0033, lng: 135.7757),
          'Kiyomizu': LocationData(name: 'Kiyomizu', lat: 34.9948, lng: 135.7850),
        },
      ),
      'Sakyo': LocationData(
        name: 'Sakyo',
        lat: 35.0501,
        lng: 135.7939,
        children: {
          'Ginkakuji Area': LocationData(name: 'Ginkakuji Area', lat: 35.0269, lng: 135.7982),
        },
      ),
    },
  ),
  'Hokkaido': LocationData(
    name: 'Hokkaido',
    lat: 43.0642,
    lng: 141.3469,
    children: {
      'Sapporo': LocationData(
        name: 'Sapporo',
        lat: 43.0621,
        lng: 141.3544,
        children: {
          'Chuo': LocationData(name: 'Chuo', lat: 43.0554, lng: 141.3414),
          'Kita': LocationData(name: 'Kita', lat: 43.0900, lng: 141.3400),
          'Susukino': LocationData(name: 'Susukino', lat: 43.0530, lng: 141.3530),
        },
      ),
      'Hakodate': LocationData(
        name: 'Hakodate',
        lat: 41.7688,
        lng: 140.7289,
      ),
      'Asahikawa': LocationData(
        name: 'Asahikawa',
        lat: 43.7706,
        lng: 142.3650,
      ),
    },
  ),
  'Fukuoka': LocationData(
    name: 'Fukuoka',
    lat: 33.5904,
    lng: 130.4017,
    children: {
      'Hakata': LocationData(
        name: 'Hakata',
        lat: 33.5902,
        lng: 130.4205,
        children: {
          'Hakata Station Area': LocationData(name: 'Hakata Station Area', lat: 33.5902, lng: 130.4205),
          'Canal City': LocationData(name: 'Canal City', lat: 33.5906, lng: 130.4116),
        },
      ),
      'Tenjin': LocationData(
        name: 'Tenjin',
        lat: 33.5904,
        lng: 130.4017,
        children: {
          'Tenjin Central': LocationData(name: 'Tenjin Central', lat: 33.5904, lng: 130.4017),
        },
      ),
    },
  ),
  'Yokohama': LocationData(
    name: 'Yokohama',
    lat: 35.4437,
    lng: 139.6380,
    children: {
      'Naka': LocationData(
        name: 'Naka',
        lat: 35.4437,
        lng: 139.6380,
        children: {
          'Chinatown': LocationData(name: 'Chinatown', lat: 35.4437, lng: 139.6454),
          'Minato Mirai': LocationData(name: 'Minato Mirai', lat: 35.4553, lng: 139.6317),
        },
      ),
    },
  ),
  'Nagoya': LocationData(name: 'Nagoya', lat: 35.1815, lng: 136.9066),
  'Kobe': LocationData(name: 'Kobe', lat: 34.6901, lng: 135.1955),
  'Hiroshima': LocationData(name: 'Hiroshima', lat: 34.3853, lng: 132.4553),
  'Sendai': LocationData(name: 'Sendai', lat: 38.2682, lng: 140.8694),
  'Chiba': LocationData(name: 'Chiba', lat: 35.6074, lng: 140.1065),
  'Kanagawa': LocationData(name: 'Kanagawa', lat: 35.4478, lng: 139.6425),
  'Saitama': LocationData(name: 'Saitama', lat: 35.8617, lng: 139.6455),
  'Shizuoka': LocationData(name: 'Shizuoka', lat: 34.9769, lng: 138.3831),
  'Aichi': LocationData(name: 'Aichi', lat: 35.1802, lng: 136.9066),
  'Hyogo': LocationData(name: 'Hyogo', lat: 34.6913, lng: 135.1830),
  'Niigata': LocationData(name: 'Niigata', lat: 37.9026, lng: 139.0232),
  'Miyagi': LocationData(name: 'Miyagi', lat: 38.2682, lng: 140.8694),
  'Nagano': LocationData(name: 'Nagano', lat: 36.6513, lng: 138.1810),
  'Gifu': LocationData(name: 'Gifu', lat: 35.3912, lng: 136.7223),
  'Gunma': LocationData(name: 'Gunma', lat: 36.3911, lng: 139.0608),
  'Tochigi': LocationData(name: 'Tochigi', lat: 36.5658, lng: 139.8836),
  'Ibaraki': LocationData(name: 'Ibaraki', lat: 36.3418, lng: 140.4468),
  'Okayama': LocationData(name: 'Okayama', lat: 34.6617, lng: 133.9350),
  'Kumamoto': LocationData(name: 'Kumamoto', lat: 32.7898, lng: 130.7417),
  'Kagoshima': LocationData(name: 'Kagoshima', lat: 31.5966, lng: 130.5571),
  'Okinawa': LocationData(name: 'Okinawa', lat: 26.2124, lng: 127.6809),
  'Nara': LocationData(name: 'Nara', lat: 34.6851, lng: 135.8048),
  'Shiga': LocationData(name: 'Shiga', lat: 35.0045, lng: 135.8686),
  'Mie': LocationData(name: 'Mie', lat: 34.7303, lng: 136.5086),
  'Wakayama': LocationData(name: 'Wakayama', lat: 34.2261, lng: 135.1675),
  'Yamaguchi': LocationData(name: 'Yamaguchi', lat: 34.1861, lng: 131.4714),
  'Ehime': LocationData(name: 'Ehime', lat: 33.8416, lng: 132.7657),
  'Kagawa': LocationData(name: 'Kagawa', lat: 34.3401, lng: 134.0434),
  'Tokushima': LocationData(name: 'Tokushima', lat: 34.0658, lng: 134.5594),
  'Kochi': LocationData(name: 'Kochi', lat: 33.5597, lng: 133.5311),
  'Fukushima': LocationData(name: 'Fukushima', lat: 37.7503, lng: 140.4676),
  'Yamagata': LocationData(name: 'Yamagata', lat: 38.2404, lng: 140.3633),
  'Iwate': LocationData(name: 'Iwate', lat: 39.7036, lng: 141.1527),
  'Akita': LocationData(name: 'Akita', lat: 39.7186, lng: 140.1024),
  'Aomori': LocationData(name: 'Aomori', lat: 40.8244, lng: 140.7400),
  'Ishikawa': LocationData(name: 'Ishikawa', lat: 36.5946, lng: 136.6256),
  'Fukui': LocationData(name: 'Fukui', lat: 36.0652, lng: 136.2216),
  'Toyama': LocationData(name: 'Toyama', lat: 36.6953, lng: 137.2113),
  'Yamanashi': LocationData(name: 'Yamanashi', lat: 35.6636, lng: 138.5684),
  'Saga': LocationData(name: 'Saga', lat: 33.2635, lng: 130.3000),
  'Nagasaki': LocationData(name: 'Nagasaki', lat: 32.7503, lng: 129.8777),
  'Oita': LocationData(name: 'Oita', lat: 33.2382, lng: 131.6126),
  'Miyazaki': LocationData(name: 'Miyazaki', lat: 31.9077, lng: 131.4202),
};
