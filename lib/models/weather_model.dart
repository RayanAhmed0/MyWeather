class Weather {
  String? cityName;
  double? temp;
  double? wind;
  int? humidity;
  double? feels_like;
  int? pressure;
  String? desc;
  int? sunset;
  int? sunrise;
  // int? dt;

  Weather(
      {this.cityName,
      this.feels_like,
      this.humidity,
      this.pressure,
      this.temp,
      this.wind,
      this.desc,
      this.sunrise,
      this.sunset,
      // this.dt
      });

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json['name'];
    temp = json['main']['temp'];
    wind = json['wind']['speed'];
    humidity = json['main']['humidity'];
    feels_like = json['main']['feels_like'];
    pressure = json['main']['pressure'];
    desc = json['weather'][0]['description'];
    sunset = json['sys']['sunset'];
    sunrise = json['sys']['sunrise'];
    // dt = json['dt'];
  }
}
