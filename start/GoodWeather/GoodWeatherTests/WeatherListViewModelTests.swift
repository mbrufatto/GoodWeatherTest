//
//  WeatherListViewModelTests.swift
//  GoodWeatherTests
//
//  Created by Marcio Brufatto on 18/12/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import XCTest
@testable import GoodWeather

class WeatherListViewModelTests: XCTestCase {

    private var weatherListViewModel: WeatherListViewModel!
    
    override func setUp() {
        super.setUp()
        
        self.weatherListViewModel = WeatherListViewModel()
        
        self.weatherListViewModel.addWeatherViewModel(WeatherViewModel(name: "Houston", currentTemperature: TemperatureViewModel(temperature: 32, temperatureMin: 0, temperatureMax: 0)))
        
        self.weatherListViewModel.addWeatherViewModel(WeatherViewModel(name: "Austin", currentTemperature: TemperatureViewModel(temperature: 72, temperatureMin: 0, temperatureMax: 0)))
    }
    
    func test_should_be_able_to_convert_celsius_successfully() {
        
        let celsiusTemperatures = [0, 22.2222]
        self.weatherListViewModel.updateUnit(to: .celsius)
        
        for (index, viewModel) in self.weatherListViewModel.weatherViewModels.enumerated() {
            XCTAssertEqual(round(viewModel.currentTemperature.temperature), round(celsiusTemperatures[index]))
        }
    }

    override func tearDown() {
        super.tearDown()
    }
}
