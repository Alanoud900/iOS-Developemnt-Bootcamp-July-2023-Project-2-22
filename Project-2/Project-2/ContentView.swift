/*import SwiftUI

struct ContentView: View {
   
    let session: URLSession = .shared
    
    @State var dataModel: Weather?
    
    var body: some View {
        VStack {
            Text("Results:")
                .font(.title)
                .padding()
            
            Button("Fetch Weather") {
                loadData()
            }
            
            if let cityName = dataModel?.name {
                Text("City: \(cityName)")
                    .font(.headline)
                    .padding()
            }
            
            if let temperature = dataModel?.main.temp {
                Text("Temperature: \(temperature)°C")
                    .padding()
            }
            
            if let humidity = dataModel?.main.humidity {
                Text("Humidity: \(humidity)%")
                    .padding()
            }
            
            ForEach(dataModel?.weather ?? [], id: \.self) { w in
                Text(w.description)
            }
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=24.77&lon=46.73&appid=f6093c3dff5be81bebad7850ddf9256b") else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("f6093c3dff5be81bebad7850ddf9256b", forHTTPHeaderField: "X-Api-Key")
        
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let weatherData = try decoder.decode(Weather.self, from: data)
                    dataModel = weatherData
                    print(weatherData)
                } catch {
                    print("Error decoding data: \(error)")
                }
            }
        }
        
        task.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/
 import SwiftUI

 struct ContentView: View {
    
     let session: URLSession = .shared
     
     @State var dataModel: Weather?
     @State private var searched = ""
    // @State private var searchQuery = ""
     var body: some View {
         
         VStack {
             TextField("Enter city name", text: $searched)
                 .textFieldStyle(RoundedBorderTextFieldStyle())
                                 .padding()
             ZStack{
                 
                 Rectangle() // Adding a Rectangle
                     .frame(width: 350, height: 200)
                     .foregroundColor(.cyan)
                     .cornerRadius(16)
                 HStack{
                     if let cityName = dataModel?.name,
                        let temperature = dataModel?.main.temp,
                        let humidity = dataModel?.main.humidity {
                         Text("\nCity: \(cityName)\nTemperature: \(temperature)°C\nHumidity: \(humidity)%")
                             .multilineTextAlignment(.leading)
                             .foregroundColor(.white)
                             .bold()
                     } else {
                         Text("Fetch Weather")
                     }
                     ForEach(dataModel?.weather ?? [], id: \.self) { w in
                         Text(w.description)
                     }
                     .bold()
                     AsyncImage(url:URL(string:"https://openweathermap.org/img/wn/10d@2x.png"))
                 }
                 .padding(.trailing)
                 
             }
             Rectangle() // Adding a Rectangle
                 .frame(width: 350, height: 200)
                 .foregroundColor(.cyan)
                 .cornerRadius(16)
             
             
             Rectangle() // Adding a Rectangle
                 .frame(width: 350, height: 200)
                 .foregroundColor(.cyan)
                 .cornerRadius(16)
         }.onChange(of: searched, perform: {newValue in
             loadData()
         })
         
         .task {
             await loadData()
         }
     }
     
     func loadData() {
         guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=24.77&lon=46.73&appid=f6093c3dff5be81bebad7850ddf9256b") else {
             print("Invalid URL")
             return
         }
         
         var request = URLRequest(url: url)
         request.setValue("f6093c3dff5be81bebad7850ddf9256b", forHTTPHeaderField: "X-Api-Key")
         
         let task = session.dataTask(with: request) { data, response, error in
             if let error = error {
                 print("Error fetching data: \(error)")
                 return
             }
             
             if let data = data {
                 do {
                     let decoder = JSONDecoder()
                     let weatherData = try decoder.decode(Weather.self, from: data)
                     dataModel = weatherData
                     print(weatherData)
                 } catch {
                     print("Error decoding data: \(error)")
                 }
             }
         }
         
         task.resume()
     }
 }

 struct ContentView_Previews: PreviewProvider {
     static var previews: some View {
         ContentView()
     }
 }
