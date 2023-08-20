//
//  ayyyyyyed.swift
//  Project-2
//
//  Created by Alanoud  on 02/02/1445 AH.
//
/*import SwiftUI

struct WeatherModel: Codable {
    let main: Main
    let weather: [Weather]
    let wind: Wind
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let main: String
}

struct Wind: Codable {
    let speed: Double
}

struct aedView: View {
    @State private var weather: WeatherModel?
    
    var body: some View {
        VStack {
            Text("Current Weather")
                .font(.title)
            
            if let weather = weather {
                Text("Temperature: \(weather.main.temp)°C")
                Text("Conditions: \(weather.weather[0].main)")
                Text("Wind Speed: \(weather.wind.speed) m/s")
            } else {
                Text("Fetching weather data...")
            }
        }
        .onAppear {
            fetchWeatherData { fetchedWeather in
                DispatchQueue.main.async {
                    weather = fetchedWeather
                }
            }
        }
    }
    
    func fetchWeatherData(completion: @escaping (WeatherModel?) -> Void) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=24.77&lon=46.73&appid=f6093c3dff5be81bebad7850ddf9256b") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error fetching data: \(error)")
                completion(nil)
                return
            }
            
            if let data = data {
                do {
                    let weather = try JSONDecoder().decode(WeatherModel.self, from: data)
                    completion(weather)
                } catch {
                    print("Error decoding data: \(error)")
                    completion(nil)
                }
            }
        }.resume()
    }
}

struct aedView_Previews: PreviewProvider {
    static var previews: some View {
        aedView()
    }
}
*/
