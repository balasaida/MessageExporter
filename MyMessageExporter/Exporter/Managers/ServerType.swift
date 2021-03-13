//
//  ServerType.swift
//  MyMessageExporter
//
//  Created by Burri on 2021-03-13.
//  Copyright © 2021 burri. All rights reserved.
//

import Foundation

public enum ServerType {
    /// The Firebase server which takes app name, appId and firebasePath to initialize
    case firebase(appName: String, appId: String, firebasePath: String)
    /// The graphQL server which takes app name, appId and config path to initialize
    case graphQL(appName: String, appId: String, configPath: String)
    
    var exporter: MessageExportImplementable {
        switch self {
        case .firebase(let appName, let appId, let path):
            return FirebaseExporter(appName: appName, appId: appId, path: path)
        case .graphQL(let appName, let appId, let path):
            return GraphQLExporter(appName: appName, appId: appId, path: path)
        }
    }
}

/// MessageExportImplementable has three properties. Assume that these three are common among the severs. Since we crated the framework, different projects can pass their app name, id and path to framework and framework will take care of initializing and exporting.

/// This is an another approach to achieve the polymorphism.

protocol MessageExportImplementable {
    
    /// The appName takes the app name from the main project. And it helps the sdk to initialize the right sever(firebase/GraphQL) object relates to the specific project.
    var appName: String { get set }
    
   /// The appName takes the app id from the main project. And it helps the sdk to initialize the right sever(firebase/GraphQL) object relates to the specific project.
    var appId: String { get set }
    
    /// The path takes the server url or path from the main project. And it helps the sdk to initialize the right sever(firebase/GraphQL) object relates to the specific project.
    var path: String { get set }
    
    /// Export the message to server
    func export(message: Message)
}
