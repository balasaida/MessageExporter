//
//  MockMessageExportManager.swift
//  MyMessageExporterTests
//
//  Created by Burri on 2021-03-13.
//  Copyright © 2021 burri. All rights reserved.
//

import Foundation
@testable import MyMessageExporter

enum MockAppData: String {
    
    case appName = "ABC"
    case appId = "TestId"
    case path = "TestPath"
}

enum MockSeverType {
    case mockFirebase(appName: String, appId: String, path: String)
    case mockGraphQL(appName: String, appId: String, path: String)
    
    var exporter: MessageExportImplementable {
        switch self {
        case .mockFirebase(let appName, let appId, let path):
            return MockFirebaseExporter(appName: appName, appId: appId, path: path)
        case .mockGraphQL(let appName, let appId, let path):
            return MockGraphQLExporter(appName: appName, appId: appId, path: path)
        }
    }
}

final class MockMessageExportManager: MessageExportManager {
    
    init(types: [MockSeverType]) {
        super.init()
        types.forEach { exporters.append($0.exporter) }
    }
}
