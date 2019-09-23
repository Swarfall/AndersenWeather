//
//  ViewController.swift
//  AndersenWeather
//
//  Created by admin on 9/16/19.
//  Copyright © 2019 Viacheslav Savitsky. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class WeatherViewController: UIViewController {

    @IBOutlet weak var parametrsView: UIView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var atmosphericLabel: UILabel!
    @IBOutlet weak var himbidityLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var windDirectionLabel: UILabel!
    @IBOutlet weak var kyivButton: UIButton!
    @IBOutlet weak var minskButton: UIButton!
    @IBOutlet weak var moscowButton: UIButton!
    @IBOutlet weak var mapView: GMSMapView!
    
    var searchModel = SearchModel()
    var weatherModel = WeatherModel()
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        afterTapChangeStyleButton(tapButton: kyivButton,
                                  firstCalmButton: minskButton,
                                  secondCalmButton: moscowButton)
        getData()
        roundCornerRadius(view: parametrsView)
        roundCornerRadius(view: mapView)
    }

    @IBAction func didTapShowKyivButton(_ sender: Any) {
        afterTapChangeStyleButton(tapButton: kyivButton,
                                  firstCalmButton: minskButton,
                                  secondCalmButton: moscowButton)
        searchModel.city = "Kyiv"
        getData()
    }
    
    @IBAction func didTapShowMinskButton(_ sender: Any) {
        afterTapChangeStyleButton(tapButton: minskButton,
                                  firstCalmButton: kyivButton,
                                  secondCalmButton: moscowButton)
        searchModel.city = "Minsk"
        getData()
    }
    
    @IBAction func didTapShowMoscowButton(_ sender: Any) {
        afterTapChangeStyleButton(tapButton: moscowButton,
                                  firstCalmButton: kyivButton,
                                  secondCalmButton: minskButton)
        searchModel.city = "Moscow"
        getData()
    }
    
    func getData() {
        
        if (searchModel.city ?? "").contains(" ") {
            searchModel.city = searchModel.city?.replacingOccurrences(of: " ", with: "%20")
        }
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(searchModel.city ?? "")") else { return }
        debugPrint(url)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = searchModel.apiKey
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            guard let data = data else {
                return
            }
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    if let coordinate = json["coord"] as? [String: Any] {
                        if let long = coordinate["lon"] as? Double {
                            self.weatherModel.long = long
                        }
                        if let lat = coordinate["lat"] as? Double {
                            self.weatherModel.lat = lat
                        }
                    }
                    
                    if let main = json["main"] as? [String: Any] {
                        if let temperature = main["temp"] as? Double {
                            self.weatherModel.temperature = temperature
                        }
                        if let pressure = main["pressure"] as? Int {
                            self.weatherModel.atmosphericPressure = pressure
                        }
                        if let humidity = main["humidity"] as? Int {
                            self.weatherModel.humidity = humidity
                        }
                    }
                    
                    if let wind = json["wind"] as? [String: Any] {
                        if let windSpeed = wind["speed"] as? Double {
                            self.weatherModel.windSpeed = windSpeed
                        }
                        if let windDirection = wind["deg"] as? Int {
                            self.weatherModel.windDirection = windDirection
                        }
                    }
                    
                    DispatchQueue.main.async {
                        self.setDataLabels(weatherData: self.weatherModel)
                        self.setCurrentLocation()
                    }
                }
            } catch let error as NSError {
                debugPrint("Faild to lead: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
    
    func setDataLabels(weatherData: WeatherModel) {
        temperatureLabel.text = "Temperature: \(weatherData.temperature ?? 0) °F"
        atmosphericLabel.text = "Atmospheric pressure: \(weatherData.atmosphericPressure ?? 0) hPa"
        himbidityLabel.text = "Humidity: \(weatherData.humidity ?? 0) %"
        windSpeedLabel.text = "Wind speed: \(weatherData.windSpeed ?? 0) meter/sec"
        windDirectionLabel.text = "Wind direction: \(weatherData.windDirection ?? 0) °"
    }
    
    func afterTapChangeStyleButton(tapButton: UIButton, firstCalmButton: UIButton, secondCalmButton: UIButton) {
        tapButton.titleLabel?.textColor = .blue
        tapButton.setTitleColor(.blue, for: .normal)
        
        firstCalmButton.setTitleColor(.orange, for: .normal)
        firstCalmButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        secondCalmButton.setTitleColor(.orange, for: .normal)
        secondCalmButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
    }
    
    func roundCornerRadius(view: UIView) {
        view.layer.cornerRadius = 25
        view.clipsToBounds = true
    }
}

extension WeatherViewController: GMSMapViewDelegate, CLLocationManagerDelegate {

    func setCurrentLocation() {
        mapView.delegate = self
        mapView.isMyLocationEnabled = true
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let camera = GMSCameraPosition.camera(withLatitude: self.weatherModel.lat ?? 0,
                                              longitude: self.weatherModel.long ?? 0, zoom: 10)
        self.mapView.animate(to: camera)
        self.locationManager.stopUpdatingLocation()
    }
}
