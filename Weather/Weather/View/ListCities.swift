import SwiftUI

enum SelectedDisplay: Identifiable {
    
    var id: UUID {
        return UUID()
    }
    
    case addNewCity
}

struct ListCities: View {

    @EnvironmentObject var store: StateStore
    @State private var display: SelectedDisplay?
    
    var body: some View {
        
        List {
            ForEach(store.weatherList, id: \.id) { weather in
                WeatherCell(weather: weather)
            }
            }
        .listStyle(PlainListStyle())
        
        .sheet(item: $display, content: { (item) in
            switch item {
                case .addNewCity:
                    AddCity().environmentObject(store)
            }
        })
        .navigationTitle("Cities Weather")
                        .toolbar {
                            Button(action: {
                                 display = .addNewCity
                             }) {
                                 Image(systemName: "plus")
                             }
                        }.embedInNavigationView()
       
    }
}

struct ListCities_Previews: PreviewProvider {
    static var previews: some View {
        ListCities().environmentObject(StateStore())
    }
}

struct WeatherCell: View {
    
    let weather: WeatherViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 15) {
                Text(weather.city)
                    .fontWeight(.bold)
            }
            Spacer()
            LoadImage(url: Constants.Urls.weatherIcon(icon: weather.icon))
                .frame(width: 50, height: 50)
            
            Text("\(Int(weather.temperature)) K")
        }
        .padding()
        .background(Color.teal)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))

    }
}
