//
//  GraphQLExporter.swift
//  MyMessageExporter
//
//  Created by Burri on 2021-03-13.
//  Copyright © 2021 burri. All rights reserved.
//

import Foundation

/// GraphQLExporter is Internal and you can not initialize from out side the framework. You can iniitalize and use this object via SeverType enum.
struct GraphQLExporter {
    
    var appName: String
    var appId: String
    var path: String
}

// MARK: - MessageExportImplementable
extension GraphQLExporter: MessageExportImplementable {

    /// This method take message object and upload to GraphQL sever. Assume that comment and annotation are calling the sdk methods and uploading the object.
    func export(message: Message) {
        switch message {
        case .comment(let userId, let message):
            print("Uploaded the comment to graphQL and details are \(userId), \(message)")
            // TODO: Needs to write original code to export to server
        case .annotation(let userId, let color, let image, let message):
            print("Uploaded the annotation to graphQL and details are \(userId), \(color), \(image), \(message)")

            // TODO: Needs to write original code to export to server
        }
    }
}
