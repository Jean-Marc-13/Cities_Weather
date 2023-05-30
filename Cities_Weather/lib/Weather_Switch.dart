String getWeatherIcon(String weatherCode) {
  switch (weatherCode) {
    case '01d':
      return 'assets/icons/sunlight.svg';
    case '01n':
      return 'assets/icons/night.svg';
    case '02d':
      return 'assets/icons/sun-cloud.svg';
    case '02n':
      return 'assets/icons/night-cloud.svg';
    case '03d':
    case '03n':
    case '04d':
    case '04n':
      return 'assets/icons/cloud.svg';
    case '09d':
    case '09n':
    case '10d':
    case '10n':
      return 'assets/icons/rain.svg';
    case '11d':
    case '11n':
      return 'assets/icons/thunderstrom.svg';
    case '13d':
    case '13n':
      return 'assets/icons/snow.svg';
    case '50d':
    case '50n':
      return 'assets/icons/haze.svg';
    default:
      return 'assets/icons/unknown.svg';
  }
}
