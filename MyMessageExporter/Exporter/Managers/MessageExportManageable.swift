//
//  ExportManageable.swift
//  MyMessageExporter
//
//  Created by Burri on 2021-03-13.
//  Copyright © 2021 burri. All rights reserved.
//

import Foundation

public protocol MessageExportManageable {
    
    /// Export message to the servers
    ///
    /// - Parameters:
    ///   - message: comment or annotation message
    func export(message: Message)
}
