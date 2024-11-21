//
//  ModelData.swift
//  WeatherApp
//
//  Created by Vagarth Pandey on 22/11/24.
//

import Foundation

var previewWeather: ResponseBody = load("weatherData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't Find \(filename) In Main Bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't Load \(filename) From Main Bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't Parse \(filename) As \(T.self):\n\(error)")
    }
}
