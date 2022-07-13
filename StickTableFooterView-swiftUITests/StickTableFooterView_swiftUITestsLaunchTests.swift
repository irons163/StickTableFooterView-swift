//
//  StickTableFooterView_swiftUITestsLaunchTests.swift
//  StickTableFooterView-swiftUITests
//
//  Created by Phil Chang on 2022/7/13.
//  Copyright © 2022 Yahoo. All rights reserved.
//

import XCTest

class StickTableFooterView_swiftUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
