import Foundation

struct WeatherViewModel {
    
    let weather: Weather
    
    let id = UUID()
    
    var temperature: Double {
        return weather.temperature
    }
    
    var city: String {
        return weather.city
    }
    
    var icon: String {
        return weather.icon
    }
}


