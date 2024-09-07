import Foundation

struct Constants {
    struct Urls {
        static func weatherOfCity(city: String) -> URL? {
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=917df052acaffe5f1e36b3f2ec05557e")
        }
        
        static func weatherIcon(icon: String) -> String {
            return "https://openweathermap.org/img/w/\(icon).png"
        }
    }
}
