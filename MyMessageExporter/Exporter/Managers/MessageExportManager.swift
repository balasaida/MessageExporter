//
//  ExporterManager.swift
//  MyMessageExporter
//
//  Created by Burri on 2021-03-13.
//  Copyright © 2021 burri. All rights reserved.
//

import Foundation

/// MessageExportManager takes different MessageExportImplementable and helps us to export the messages (comments and annotations)
public class MessageExportManager: MessageExportManageable {
    
    /// we did not add constraint like <Exporter: MessageExportImplementable> (whic will give us the compile time benefits) to the class because we want to different exporters. So, we are getting the runtime benefits than compile time.
    var exporters: [MessageExportImplementable] = [MessageExportImplementable]()
    
    public init(types: [ServerType]) {
        types.forEach { exporters.append($0.exporter) }
    }
    
    init() {}
}

extension MessageExportManager {
    
    public func export(message: Message) {
        exporters.forEach { $0.export(message: message) }
    }
}
