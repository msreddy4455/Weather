import Foundation

struct WeatherResponse: Decodable {
    let name: String
    var weather: Weather
    let icon: [WeatherIcon]
    let sys: Sys
    
    private enum CodingKeys: String, CodingKey {
        case name
        case weather = "main"
        case icon = "weather"
        case sys = "sys"
    }
    
    enum WeatherKeys: String, CodingKey {
        case temperature = "temp"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try container.decode(String.self, forKey: .name)
        icon = try container.decode([WeatherIcon].self, forKey: .icon)
        sys = try container.decode(Sys.self, forKey: .sys)
        
        let weatherContainer = try container.nestedContainer(keyedBy: WeatherKeys.self, forKey: .weather)
        let temperature = try weatherContainer.decode(Double.self, forKey: .temperature)
        weather = Weather(city: name, temperature: temperature, icon: icon.first!.icon)
    }
}

struct Sys: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case sunrise = "sunrise"
        case sunset = "sunset"
    }
    
    init(from decoder: Decoder) throws {
        _ = try decoder.container(keyedBy: CodingKeys.self)
    }
    
}

struct WeatherIcon: Decodable {
    let main: String
    let description: String
    let icon: String
}

struct Weather: Decodable {
    let city: String
    let temperature: Double
    let icon: String
}
