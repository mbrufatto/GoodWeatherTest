//
//  SettingsViewModelTests.swift
//  GoodWeatherTests
//
//  Created by Marcio Brufatto on 18/12/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import XCTest
@testable import GoodWeather

class SettingsViewModelTests: XCTestCase {

    private var settingsViewModel: SettingsViewModel!
    
    override func setUp() {
        super.setUp()
        
        self.settingsViewModel = SettingsViewModel()
    }
    
    func test_should_return_correct_display_name_for_fahrenheit() {
        XCTAssertEqual(settingsViewModel.selectedUnit.displayName, "Fahrenheit")
    }
    
    func test_should_make_sure_that_default_selected_unit_is_fahrenheit() {
        XCTAssertEqual(settingsViewModel.selectedUnit, .fahrenheit)
    }

    func test_should_be_able_to_save_user_unit_selection() {
        
        self.settingsViewModel.selectedUnit = .celsius
        let userDefaults = UserDefaults.standard
        XCTAssertNotNil(userDefaults.value(forKey: "unit"))
    }
    
    override func tearDown() {
        super.tearDown()
        
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "unit")
    }
}
