class WeatherForecast {
  String? cityName;
  double? temp1;
  String? desc1;
  int? dt1;
  double? temp2;
  String? desc2;
  int? dt2;

  double? temp3;
  String? desc3;
  int? dt3;

  double? temp4;
  String? desc4;
  int? dt4;

  double? temp5;
  String? desc5;
  int? dt5;
  double? temp6;
  String? desc6;
  int? dt6;
  double? temp7;
  String? desc7;
  int? dt7;
  double? temp8;
  String? desc8;
  int? dt8;
  double? temp9;
  String? desc9;
  int? dt9;
  double? temp10;
  String? desc10;
  int? dt10;

  WeatherForecast({
    this.cityName,
    this.temp1,
    this.desc1,
    this.dt1,
    this.temp2,
    this.desc2,
    this.dt2,
    this.temp3,
    this.desc3,
    this.dt3,
    this.temp4,
    this.desc4,
    this.dt4,
    this.temp5,
    this.desc5,
    this.dt5,
    this.temp6,
    this.desc6,
    this.dt6,
    this.temp7,
    this.desc7,
    this.dt7,
    this.temp8,
    this.desc8,
    this.dt8,
    this.temp9,
    this.desc9,
    this.dt9,
    this.temp10,
    this.desc10,
    this.dt10,
  });

  WeatherForecast.fromJson(Map<String, dynamic> json) {
    cityName = json['city']['name'];

    temp1 = json['list'][0]['main']['temp'];
    desc1 = json['list'][0]['weather'][0]['description'];
    dt1 = json['list'][0]['dt'];
    temp2 = json['list'][1]['main']['temp'];
    desc2 = json['list'][1]['weather'][0]['description'];
    dt2 = json['list'][1]['dt'];

    temp3 = json['list'][2]['main']['temp'];
    desc3 = json['list'][2]['weather'][0]['description'];
    dt3 = json['list'][2]['dt'];

    temp4 = json['list'][3]['main']['temp'];
    desc4 = json['list'][3]['weather'][0]['description'];
    dt4 = json['list'][3]['dt'];

    temp5 = json['list'][4]['main']['temp'];
    desc5 = json['list'][4]['weather'][0]['description'];
    dt5 = json['list'][4]['dt'];

    temp6 = json['list'][5]['main']['temp'];
    desc6 = json['list'][5]['weather'][0]['description'];
    dt6 = json['list'][5]['dt'];

    temp7 = json['list'][6]['main']['temp'];
    desc7 = json['list'][6]['weather'][0]['description'];
    dt7 = json['list'][6]['dt'];

    temp8 = json['list'][7]['main']['temp'];
    desc8 = json['list'][7]['weather'][0]['description'];
    dt8 = json['list'][7]['dt'];

    temp9 = json['list'][8]['main']['temp'];
    desc9 = json['list'][8]['weather'][0]['description'];
    dt9 = json['list'][8]['dt'];

    temp10 = json['list'][9]['main']['temp'];
    desc10 = json['list'][9]['weather'][0]['description'];
    dt10 = json['list'][9]['dt'];
  }
}
