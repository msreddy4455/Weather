import SwiftUI

enum TemperatureUnit: String, CaseIterable, Identifiable {
    
    var id: String {
        return rawValue
    }
    
    case celsius
    case fahrenheit
    case kelvin
}

extension TemperatureUnit {
    
    var displayText: String {
        switch self {
            case .celsius:
                return "Celsius"
            case .fahrenheit:
                return "Fahrenheit"
            case .kelvin:
                return "Kelvin"
        }
    }
    
}

struct AddCity: View {
    
    @EnvironmentObject var store: StateStore
    @Environment(\.presentationMode) private var presentationMode
    @StateObject private var addWeatherVM = AddWeatherViewModel()
    
    var body: some View {
        
        VStack {
            VStack(spacing: 20) {
                TextField("City Name", text: $addWeatherVM.city)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Save") {
                    addWeatherVM.save { weather in
                        store.addWeather(weather)
                        presentationMode.wrappedValue.dismiss()
                    }
                    
                }.padding(10)
                .frame(maxWidth: UIScreen.main.bounds.width/4)
                .foregroundColor(Color.white)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            }.padding()
            .frame(maxWidth: .infinity, maxHeight: 100)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
         Spacer()
        }.padding()
        
            .navigationTitle("Enter City")
        .embedInNavigationView()
    }
}

struct AddCity_Previews: PreviewProvider {
    static var previews: some View {
        AddCity().environmentObject(StateStore())
    }
}


