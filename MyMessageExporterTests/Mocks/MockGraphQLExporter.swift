//
//  MockGraphQLExporter.swift
//  MyMessageExporterTests
//
//  Created by Burri on 2021-03-13.
//  Copyright © 2021 burri. All rights reserved.
//

import Foundation
@testable import MyMessageExporter

struct MockGraphQLExporter: MessageExportImplementable {
    
    var appName: String
    var appId: String
    var path: String
}

extension MockGraphQLExporter {
    
    func export(message: Message) {
        switch message {
        case .annotation:
            print("Posted the annotation")
        case .comment:
            print("Posted the comment")
        }
    }
}
