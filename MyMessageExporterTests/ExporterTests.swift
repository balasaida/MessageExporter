//
//  ExporterTests.swift
//  MyMessageExporterTests
//
//  Created by Burri on 2021-03-13.
//  Copyright © 2021 burri. All rights reserved.
//

import XCTest
@testable import MyMessageExporter

class ExporterTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testExportServers() {
        // Given the manager with two exporter severs firebase and graphQL
        let manager: MockMessageExportManager = MockMessageExportManager(types: [.mockFirebase(appName: MockAppData.appName.rawValue, appId: MockAppData.appId.rawValue, path: MockAppData.path.rawValue), .mockGraphQL(appName: MockAppData.appName.rawValue, appId: MockAppData.appId.rawValue, path: MockAppData.path.rawValue)])
        
        // Then the manager exporters count should be equal to 2
        XCTAssertEqual(manager.exporters.count, 2)
        
        // Then the first message exporter type should be Mock Firebase
        XCTAssertTrue(manager.exporters.first is MockFirebaseExporter)
        
        // Then the second type should be Mock graph QL
        XCTAssertTrue(manager.exporters[1] is MockGraphQLExporter)
        
        if let exporter: MockFirebaseExporter = manager.exporters.first as? MockFirebaseExporter {
            
            // Then the exporter app name should be equal to "ABC"
            XCTAssertEqual(exporter.appName, "ABC")
            
            // Then the app id should be equal to "TestId"
            XCTAssertEqual(exporter.appId, "TestId")
            
            // Then the app path should be equal to "TestPath"
            XCTAssertEqual(exporter.path, "TestPath")
        }
        
        if let exporter: MockGraphQLExporter = manager.exporters[1] as? MockGraphQLExporter {
            
            // Then the exporter app name should be equal to "ABC"
            XCTAssertEqual(exporter.appName, "ABC")
            
            // Then the app id should be equal to "TestId"
            XCTAssertEqual(exporter.appId, "TestId")
            
            // Then the app path should be equal to "TestPath"
            XCTAssertEqual(exporter.path, "TestPath")
            
        }
    }
}
